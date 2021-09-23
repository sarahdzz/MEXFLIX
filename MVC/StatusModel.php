<?php
require_once('Model.php');

class StatusModel extends Model
{
    public $status_id;
    public $status;


    public function __construct()
    {
        $this->db_name = 'mexflix';
    }

    public function create($status_data = array())
    {
        foreach ($status_data as $key => $value) {
            $$key = $value;
        }
        $this->query = "INSERT INTO status (status_id, status) VALUES ($status_id, '$status')";
        $this->set_query();
    }
    //read=consultar->select->status
    public function read($status_id = '')
    {
        /*?true:false Operador ternario*/
        $this->query = ($status_id != '')
            ? "SELECT * FROM status WHERE status_id = $status_id"
            : "SELECT * FROM status";
        /*segunda forma con if-else
            if($status_id != '') { $sql = "SELECT * FROM status WHERE status_id = $status_id";}else{ $sql = "SELECT * FROM status";}  */

        $this->get_query();
        $num_rows = count($this->rows);
        $data = array();
        foreach ($this->rows as $key => $value) {
            //array_push — Inserta uno o más elementos al final de un array
            array_push($data, $value);
        }
        return $data;
    }

    public function update($status_data = array())
    {
        foreach ($status_data as $key => $value) {
            $$key = $value;
        }

        $this->query = "UPDATE status SET status_id = $status_id, status = '$status' WHERE status_id = $status_id";
        $this->set_query();
    }
    public function delete($status_id = '')
    {
        $this->query = "DELETE FROM status WHERE status_id = $status_id";
        $this->set_query();
    }



    public function __destruct()
    {

        unset($this->db_name);
    }
}
