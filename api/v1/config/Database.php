<?php
// /api/v1/config/Database.php

class Database
{
    private $host;
    private $db_name;
    private $username;
    private $password;
    public $conn;

    public static function bootstrap()
    {
        $allowed_origin = 'http://localhost:3000';

        header("Access-Control-Allow-Origin: " . $allowed_origin);
        header("Content-Type: application/json; charset=UTF-8");
        header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
        header("Access-Control-Allow-Credentials: true");

        if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
            http_response_code(200);
            exit();
        }

        if (self::isDevEnvironment()) {
            ini_set('display_errors', 1);
            ini_set('display_startup_errors', 1);
            error_reporting(E_ALL);
        } else {
            ini_set('display_errors', 0);
            ini_set('display_startup_errors', 0);
            error_reporting(0);
        }
    }

    public function __construct()
    {
        if (self::isDevEnvironment()) {
            $this->host = 'localhost';
            $this->db_name = 'arthursonnet';
            $this->username = 'root';
            $this->password = 'William.244';
        } else {
            $this->host = 'localhost';
            $this->db_name = 'u113603761_arthur_sas';
            $this->username = 'u113603761_arthur_sas';
            $this->password = 'William.244';
        }
    }

    public function getConnection()
    {
        $this->conn = null;
        try {
            $dsn = 'mysql:host=' . $this->host . ';dbname=' . $this->db_name . ';charset=utf8mb4';
            $this->conn = new PDO($dsn, $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->conn->exec("set names utf8mb4");
        } catch (PDOException $exception) {
            http_response_code(500);
            echo json_encode(['status' => 'error', 'message' => 'Erreur de connexion à la base de données.']);
            exit;
        }
        return $this->conn;
    }

    private static function isDevEnvironment()
    {
        if (!isset($_SERVER['SERVER_NAME'])) return false;
        $local_hosts = ['localhost', '127.0.0.1'];
        return in_array($_SERVER['SERVER_NAME'], $local_hosts);
    }
}
