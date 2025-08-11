<?php
// /api/v1/notes/add_note.php

require_once __DIR__ . '/../config/Database.php';

Database::bootstrap();

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        throw new Exception("Méthode non autorisée.", 405);
    }

    $data = json_decode(file_get_contents("php://input"));

    if (!isset($data->userId)) {
        throw new Exception("ID utilisateur requis.", 400);
    }

    $user_id = $data->userId;
    $title = isset($data->title) ? $data->title : "Nouvelle note";
    $content = isset($data->content) ? $data->content : "";
    $label_id = isset($data->label_id) && $data->label_id !== "" ? (int) $data->label_id : null;

    $database = new Database();
    $db = $database->getConnection();

    $query = "INSERT INTO notes (user_id, title, content, label_id) VALUES (:user_id, :title, :content, :label_id)";

    $stmt = $db->prepare($query);
    $stmt->bindParam(':user_id', $user_id);
    $stmt->bindParam(':title', $title);
    $stmt->bindParam(':content', $content);
    $stmt->bindParam(':label_id', $label_id, PDO::PARAM_INT);

    if ($stmt->execute()) {
        $lastId = $db->lastInsertId();

        $record = [
            "id" => $lastId,
            "user_id" => $user_id,
            "title" => $title,
            "content" => $content,
            "label_id" => $label_id,
            "label_name" => null,
            "label_color" => null,
            "status" => "active", // Ajout du statut par défaut
            "created_at" => date('Y-m-d H:i:s'),
        ];

        http_response_code(201);
        echo json_encode([
            "status" => "success",
            "message" => "Note créée avec succès.",
            "record" => $record
        ]);
    } else {
        throw new Exception("Échec de la création de la note.", 500);
    }
} catch (Exception $e) {
    http_response_code($e->getCode() ?: 400);
    echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
    ]);
}
