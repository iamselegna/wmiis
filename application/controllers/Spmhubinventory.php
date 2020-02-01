<?php
defined('BASEPATH') or exit('No direct script access allowed');
// Don't forget include/define REST_Controller path

/**
 *
 * Controller Spmhubinventory
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

class Spmhubinventory extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Spmhub_model');
    }

    public function index()
    {
        $this->load->view('header');
        $this->load->view('spm/hubinventory/hubmonitoring');
        $this->load->view('footer');
    }

    public function showhubinventory()
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
      0 => 'ItemId',
      1 => 'PartNo',
      2 => 'StockOnHand',
      3 => 'LastUpdate'
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
        $hubitems = $this->db->get("spm_hub_inventory");
        $data = array();
        foreach ($hubitems->result() as $rows) {
            $data[] = array(
        $rows->ItemId,
        $rows->PartNo,
        $rows->StockOnHand,
        mdate('%M %d %Y', strtotime($rows->LastUpdate)),
        '<a href="#" class="btn btn-warning mr-1">Edit</a>
                 <a href="#" class="btn btn-danger mr-1">Delete</a>'
      );
        }
        $total_hubitems = $this->counthubitems();
        $output = array(
      "draw" => $draw,
      "recordsTotal" => $total_hubitems,
      "recordsFiltered" => $total_hubitems,
      "data" => $data
    );
        echo json_encode($output);
        exit();
    }

    public function counthubitems()
    {
        $query = $this->db->select("COUNT(*) as num")->get("spm_hub_inventory");
        $result = $query->row();
        if (isset($result)) {
            return $result->num;
        }
        return 0;
    }

    public function additem()
    {
        $this->load->view('header');
        $this->load->view('spm/hubinventory/additem');
        $this->load->view('footer');
    }

    public function create()
    {
        $this->form_validation->set_rules('partno', 'Part No', 'required');

        $result = null;

        if ($this->form_validation->run() == false) {
            $result = array(
                'error' => true,
                'message' => 'Part No is Required.');

            $this->output
                ->set_content_type('application/json')
                ->set_output(json_encode($result));
        } else {
            $result = $this->Spmhub_model->add_spm_hub_item();
            $this->output
                ->set_content_type('application/json')
                ->set_output(json_encode($result));
        }
    }

    public function generaterandom()
    {
        $itemcount = $this->Spmhub_model->get_spm_hub_item_count();

        $this->form_validation->set_rules('recordno', 'No of records', 'required|numeric|less_than_equal_to['.$itemcount['ItemCount'].']|greater_than[0]');
        if ($this->form_validation->run() == false) {
            $this->load->view('header');
            $this->load->view('spm/hubinventory/generaterandominventory', $itemcount);
            $this->load->view('footer');
        } else {
            $data['rows'] = $this->Spmhub_model->get_spm_random_inventory($this->input->post('recordno'));
            
            $this->load->view('spm/hubinventory/printrandominventory',$data);
        }
    }
}


/* End of file Spmhubinventory.php */
/* Location: ./application/controllers/Spmhubinventory.php */
