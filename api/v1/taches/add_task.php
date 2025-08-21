<?php
// /api/v1/taches/add_task.php

require_once __DIR__ . '/../config/Database.php';

Database::bootstrap();

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        throw new Exception("Méthode non autorisée.", 405);
    }

    $data = json_decode(file_get_contents("php://input"));

    if (!isset($data->userId) || !isset($data->title)) {
        throw new Exception("ID utilisateur et titre requis.", 400);
    }

    $user_id = $data->userId;
    $title = htmlspecialchars(strip_tags($data->title));
    $urgency_id = isset($data->urgency_id) ? (int) $data->urgency_id : null;
    $due_date = isset($data->due_date) ? $data->due_date : null;
    $due_time = isset($data->due_time) ? $data->due_time : null;

    $database = new Database();
    $db = $database->getConnection();

    $query = "INSERT INTO tasks (user_id, urgency_id, title, due_date, due_time) VALUES (:user_id, :urgency_id, :title, :due_date, :due_time)";

    $stmt = $db->prepare($query);
    $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
    $stmt->bindParam(':urgency_id', $urgency_id, PDO::PARAM_INT);
    $stmt->bindParam(':title', $title);
    $stmt->bindParam(':due_date', $due_date);
    $stmt->bindParam(':due_time', $due_time);

    if ($stmt->execute()) {
        $lastId = $db->lastInsertId();
        http_response_code(201);
        echo json_encode([
            "status" => "success",
            "message" => "Tâche créée avec succès.",
            "record" => [
                "id" => $lastId,
                "user_id" => $user_id,
                "title" => $title,
                "urgency_id" => $urgency_id,
                "due_date" => $due_date,
                "due_time" => $due_time,
                "status" => "pending",
                "created_at" => date('Y-m-d H:i:s')
            ]
        ]);
    } else {
        throw new Exception("Échec de la création de la tâche.", 500);
    }
} catch (Exception $e) {
    http_response_code($e->getCode() ?: 400);
    echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
    ]);
}
