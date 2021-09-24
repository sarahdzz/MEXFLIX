<?php
require_once('./Controllers/Autoload.php');
$autoload = new Autoload();

$route = (isset($_GET['r'])) ? $_GET['r'] : 'home'; //isst para saber si una variable esta definida o no
$mexflix = new Router($route);
