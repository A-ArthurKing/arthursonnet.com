<?php
// /api/test_cors.php

// Envoie uniquement les en-têtes CORS nécessaires. Pas de base de données, pas de logique complexe.
header("Access-Control-Allow-Origin: http://localhost:3001");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");

// Gère la requête OPTIONS
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

// Si la requête n'est pas OPTIONS, envoie une réponse de succès simple.
header("Content-Type: application/json; charset=UTF-8");
http_response_code(200);
echo json_encode(["message" => "Test CORS réussi ! Le serveur répond correctement."]);
