<?php

// Désactive le time limit pour éviter les erreurs sur de gros projets
set_time_limit(0);

// Définit le Content-Type pour un affichage propre dans le navigateur
header('Content-Type: text/plain; charset=utf-8');

/**
 * Fonction récursive pour scanner et afficher l'arborescence d'un dossier.
 *
 * @param string $dir Le dossier de départ.
 * @param string $prefix Le préfixe pour l'indentation visuelle.
 */
function display_directory_tree($dir, $prefix = '')
{
    // Liste des dossiers et fichiers à ignorer
    $ignore = ['.', '..', '.git', '.vscode', 'node_modules', 'vendor'];

    // Ouvre le dossier
    $files = scandir($dir);
    if ($files === false) {
        echo "Erreur: Impossible de lire le dossier $dir\n";
        return;
    }

    // Filtre les éléments à ignorer
    $files = array_diff($files, $ignore);

    foreach ($files as $file) {
        $path = $dir . '/' . $file;
        $isLast = ($file === end($files));

        // Affiche le préfixe pour l'arborescence
        echo $prefix . ($isLast ? '└── ' : '├── ');

        // Affiche le nom du fichier ou du dossier
        echo $file . "\n";

        // Si c'est un dossier, on continue récursivement
        if (is_dir($path)) {
            $newPrefix = $prefix . ($isLast ? '    ' : '│   ');
            display_directory_tree($path, $newPrefix);
        }
    }
}

// Affiche le nom du dossier racine du projet et lance la fonction
$projectRoot = __DIR__;
echo "Arborescence du projet : " . $projectRoot . "\n\n";
display_directory_tree($projectRoot);
