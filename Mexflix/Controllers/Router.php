<?php
class Router
{

    public $route;

    public function __construct($route)
    {
        if (!isset($_SESSION)) {
            //session_start — Iniciar una nueva sesión o reanudar la existente
            session_start([
                'use_only_cookies' => 1, // especifica si el módulo sólo usará cookies para almacenar el id de sesión en la parte del cliente. 
                'auto_star' => 1, // si el módulo de sesión inicia una sesión automáticamente cuando arranque una petición.
                'read_and_close' => true // cierre de sesion en auto cuando no se ocupa
            ]);

            $_SESSION['ok'] = false;
        }


        if ($_SESSION['ok']) {
            //si la variable sesion okey aqui va la rpogramacion

        } else {
            //sino mostrar el formulario de autenticacion

        }
    }

    public function __destruct()
    {
        unset($this);
    }
}
