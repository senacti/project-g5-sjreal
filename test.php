<?php
try {
    $pdo = new PDO('mysql:host=localhost;dbname=sjreal;charset=utf8mb4', 'root', '');
    $result = "Conexion establecida";
} catch (PDOException $e) {
    $error = 'Unable to connect to the database server: ' . $e->getMessage() . ' in ' . $e->getFile() . ':' . $e->getLine();
}

include "result.html.php";