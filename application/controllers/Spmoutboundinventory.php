<?php
defined('BASEPATH') or exit('No direct script access allowed');
// Don't forget include/define REST_Controller path

/**
 *
 * Controller Spmoutboundinventory
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

class Spmoutboundinventory extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('spmoutbound_model');
    }

    public function index()
    {
        $this->load->view('header');
        $this->load->view('spm/outboundinventory/outboundmonitoring');
        $this->load->view('footer');
    }

    public function showoutboundinventory()
    {
        $draw = intval($this->input->post("draw"));
        $start = intval($this->input->post("start"));
        $length = intval($this->input->post("length"));
        $order = $this->input->post("order");
        $search = $this->input->post("search");
        $search = $search['value'];
        $col = 0;
        $dir = "";
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
      0 => 'WmDrNo',
      1 => 'ApcDrNo',
      2 => 'DateOut'
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
        $inbounditems = $this->db->get("spm_outbound_inventory");
        $data = array();
        foreach ($inbounditems->result() as $rows) {
            $data[] = array(
        $rows->ControlSeries.'-'.$rows->WmDrNo,
        $rows->ApcDrNo,
        mdate('%M %d %Y', strtotime($rows->DateOut)),
        '<a href="#" class="btn btn-warning mr-1">View Details</a>
                '
      );
        }
        $total_outbounditems = $this->countoutbounditems();
        $output = array(
      "draw" => $draw,
      "recordsTotal" => $total_outbounditems,
      "recordsFiltered" => $total_outbounditems,
      "data" => $data
    );
        echo json_encode($output);
        exit();
    }

    public function countoutbounditems()
    {
        $query = $this->db->select("COUNT(*) as num")->get("spm_outbound_inventory");
        $result = $query->row();
        if (isset($result)) {
            return $result->num;
        }
        return 0;
    }

    public function additem()
    {
        $data['facilities'] = $this->spmoutbound_model->get_facilities();
        $data['vehicles'] = $this->spmoutbound_model->get_vehicles();
        $data['wmdrno'] = $this->spmoutbound_model->get_wmdrno_series();

        $this->load->view('header');
        $this->load->view('spm/outboundinventory/addoutbounditem', $data);
        $this->load->view('footer');
    }

    public function getalloutboundpartno()
    {
        $postData = $this->input->post();
        $result = $this->spmoutbound_model->get_all_part_no($postData);
        echo json_encode($result);
    }
}


/* End of file Spmoutboundinventory.php */
/* Location: ./application/controllers/Spmoutboundinventory.php */
