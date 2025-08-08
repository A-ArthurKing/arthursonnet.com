<?php
// /api/v1/auth/login.php

// Inclut la classe unifiée
require_once __DIR__ . '/../config/Database.php';

// Exécute la configuration (CORS, erreurs, etc.) une seule fois
Database::bootstrap();

// --- Logique de l'endpoint ---
try {
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        throw new Exception("Méthode non autorisée.", 405);
    }

    $data = json_decode(file_get_contents("php://input"));

    if (!isset($data->username) || !isset($data->password)) {
        throw new Exception("Nom d'utilisateur et mot de passe requis.", 400);
    }

    $username = htmlspecialchars(strip_tags($data->username));
    $password = $data->password;

    // Crée une instance de la classe Database pour la connexion
    $database = new Database();
    $db = $database->getConnection();

    // Le reste du code est identique
    $query = "SELECT id, username, password_hash FROM users WHERE username = :username LIMIT 0,1";
    $stmt = $db->prepare($query);
    $stmt->bindParam(':username', $username);
    $stmt->execute();

    if ($stmt->rowCount() !== 1) {
        throw new Exception("Identifiants invalides.", 401);
    }

    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!password_verify($password, $user['password_hash'])) {
        throw new Exception("Identifiants invalides.", 401);
    }

    http_response_code(200);
    echo json_encode([
        "status" => "success",
        "message" => "Connexion réussie.",
        "user" => [
            "id" => $user['id'],
            "username" => $user['username']
        ]
    ]);
} catch (Exception $e) {
    http_response_code($e->getCode() ?: 400);
    echo json_encode([
        "status" => "error",
        "message" => $e->getMessage()
    ]);
}
