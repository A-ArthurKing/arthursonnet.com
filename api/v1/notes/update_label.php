<?php
require_once __DIR__ . '/../config/Database.php';

Database::bootstrap();

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'PUT') {
        throw new Exception("Méthode non autorisée.", 405);
    }

    $data = json_decode(file_get_contents("php://input"));
    if (!isset($data->id) || (!isset($data->name) && !isset($data->color))) {
        throw new Exception("ID, nom ou couleur de l'étiquette requis.", 400);
    }

    $database = new Database();
    $db = $database->getConnection();

    $query = "UPDATE note_labels SET name = :name, color = :color WHERE id = :id";
    $stmt = $db->prepare($query);

    $stmt->bindParam(':id', $data->id);
    $stmt->bindParam(':name', $data->name);
    $stmt->bindParam(':color', $data->color);

    if ($stmt->execute()) {
        http_response_code(200);
        echo json_encode([
            "status" => "success",
            "message" => "Étiquette mise à jour avec succès."
        ]);
    } else {
        throw new Exception("Échec de la mise à jour de l'étiquette.", 500);
    }
} catch (Exception $e) {
    http_response_code($e->getCode() ?: 400);
    echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
    ]);
}
