<?php
// /api/v1/taches/get_urgencies.php

require_once __DIR__ . '/../config/Database.php';

Database::bootstrap();

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
        throw new Exception("Méthode non autorisée.", 405);
    }

    $user_id = 2; // Remplacer par l'ID de l'utilisateur authentifié

    $database = new Database();
    $db = $database->getConnection();

    $query = "SELECT id, name, color FROM task_urgencies WHERE user_id = :user_id ORDER BY id ASC";

    $stmt = $db->prepare($query);
    $stmt->bindParam(':user_id', $user_id, PDO::PARAM_INT);
    $stmt->execute();

    $urgencies_arr = $stmt->fetchAll(PDO::FETCH_ASSOC);

    http_response_code(200);
    echo json_encode([
        "status" => "success",
        "message" => "Niveaux d'urgence récupérés avec succès.",
        "records" => $urgencies_arr
    ]);
} catch (Exception $e) {
    http_response_code($e->getCode() ?: 400);
    echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
    ]);
}
