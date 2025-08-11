<?php
// /api/v1/notes/read.php

require_once __DIR__ . '/../config/Database.php';

Database::bootstrap();

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
        throw new Exception("Méthode non autorisée.", 405);
    }

    $user_id = 2; // Remplacer par l'ID de l'utilisateur authentifié

    $database = new Database();
    $db = $database->getConnection();

    $query = "
        SELECT 
            n.id, 
            n.title, 
            n.content,
            n.created_at,
            nl.name as label_name,
            nl.color as label_color
        FROM notes n
        LEFT JOIN note_labels nl ON n.label_id = nl.id
        WHERE n.user_id = :user_id AND n.status = 'active'
        ORDER BY n.created_at DESC
        LIMIT 5"; // Limite les résultats aux 5 dernières notes

    $stmt = $db->prepare($query);
    $stmt->bindParam(':user_id', $user_id);
    $stmt->execute();

    $notes_arr = $stmt->fetchAll(PDO::FETCH_ASSOC);

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
