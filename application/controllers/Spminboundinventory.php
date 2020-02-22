<?php
defined('BASEPATH') or exit('No direct script access allowed');
// Don't forget include/define REST_Controller path

/**
 *
 * Controller Spminboundinventory
 *
 * This controller for ...
 *
 * @package   CodeIgniter
 * @category  Controller CI
 * @author    Setiawan Jodi <jodisetiawan@fisip-untirta.ac.id>
 * @author    Raul Guerrero <r.g.c@me.com>
 * @link      https://github.com/setdjod/myci-extension/
 * @param     ...
 * @return    ...
 *
 */

class Spminboundinventory extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('spminbound_model');
    }

    public function index()
    {
        $this->load->view('header');
        $this->load->view('spm/inboundinventory/inboundmonitoring');
        $this->load->view('footer');
    }

    public function showinboundinventory()
    {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));
        $order = $this->input->post("order");
        $search = $this->input->post("search");
        $search = $search['value'];
        $col = 0;
        $dir = "desc";
        if (!empty($order)) {
            foreach ($order as $o) {
                $col = $o['column'];
                $dir = $o['dir'];
            }
        }

        if ($dir != "asc" && $dir != "desc") {
            $dir = "desc";
        }
        $valid_columns = array(
      0 => 'InboundId',
      1 => 'ArNo',
      2 => 'DateIn',
      3 => 'LogDate'
    );
        if (!isset($valid_columns[$col])) {
            $order = null;
        } else {
            $order = $valid_columns[$col];
        }
        if ($order != null) {
            $this->db->order_by($order, $dir);
        }

        if (!empty($search)) {
            $x = 0;
            foreach ($valid_columns as $sterm) {
                if ($x == 0) {
                    $this->db->like($sterm, $search);
                } else {
                    $this->db->or_like($sterm, $search);
                }
                $x++;
            }
        }
        $this->db->limit($length, $start);
        $inbounditems = $this->db->get("spm_inbound_inventory");
        $data = array();
        foreach ($inbounditems->result() as $rows) {
            $data[] = array(
        $rows->InboundId,
        $rows->ArNo,
        mdate('%M %d %Y', strtotime($rows->DateIn)),
        '<a href="#" class="btn btn-warning mr-1">View Details</a>'
      );
        }
        $total_hubitems = $this->countinbounditems();
        $output = array(
      "draw" => $draw,
      "recordsTotal" => $total_hubitems,
      "recordsFiltered" => $total_hubitems,
      "data" => $data
    );
        echo json_encode($output);
        exit();
    }

    public function countinbounditems()
    {
        $query = $this->db->select("COUNT(*) as num")->get("spm_inbound_inventory");
        $result = $query->row();
        if (isset($result)) {
            return $result->num;
        }
        return 0;
    }

    public function additem()
    {
        $this->load->view('header');
        $this->load->view('spm/inboundinventory/additem');
        $this->load->view('footer');
    }

    public function createitem()
    {
        $arno = $this->input->post("arno");
        $datein = $this->input->post("datein");
        $itemid = $this->input->post("itemid");
        $itemqty = $this->input->post("itemqty");

        $result = $this->spminbound_model->add_spm_inbound_inventory($itemid, $itemqty, $datein, $arno);
        
        json_encode($result);
        //redirect('/dashboard/spminboundinventoryaddsuccess');
        //print_r($result);
    }

    public function createitemsuccess()
    {
      $this->load->view('header');
      $this->load->view('spm/inboundinventory/additemsuccess');
      $this->load->view('footer');
    }

    public function getallspmitem()
    {
        $postData = $this->input->post();
        $result = $this->spminbound_model->get_all_part_no($postData);
        echo json_encode($result);
    }
}


/* End of file Spminboundinventory.php */
/* Location: ./application/controllers/Spminboundinventory.php */
