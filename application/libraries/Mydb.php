<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 *
 * Libraries Mydb
 *
 * This Libraries for ...
 * 
 * @package		CodeIgniter
 * @category	Libraries
 * @author    Setiawan Jodi <jodisetiawan@fisip-untirta.ac.id>
 * @link      https://github.com/setdjod/myci-extension/
 * @param     ...
 * @return    ...
 *
 */

class Mydb
{

  // ------------------------------------------------------------------------
  protected $CI, $mysqli;

  public function __construct()
  {
    $this->CI = &get_instance();
    $this->mysqli = $this->CI->db->conn_id;
  }

  // ------------------------------------------------------------------------


  // ------------------------------------------------------------------------

  public function index()
  {
    // 
  }

  public function get_multi_result($SqlCommand)
  {
    $x = 0;
    $result_sets = array();

    if ($this->mysqli->multi_query($SqlCommand)) {
      do {
        $this->mysqli->next_result();
        if ($result = $this->mysqli->store_result()) {
          while ($row = $result->fetch_assoc()) {
            $result_sets[$x][] = $row;
          }
          $result->free();
          $x++;
        }
      } while ($this->mysqli->more_results());
    }
    return $result_sets;
    $this->mysqli->close();
  }

  // ------------------------------------------------------------------------
}

/* End of file Mydb.php */
/* Location: ./application/libraries/Mydb.php */
