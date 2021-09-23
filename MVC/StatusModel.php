<?php
require_once('Model.php');

class StatusModel extends Model
{
    public $status_idSM;
    public $status;


    public function __construct()
    {
        $this->db_name = 'mexflix';
    }

    public function create()
    {
    }
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

    public function update()
    {
    }
    public function delete()
    {
    }



    public function __destruct()
    {

        unset($StatusModel);
    }
}
