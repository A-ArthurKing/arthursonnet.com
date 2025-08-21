<?php
// /api/v1/taches/update_task.php

require_once __DIR__ . '/../config/Database.php';

Database::bootstrap();

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'POST' && $_SERVER['REQUEST_METHOD'] !== 'PUT') {
        throw new Exception("Méthode non autorisée.", 405);
    }

    $data = json_decode(file_get_contents("php://input"));

    if (!isset($data->id) || !isset($data->status)) {
        throw new Exception("ID de la tâche et statut requis.", 400);
    }

    $id = $data->id;
    $status = $data->status;
    $completed_at = ($status === 'completed') ? date('Y-m-d H:i:s') : null;

    $database = new Database();
    $db = $database->getConnection();

    $query = "UPDATE tasks SET status = :status, completed_at = :completed_at WHERE id = :id";
    $stmt = $db->prepare($query);

    $stmt->bindParam(':id', $id, PDO::PARAM_INT);
    $stmt->bindParam(':status', $status);
    $stmt->bindParam(':completed_at', $completed_at);

    if ($stmt->execute()) {
        http_response_code(200);
        echo json_encode([
            "status" => "success",
            "message" => "Tâche mise à jour avec succès."
        ]);
    } else {
        throw new Exception("Échec de la mise à jour de la tâche.", 500);
    }
} catch (Exception $e) {
    http_response_code($e->getCode() ?: 400);
    echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
    ]);
}
