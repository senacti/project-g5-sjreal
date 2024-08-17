<?php

if (isset($_POST['username'])) {
    try {
        $pdo = new PDO('mysql:host=mysql;dbname=sjreal;charset=utf8mb4', 'root', '');
        $sql = "INSERT INTO `personas`  SET
        `nombre_persona` = :nombre_persona, 
        `apellido_persona` = :apellido_persona, 
        `documento_persona` = :documento_persona, 
        `telefono_persona` = :telefono_persona, 
        `correo_persona` = :correo_persona, 
        `tipo_documento` = :tipo_documento, 
        `nacionalidad` = :nacionalidad, 
        `tipo_persona` = :tipo_persona";

        $stmt = $pdo->prepare($sql);

        $stmt->bindValue(':nombre_persona', $_POST['first_name']);
        $stmt->bindValue(':apellido_persona', $_POST['last_name']);
        $stmt->bindValue(':documento_persona', $_POST['document_number']);
        $stmt->bindValue(':telefono_persona', $_POST['phone_number']);
        $stmt->bindValue(':correo_persona', $_POST['email']);
        $stmt->bindValue(':tipo_documento', $_POST['document_type']);
        $stmt->bindValue(':nacionalidad', 'colombiana');
        $stmt->bindValue(':tipo_persona', 'natural');

        if ($stmt->execute()) {
            header('Location: index.php');
        }
        
    } catch (PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
} else {
    $title = "Registro nuevo usuario";

    ob_start();

    include '../templates/registro.html.php';

    $output = ob_get_clean();

    include 'templates/layout.html.php';
}