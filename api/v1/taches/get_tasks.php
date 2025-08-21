<?php
// /api/v1/taches/get_tasks.php

require_once __DIR__ . '/../config/Database.php';

Database::bootstrap();

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
        throw new Exception("Méthode non autorisée.", 405);
    }

    // L'ID de l'utilisateur est codé en dur pour le moment
    $user_id = 2;
    $status = isset($_GET['status']) && $_GET['status'] === 'completed' ? 'completed' : 'pending';

    $database = new Database();
    $db = $database->getConnection();

    $query = "
        SELECT 
            t.id, 
            t.title,
            t.due_date,
            t.due_time,
            t.status,
            tu.name as urgency_name,
            tu.color as urgency_color
        FROM tasks t
        LEFT JOIN task_urgencies tu ON t.urgency_id = tu.id
        WHERE t.user_id = :user_id AND t.status = :status
        ORDER BY t.due_date, t.due_time ASC";

    $stmt = $db->prepare($query);
    $stmt->bindParam(':user_id', $user_id);
    $stmt->bindParam(':status', $status, PDO::PARAM_STR);
    $stmt->execute();

    $tasks_arr = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (empty($tasks_arr)) {
        http_response_code(200);
        echo json_encode([
            "status" => "success",
            "message" => "Aucune tâche trouvée.",
            "records" => []
        ]);
        exit;
    }

    http_response_code(200);
    echo json_encode([
        "status" => "success",
        "message" => "Tâches récupérées avec succès.",
        "records" => $tasks_arr
    ]);
} catch (Exception $e) {
    http_response_code($e->getCode() ?: 400);
    echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
    ]);
}
