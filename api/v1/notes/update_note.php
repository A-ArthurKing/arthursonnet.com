<?php
// /api/v1/notes/update_note.php

require_once __DIR__ . '/../config/Database.php';

Database::bootstrap();

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'PUT') {
        throw new Exception("Méthode non autorisée.", 405);
    }

    $data = json_decode(file_get_contents("php://input"));

    if (!isset($data->id) || (!isset($data->title) && !isset($data->content) && !isset($data->label_id) && !isset($data->status))) {
        throw new Exception("ID, titre, contenu, label ou statut de la note requis.", 400);
    }

    $database = new Database();
    $db = $database->getConnection();

    $id = $data->id;
    $title = isset($data->title) ? $data->title : null;
    $content = isset($data->content) ? $data->content : null;
    $label_id = isset($data->label_id) ? (is_null($data->label_id) ? null : (int) $data->label_id) : null;
    $status = isset($data->status) ? $data->status : null;
    $updated_at = date('Y-m-d H:i:s');

    $query = "UPDATE notes SET ";
    $params = [];
    $set_parts = [];

    if ($title !== null) {
        $set_parts[] = "title = :title";
        $params[':title'] = $title;
    }

    if ($content !== null) {
        $set_parts[] = "content = :content";
        $params[':content'] = $content;
    }

    if (isset($data->label_id)) {
        $set_parts[] = "label_id = :label_id";
        $params[':label_id'] = $label_id;
    }

    if (isset($data->status)) {
        $set_parts[] = "status = :status";
        $params[':status'] = $status;
    }

    $set_parts[] = "updated_at = :updated_at";
    $params[':updated_at'] = $updated_at;

    $query .= implode(", ", $set_parts) . " WHERE id = :id";
    $params[':id'] = $id;

    $stmt = $db->prepare($query);

    foreach ($params as $key => &$val) {
        $stmt->bindParam($key, $val);
    }

    if ($stmt->execute()) {
        http_response_code(200);
        echo json_encode(["status" => "success", "message" => "Note mise à jour avec succès."]);
    } else {
        throw new Exception("Échec de la mise à jour de la note.", 500);
    }
} catch (Exception $e) {
    http_response_code($e->getCode() ?: 400);
    echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
    ]);
}
