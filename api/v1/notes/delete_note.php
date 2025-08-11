<?php
// /api/v1/notes/delete_note.php

require_once __DIR__ . '/../config/Database.php';

Database::bootstrap();

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'DELETE') {
        throw new Exception("Méthode non autorisée.", 405);
    }

    if (!isset($_GET['id'])) {
        throw new Exception("ID de la note requis.", 400);
    }

    $id = htmlspecialchars(strip_tags($_GET['id']));

    $database = new Database();
    $db = $database->getConnection();

    $query = "DELETE FROM notes WHERE id = :id";
    $stmt = $db->prepare($query);
    $stmt->bindParam(':id', $id);

    if ($stmt->execute()) {
        if ($stmt->rowCount() > 0) {
            http_response_code(200);
            echo json_encode(["status" => "success", "message" => "Note supprimée avec succès."]);
        } else {
            throw new Exception("Aucune note trouvée avec cet ID.", 404);
        }
    } else {
        throw new Exception("Échec de la suppression de la note.", 500);
    }
} catch (Exception $e) {
    http_response_code($e->getCode() ?: 400);
    echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
    ]);
}
