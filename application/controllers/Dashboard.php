<?php
defined('BASEPATH') or exit('No direct script access allowed');
// Don't forget include/define REST_Controller path

/**
 *
 * Controller Dashboard
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

class Dashboard extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->load->model('spmhub_model');
        $this->load->model('spminbound_model');
        $this->load->model('spmoutbound_model');
    }

    public function index()
    {
        $data = $this->spmhub_model->count_spm_hub_inventory();
        $data['InboundCount'] = $this->spminbound_model->count_inbound_today();
        $data['OutboundCount'] = $this->spmoutbound_model->count_outbound_today();

        $this->load->view('header');
        $this->load->view('dashboard', $data);
        $this->load->view('footer');
    }
}


/* End of file Dashboard.php */
/* Location: ./application/controllers/Dashboard.php */
