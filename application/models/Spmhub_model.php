<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 *
 * Model Spmhub_model
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

class Spmhub_model extends CI_Model {

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

  public function add_spm_hub_item()
    {
        $partNo = $this->input->post('partno');
        $result = null;

        $query = $this->db->select('PartNo')
            ->where('PartNo', $partNo)
            ->get('spm_hub_inventory');

        if ($query->num_rows() >= 1) {
            $result = array(
                'error' => true,
                'message' => 'Duplicate Item Found .');
        } else {
            try {
                $this->db->reconnect();
                $this->db->query('Call AddSpmHubInventoryItem(?,?)', array('PartNo' => $partNo, 'LastUpdate' => mdate("%Y-%m-%d", time())));
                $this->db->close();
                $result = array(
                    'error' => false,
                    'message' => 'Add Item Success.');
            } catch (Exception $e) {
                $result = array(
                    'error' => true,
                    'message' => 'Failed to add new item.');
            }
        }

        return $result;
    }
  // ------------------------------------------------------------------------

}

/* End of file Spmhub_model.php */
/* Location: ./application/models/Spmhub_model.php */