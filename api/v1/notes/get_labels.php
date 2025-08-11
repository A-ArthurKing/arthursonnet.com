<?php
// /api/v1/notes/get_labels.php

// Inclusion de la classe de configuration unifiée
require_once __DIR__ . '/../config/Database.php';

// Exécution de la configuration (CORS, erreurs, etc.)
Database::bootstrap();

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
        throw new Exception("Méthode non autorisée.", 405);
    }

    // Remplacer par l'ID de l'utilisateur authentifié
    $user_id = 2;

    $database = new Database();
    $db = $database->getConnection();

    $query = "
        SELECT 
            id, 
            name,
            color
        FROM note_labels 
        WHERE user_id = :user_id
        ORDER BY name ASC";

    $stmt = $db->prepare($query);
    $stmt->bindParam(':user_id', $user_id);
    $stmt->execute();

    $num = $stmt->rowCount();
    $labels_arr = [];

    if ($num > 0) {
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $labels_arr[] = $row;
        }
    }

    http_response_code(200);
    echo json_encode([
        "status" => "success",
        "message" => "Labels récupérés avec succès.",
        "records" => $labels_arr
    ]);
} catch (Exception $e) {
    http_response_code($e->getCode() ?: 400);
    echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
    ]);
}
