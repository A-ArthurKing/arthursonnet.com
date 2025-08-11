<?php
// /api/v1/notes/add_label.php

require_once __DIR__ . '/../config/Database.php';

Database::bootstrap();

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        throw new Exception("Méthode non autorisée.", 405);
    }

    $data = json_decode(file_get_contents("php://input"));
    // On vérifie que le user_id est bien présent
    if (!isset($data->name) || !isset($data->color) || !isset($data->userId)) {
        throw new Exception("Nom, couleur et ID utilisateur de l'étiquette requis.", 400);
    }

    $database = new Database();
    $db = $database->getConnection();

    // La requête SQL a été modifiée pour inclure le champ user_id
    $query = "INSERT INTO note_labels (user_id, name, color) VALUES (:user_id, :name, :color)";
    $stmt = $db->prepare($query);

    // On lie le nouveau paramètre
    $stmt->bindParam(':user_id', $data->userId);
    $stmt->bindParam(':name', $data->name);
    $stmt->bindParam(':color', $data->color);

    if ($stmt->execute()) {
        $lastId = $db->lastInsertId();
        http_response_code(201);
        echo json_encode([
            "status" => "success",
            "message" => "Étiquette créée avec succès.",
            "record" => [
                "id" => $lastId,
                "user_id" => $data->userId,
                "name" => $data->name,
                "color" => $data->color
            ]
        ]);
    } else {
        throw new Exception("Échec de la création de l'étiquette.", 500);
    }
} catch (Exception $e) {
    http_response_code($e->getCode() ?: 400);
    echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
    ]);
}
