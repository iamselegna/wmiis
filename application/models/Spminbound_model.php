<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 *
 * Model Spminbound_model
 *
 * This Model for ...
 *
 * @package		CodeIgniter
 * @category	Model
 * @author    Setiawan Jodi <jodisetiawan@fisip-untirta.ac.id>
 * @link      https://github.com/setdjod/myci-extension/
 * @param     ...
 * @return    ...
 *
 */

class Spminbound_model extends CI_Model
{

    // ------------------------------------------------------------------------

    public function __construct()
    {
        parent::__construct();
    }

    // ------------------------------------------------------------------------


    // ------------------------------------------------------------------------
    public function index()
    {
        //
    }

    public function get_all_part_no($postData)
    {
        $response = array();

        if (isset($postData['search'])) {
            $this->db->select('*')
                ->where("PartNo like '%" . $postData['search'] . "%'");

            $records = $this->db->get('spm_hub_inventory')->result();

            foreach ($records as $rows) {
                $response[] = array("label" => $rows->PartNo, "value" => $rows->ItemId);
            }
        }

        return $response;
    }

    public function add_spm_inbound_inventory($itemid, $itemqty, $datein, $arno)
    {
        $this->db->reconnect();

        $inboundinventoryid = null;

        $inbounditem = array();

        $updatehubitem = array();

        $returnmessage = array();

        /**
         * Generate Universal Uniquer Identifier "UUID"
         * This will be the value of OutboundId
         * for current outbound inventory and items
         */
        $uid_query = $this->db->query("SELECT UUID() as id;");
        $uuidrow = $uid_query->row();
        $uuid = $uuidrow->id;

        $logdate = mdate('%Y-%m-%d %H:%i:%s', now());

        $inboundinvdata = array('InboundId' => $uuid, 'ArNo' => $arno, 'DateIn' => $datein, 'LogDate' => $logdate);

        //INSERT INBOUND INVENTORY DATA
        $this->db->insert('spm_inbound_inventory', $inboundinvdata);
        /* if () {

            //GET INSERT ID OF INBOUND DATA
            $inboundinventoryid = $this->db->insert_id();
            $returnmessage['insertid'] = $inboundinventoryid;
        } */

        foreach ($itemid as $key => $i) {
            // Add item array
            $inbounditem[] = array("ItemID" => $i, "Qty" => $itemqty[$key], "InboundId" => $uuid);

            // Select Hub Item Qty
            $query = $this->db->select('StockOnHand')->from('spm_hub_inventory')
                ->where('ItemId', $i)
                ->get();
            $row = $query->row();
            $dbqty = $row->StockOnHand;
            $newqty = ($dbqty + $itemqty[$key]);

            $updatehubitem[] = array("ItemId" => $i, "StockOnHand" => $newqty, "LastUpdate" => mdate("%Y-%m-%d", time()));
        }

        $returnmessage['inbounditem'] = $inbounditem;

        //INSERT INTO TABLE
        $this->db->insert_batch('spm_inbound_inventory_item', $inbounditem);

        $returnmessage['insertbatchquery'] = $this->db->last_query();

        //Update Spm hub inventory Stock On Hand to new value
        $this->db->update_batch('spm_hub_inventory', $updatehubitem, 'ItemId');

        $returnmessage['updatebatchquery'] = $this->db->last_query();

        $returnmessage['error'] = false;
        $returnmessage['redirect'] = base_url('/dashboard/spminboundinventoryaddsuccess');
        $this->db->close();

        return $returnmessage;
    }

    public function count_inbound_today()
    {
        $this->db->reconnect();

        $query = $this->db->select('COUNT(*) as InboundCount')->from('spm_inbound_inventory')->where('DateIn = ', time())->get();
        $rows = $query->row();

        if ($rows !== null) {
            $data = $rows->InboundCount;
            return $data;
        }

        $this->db->close();
    }



    // ------------------------------------------------------------------------
}

/* End of file Spminbound_model.php */
/* Location: ./application/models/Spminbound_model.php */
