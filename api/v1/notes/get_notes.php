<?php
// /api/v1/notes/get_notes.php

require_once __DIR__ . '/../config/Database.php';

Database::bootstrap();

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
        throw new Exception("Méthode non autorisée.", 405);
    }

    $user_id = 2;
    $status = isset($_GET['status']) && $_GET['status'] === 'archived' ? 'archived' : 'active';

    $database = new Database();
    $db = $database->getConnection();

    $query = "
        SELECT 
            n.id, 
            n.title, 
            n.content,
            n.created_at,
            n.status,
            nl.name as label_name,
            nl.color as label_color
        FROM notes n
        LEFT JOIN note_labels nl ON n.label_id = nl.id
        WHERE n.user_id = :user_id AND n.status = :status
        ORDER BY n.created_at DESC";

    $stmt = $db->prepare($query);
    $stmt->bindParam(':user_id', $user_id);
    $stmt->bindParam(':status', $status, PDO::PARAM_STR);
    $stmt->execute();

    $notes_arr = $stmt->fetchAll(PDO::FETCH_ASSOC);

    if (empty($notes_arr)) {
        http_response_code(200);
        echo json_encode([
            "status" => "success",
            "message" => "Aucune note trouvée.",
            "records" => []
        ]);
        exit;
    }

    http_response_code(200);
    echo json_encode([
        "status" => "success",
        "message" => "Notes récupérées avec succès.",
        "records" => $notes_arr
    ]);
} catch (Exception $e) {
    http_response_code($e->getCode() ?: 400);
    echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
    ]);
}
