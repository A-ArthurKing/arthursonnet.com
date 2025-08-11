<?php
require_once __DIR__ . '/../config/Database.php';

Database::bootstrap();

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'DELETE') {
        throw new Exception("Méthode non autorisée.", 405);
    }

    $data = json_decode(file_get_contents("php://input"));
    if (!isset($data->id)) {
        throw new Exception("ID de l'étiquette requis.", 400);
    }

    $database = new Database();
    $db = $database->getConnection();

    $query = "DELETE FROM note_labels WHERE id = :id";
    $stmt = $db->prepare($query);

    $stmt->bindParam(':id', $data->id);

    if ($stmt->execute()) {
        http_response_code(200);
        echo json_encode([
            "status" => "success",
            "message" => "Étiquette supprimée avec succès."
        ]);
    } else {
        throw new Exception("Échec de la suppression de l'étiquette.", 500);
    }
} catch (Exception $e) {
    http_response_code($e->getCode() ?: 400);
    echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
    ]);
}
