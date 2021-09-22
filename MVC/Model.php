<?php
// CONEXION Y CONSULTAS A LA BD

abstract class Model
{
    //Atributos
    private static $db_host = 'localhost';
    private static $db_user = 'root';
    private static $db_pass = '';
    //private static $db_name = 'mexflix';
    protected $db_name;
    private static $db_charset = 'utf8';
    // guarda la conexion a mysql
    private $conn;
    //para hacer consultas
    protected $query;
    //trae registros(ROWS) de la bd 
    protected $rows = array();

    //METODOS
    // metodos abstracttos para crun de clases que hereden

    abstract protected function create();
    abstract protected function read();
    abstract protected function update();
    abstract protected function delete();

    // metodo privado para conectarse ala bd  solo este metodo se conectara

    private function db_open()
    {
        //http://php.net/manual/es/class.mysqli.php
        //http://php.net/manual/es/mysqli.construct.php
        $this->conn = new mysqli(
            self::$db_host,
            self::$db_user,
            self::$db_pass,
            $this->db_name
        );
        //http://php.net/manual/es/mysqli.set-charset.php 
        $this->conn->set_charset(self::$db_charset);
    }

    //http://php.net/manual/es/mysqli.close.php

    // metodo privado para desconectarse de la bd
    private function db_close()
    {

        $this->conn->close();
    }

    // establece un query que afecte datos INSERT, DELETE UPDATE (set-modificar datos)

    protected function set_query()
    {
        $this->db_open();
        //http://php.net/manual/es/mysqli.query.php
        //mysqli::query -- mysqli_query — Realiza una consulta a la base de datos
        $this->conn->query($this->query);
        $this->db_close();
    }

    // OBTENER DATOS DE UN QUERY (SELECT)( get-obtenemos informacion)

    protected function get_query()
    {
        $this->db_open();

        $result = $this->conn->query($this->query);
        //http://php.net/manual/es/mysqli-result.fetch-assoc.php  Obtener una fila de resultado como un array 
        //http://php.net/manual/es/mysqli-result.fetch-row.php — Obtener una fila de resultados como un array enumerado
        while ($this->rows[] = $result->fetch_assoc());
        $result->close();

        $this->db_close();

        return array_pop($this->rows);
    }
}
