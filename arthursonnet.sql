-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 26 juil. 2025 à 12:28
-- Version du serveur : 8.0.41
-- Version de PHP : 8.3.14
SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET
  time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;

/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `arthursonnet`
--
-- --------------------------------------------------------
--
-- Structure de la table `categories`
--
DROP TABLE IF EXISTS `categories`;

CREATE TABLE
  IF NOT EXISTS `categories` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `category_type_id` int NOT NULL,
    `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#888888',
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    KEY `category_type_id` (`category_type_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 25 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--
INSERT INTO
  `categories` (
    `id`,
    `user_id`,
    `category_type_id`,
    `name`,
    `color`
  )
VALUES
  (2, 2, 4, 'Salaire', '#888888'),
  (3, 2, 5, 'Fitness', '#1F1F1F'),
  (5, 2, 5, 'Transport', '#63C57B'),
  (6, 2, 5, 'Loisirs', '#E58585'),
  (7, 2, 6, 'Voyage', '#0ABAB5'),
  (8, 2, 5, 'Restaurant', '#725CAD'),
  (9, 2, 4, 'Location Salé', '#00809D'),
  (10, 2, 6, 'Future Investissement', '#FFE6E1'),
  (11, 2, 5, 'Loyer', '#AEC8A4'),
  (12, 2, 5, 'Développement Web', '#7F8CAA'),
  (13, 2, 5, 'Argent de poche Isabelle', '#F2C078'),
  (14, 2, 5, 'Argent de poche Arthur', '#EAE4D5'),
  (15, 2, 5, 'Livre', '#9B7EBD'),
  (16, 2, 5, 'Courses', '#309898'),
  (17, 2, 5, 'Eaux / Électricité', '#888888'),
  (18, 2, 5, 'Gaz', '#888888'),
  (19, 2, 5, 'Wifi', '#F29A5F'),
  (20, 2, 5, 'Équipements', '#254D70'),
  (21, 2, 5, 'Coiffure', '#9EFFF4'),
  (22, 2, 8, 'By Iso', '#A2AADB'),
  (23, 2, 5, 'Vêtements', '#888888'),
  (24, 2, 7, 'Chambre location salé.', '#888888');

-- --------------------------------------------------------
--
-- Structure de la table `category_types`
--
DROP TABLE IF EXISTS `category_types`;

CREATE TABLE
  IF NOT EXISTS `category_types` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#CCCCCC',
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category_types`
--
INSERT INTO
  `category_types` (`id`, `user_id`, `name`, `color`)
VALUES
  (4, 2, 'Entré', '#CCCCCC'),
  (5, 2, 'Sortie', '#CCCCCC'),
  (6, 2, 'Épargne', '#CCCCCC'),
  (7, 2, 'Investissement ', '#CCCCCC'),
  (8, 2, 'Prêt', '#CCCCCC');

-- --------------------------------------------------------
--
-- Structure de la table `courses_languages`
--
DROP TABLE IF EXISTS `courses_languages`;

CREATE TABLE
  IF NOT EXISTS `courses_languages` (
    `id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#4f46e5',
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `courses_languages`
--
INSERT INTO
  `courses_languages` (`id`, `name`, `color`)
VALUES
  (2, 'SQL', '#4f46e5'),
  (3, 'PHP', '#48C5E5'),
  (4, 'PYTHON', '#E5D848'),
  (6, 'LARAVEL', '#E54848'),
  (7, 'REACT', '#77E548'),
  (8, 'javascript', '#E58F48');

-- --------------------------------------------------------
--
-- Structure de la table `courses_sheets`
--
DROP TABLE IF EXISTS `courses_sheets`;

CREATE TABLE
  IF NOT EXISTS `courses_sheets` (
    `id` int NOT NULL AUTO_INCREMENT,
    `language_id` int NOT NULL,
    `user_id` int NOT NULL,
    `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#2d3748',
    `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
    `display_order` int NOT NULL DEFAULT '0',
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `content_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'commands_syntax',
    PRIMARY KEY (`id`),
    KEY `language_id` (`language_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 16 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `courses_sheets`
--
INSERT INTO
  `courses_sheets` (
    `id`,
    `language_id`,
    `user_id`,
    `title`,
    `color`,
    `content`,
    `display_order`,
    `created_at`,
    `content_type`
  )
VALUES
  (
    4,
    2,
    2,
    'Querying Data Commands (commandes de requêtes de données)',
    '#2D3748',
    '{\"intro\":\"\",\"rows\":[{\"commande\":\" GROUP BY\",\"type\":\"Querying Data Commands ( Commandes de Requêtes de Données )\",\"description\":\"Elle permet de regrouper les résultats par valeur unique d\'une ou plusieurs colonnes pour effectuer des calculs agrégés.\",\"syntaxe\":\"SELECT colonne_1, AGREGAT(colonne_2) \\nFROM table \\nGROUP BY colonne_1;\",\"exemple\":\"SELECT produit_id, SUM(quantite) AS total_quantite \\nFROM ventes \\nGROUP BY produit_id; \\n /* Résultat : un total de quantités pour chaque produit.*/   \"},{\"commande\":\"HAVING \",\"type\":\"Querying Data Commands ( Commandes de Requêtes de Données )\",\"description\":\"Elle s’utilise pour filtrer les groupes de données après agrégation.\",\"syntaxe\":\"SELECT colonne_1, AGREGAT(colonne_2) \\nFROM table \\nGROUP BY colonne_1 \\nHAVING AGREGAT(colonne_2) opérateur valeur;\",\"exemple\":\"SELECT produit_id, SUM(quantite * prix_unitaire) AS chiffre_affaires \\nFROM ventes \\nGROUP BY produit_id \\nHAVING SUM(quantite * prix_unitaire) > 100; \\n /*Résultat : uniquement les produits qui génèrent plus de 100 € de ventes..*/ \"},{\"commande\":\"INNER JOIN\\t\",\"type\":\"Querying Data Commands ( Commandes de Requêtes de Données )\",\"description\":\"Récupère uniquement les lignes ayant une correspondance dans les deux tables jointes\\t\",\"syntaxe\":\"SELECT * \\nFROM table1 \\nINNER JOIN table2 ON table1.col = table2.col;\\t\",\"exemple\":\"SELECT p.nom, c.nom_categorie \\nFROM produits p \\nINNER JOIN categories c ON p.id_categorie = c.id_categorie;\\t\\n/*Résultat : seuls les produits avec une catégorie associée sont affichés.\\t*/\"},{\"commande\":\"LEFT JOIN\\t\",\"type\":\"Querying Data Commands ( Commandes de Requêtes de Données )\",\"description\":\"Récupère toutes les lignes de la table de gauche même si aucune correspondance dans la table de droite\\t\",\"syntaxe\":\"SELECT * \\nFROM table1 \\nLEFT JOIN table2 ON table1.col = table2.col;\\t\",\"exemple\":\"SELECT a.nom, b.nom AS nom_ami \\nFROM utilisateurs a LEFT JOIN amis b ON a.id = b.utilisateur_id;\\t\\n/*Résultat : tous les utilisateurs sont listés, même sans amis.*/\"},{\"commande\":\"RIGHT JOIN\\t\",\"type\":\"Querying Data Commands ( Commandes de Requêtes de Données )\",\"description\":\"Récupère toutes les lignes de la table de droite, même si aucune correspondance dans la table de gauche\\t\",\"syntaxe\":\"SELECT * \\nFROM table1 \\nRIGHT JOIN table2 ON table1.col = table2.col;\\t\",\"exemple\":\"SELECT a.nom, b.nom AS nom_ami \\nFROM utilisateurs a \\nRIGHT JOIN amis b ON a.id = b.utilisateur_id;\\t\\n\\t\\n/*Résultat : tous les amis sont listés, même si l\'utilisateur n’existe pas.*/\"},{\"commande\":\"FULL JOIN (ou FULL OUTER JOIN)\\t\",\"type\":\"Querying Data Commands ( Commandes de Requêtes de Données )\",\"description\":\"Récupère toutes les lignes des deux tables. Les valeurs sans correspondance de chaque côté sont complétées par NULL.\\t\",\"syntaxe\":\"SELECT * \\nFROM table1 \\nFULL JOIN table2 ON table1.col = table2.col;\\t\\n\\nÉquivalent FULL JOIN en MySQL (via UNION)\\nsql\\nCopier\\nModifier\\n\\nSELECT * \\nFROM table_a\\nLEFT JOIN table_b ON table_a.id = table_b.a_id\\nUNION\\n\\nSELECT * \\nFROM table_a\\nRIGHT JOIN table_b ON table_a.id = table_b.a_id;\\n\",\"exemple\":\"SELECT * \\nFROM table_a \\nFULL JOIN table_b ON table_a.id = table_b.a_id;\\t\\n/*Résultat : toutes les lignes de table_a et table_b sont retournées. Si une ligne de table_a n’a pas de a_id correspondant dans table_b, les colonnes de table_b seront NULL, et inversement.*/\"}]}',
    0,
    '2025-07-04 17:38:28',
    'commands_syntax'
  ),
  (
    6,
    8,
    2,
    'Fonctions Tableaux (Array Methods)',
    '#2D3748',
    '{\"intro\":\"Les fonctions tableaux permettent de manipuler facilement les éléments d’un tableau en JavaScript. Elles servent à ajouter, supprimer, rechercher, trier ou transformer les données. Ces méthodes sont essentielles pour écrire du code clair, rapide et efficace.\",\"rows\":[{\"commande\":\"push()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Ajoute un ou plusieurs éléments à la fin du tableau et retourne la nouvelle longueur.\\t\",\"syntaxe\":\"array.push(element1, ..., elementN)\\t\",\"exemple\":\"[\\\"pomme\\\", \\\"banane\\\"].push(\\\"kiwi\\\") → [\\\"pomme\\\", \\\"banane\\\", \\\"kiwi\\\"]\\n[1, 2].push(3, 4) → [1, 2, 3, 4]\"},{\"commande\":\"pop()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Supprime le dernier élément du tableau et le retourne.\\t\",\"syntaxe\":\"array.pop()\\t\",\"exemple\":\"[\\\"pomme\\\", \\\"banane\\\"].pop() → \\\"banane\\\", reste : [\\\"pomme\\\"]\\n\"},{\"commande\":\"unshift()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Ajoute un ou plusieurs éléments au début du tableau et retourne la nouvelle longueur.\\t\",\"syntaxe\":\"array.unshift(element1, ..., elementN)\\t\",\"exemple\":\"[\\\"banane\\\", \\\"kiwi\\\"].unshift(\\\"pomme\\\") → [\\\"pomme\\\", \\\"banane\\\", \\\"kiwi\\\"]\\n\"},{\"commande\":\"shift()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Supprime le premier élément du tableau et le retourne.\\t\",\"syntaxe\":\"array.shift()\\t\",\"exemple\":\"[\\\"pomme\\\", \\\"banane\\\"].shift() → \\\"pomme\\\", reste : [\\\"banane\\\"]\\n\"},{\"commande\":\"splice()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Ajoute, supprime ou remplace des éléments dans un tableau. Modifie le tableau original.\\t\",\"syntaxe\":\"array.splice(start, deleteCount, item1, ..., itemN)\\t\",\"exemple\":\"[\\\"pomme\\\", \\\"banane\\\", \\\"kiwi\\\"].splice(1, 1, \\\"orange\\\") → [\\\"pomme\\\", \\\"orange\\\", \\\"kiwi\\\"]\\n\"},{\"commande\":\"slice()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Retourne une copie d’une portion du tableau sans le modifier.\\t\",\"syntaxe\":\"array.slice(start, end)\\t\",\"exemple\":\"[\\\"pomme\\\", \\\"banane\\\", \\\"kiwi\\\"].slice(0, 2) → [\\\"pomme\\\", \\\"banane\\\"]\\n\"},{\"commande\":\"indexOf()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Retourne l’index de la première occurrence d’un élément, ou -1 s’il n’existe pas.\\t\",\"syntaxe\":\"array.indexOf(element, fromIndex)\\t\",\"exemple\":\"[\\\"rouge\\\", \\\"vert\\\", \\\"bleu\\\"].indexOf(\\\"vert\\\") → 1\\n\"},{\"commande\":\"includes()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Retourne true si un élément est présent dans le tableau, sinon false.\\t\",\"syntaxe\":\"array.includes(element, fromIndex)\\t\",\"exemple\":\"[\\\"rouge\\\", \\\"vert\\\", \\\"bleu\\\"].includes(\\\"bleu\\\") → true\\n\\n\"},{\"commande\":\"find()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Retourne le premier élément qui satisfait une condition (fonction de test).\\t\",\"syntaxe\":\"array.find(callback(element, index, array))\\t\",\"exemple\":\"[5, 12, 8].find(e => e > 10) → 12\\n\"},{\"commande\":\"findIndex()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Retourne l’indice du premier élément qui satisfait une condition.\\t\",\"syntaxe\":\"array.findIndex(callback(element, index, array))\\t\",\"exemple\":\"[5, 12, 8].findIndex(e => e > 10) → 1\\n\"},{\"commande\":\"filter()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Retourne un nouveau tableau contenant tous les éléments qui passent une condition.\\t\",\"syntaxe\":\"array.filter(callback(element, index, array))\\t\",\"exemple\":\"[5, 12, 8].filter(e => e > 8) → [12]\\n\"},{\"commande\":\"map()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Crée un nouveau tableau contenant les résultats de la fonction appliquée à chaque élément.\\t\",\"syntaxe\":\"array.map(callback(element, index, array))\\t\",\"exemple\":\"[1, 2, 3].map(e => e * 2) → [2, 4, 6]\\n\"},{\"commande\":\"forEach()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Exécute une fonction pour chaque élément du tableau. Ne retourne rien (undefined).\\t\",\"syntaxe\":\"array.forEach(callback(element, index, array))\\t\",\"exemple\":\"[1, 2, 3].forEach(e => console.log(e)) → affiche 1, 2, 3\\n\"},{\"commande\":\"every()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Vérifie si tous les éléments passent un test. Retourne un booléen.\\t\",\"syntaxe\":\"array.every(callback(element, index, array))\\t\",\"exemple\":\"[2, 4, 6].every(e => e % 2 === 0) → true\\n\"},{\"commande\":\"some()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Vérifie si au moins un élément passe un test. Retourne un booléen.\\t\",\"syntaxe\":\"array.some(callback(element, index, array))\\t\",\"exemple\":\"[1, 3, 4].some(e => e % 2 === 0) → true\\n\\n\"},{\"commande\":\"reduce()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Applique une fonction accumulateur sur chaque élément, de gauche à droite, et retourne une seule valeur.\\t\",\"syntaxe\":\"array.reduce(callback(acc, val, idx, array), initialValue)\\t\",\"exemple\":\"[1, 2, 3, 4].reduce((acc, val) => acc + val, 0) → 10\\n\"},{\"commande\":\"reduceRight()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Comme reduce, mais traite les éléments de droite à gauche.\\t\",\"syntaxe\":\"array.reduceRight(callback(acc, val, idx, array), initialValue)\\t\",\"exemple\":\"[\\\"a\\\", \\\"b\\\", \\\"c\\\"].reduceRight((acc, val) => acc + val) → \\\"cba\\\"\\n\\n\"},{\"commande\":\"sort()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Trie les éléments d’un tableau. Modifie l’ordre original (par défaut, trie par ordre alphabétique).\\t\",\"syntaxe\":\"array.sort([compareFunction])\\t\",\"exemple\":\"[3, 1, 2].sort() → [1, 2, 3]\\n[\\\"b\\\", \\\"a\\\"].sort() → [\\\"a\\\", \\\"b\\\"]\"},{\"commande\":\"reverse()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Inverse l’ordre des éléments dans le tableau.\\t\",\"syntaxe\":\"array.reverse()\\t\",\"exemple\":\"[1, 2, 3].reverse() → [3, 2, 1]\"},{\"commande\":\"concat()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Fusionne deux ou plusieurs tableaux sans modifier les originaux.\\t\",\"syntaxe\":\"array1.concat(array2, ..., arrayN)\\t\",\"exemple\":\"[1, 2].concat([3, 4]) → [1, 2, 3, 4]\\n\"},{\"commande\":\"join()\\t\",\"type\":\"Fonctions Tableaux (Array Methods)\\t\",\"description\":\"Combine les éléments du tableau en une chaîne de caractères avec un séparateur.\\t\",\"syntaxe\":\"array.join(separator)\\t\",\"exemple\":\"[\\\"a\\\", \\\"b\\\", \\\"c\\\"].join(\\\"-\\\") → \\\"a-b-c\\\"\\n\\n\"}]}',
    3,
    '2025-07-05 11:29:40',
    'commands_syntax'
  ),
  (
    7,
    8,
    2,
    'Fonctions',
    '#E09429',
    '{\"intro\":\"Les fonctions en JavaScript sont des blocs de code réutilisables qui effectuent une tâche spécifique. Elles permettent de regrouper des instructions et de les exécuter à partir de différents endroits du programme. Les fonctions peuvent, prendre des paramètres en entrée et renvoyer une valeur en sortie.\",\"rows\":[{\"commande\":\"function nom()\",\"type\":\"Fonction Déclarée\\t\",\"description\":\"Fonction nommée déclarée avec le mot-clé function. Hoistée (accessible avant sa définition).\",\"syntaxe\":\"function nom(param1, param2) { ... }\",\"exemple\":\"function saluer(nom) { return \\\"Bonjour \\\" + nom; }\"},{\"commande\":\"const nom = function\",\"type\":\"Fonction Anonyme (Expression)\",\"description\":\"Fonction stockée dans une variable. Pas hoistée. Utilisée comme valeur.\",\"syntaxe\":\"const nom = function(param1, param2) { ... }\",\"exemple\":\"const traitementUtilisateur = (nom, callback) => {\\n  console.log(\\\"Bonjour, \\\" + nom);\\n  callback(nom);\\n};\\n\\n// Appel de la fonction avec une fonction anonyme en callback\\ntraitementUtilisateur(\\\"Arthur\\\", function(nom) {\\n  console.log(\\\"Le nom \\\" + nom + \\\" a bien été traité.\\\");\\n});\\n\"},{\"commande\":\"const nom = () => {}\",\"type\":\"Fonction Fléchée (Arrow)\",\"description\":\"Syntaxe courte introduite en ES6. Ne lie pas son propre this. Idéale pour les callbacks et fonctions courtes.\",\"syntaxe\":\"const nom = (param1, param2) => { ... }\",\"exemple\":\"const doubler = x => x * 2\"},{\"commande\":\"function* nom()\",\"type\":\"Fonction Génératrice\",\"description\":\"Fonction qui peut être suspendue et reprise à volonté avec yield. Utilisée pour créer des itérateurs.\",\"syntaxe\":\"function* nom() { yield valeur; }\",\"exemple\":\"function* compteur() { yield 1; yield 2; }\"},{\"commande\":\"async function\\t\",\"type\":\"Fonction Asynchrone\",\"description\":\"Fonction qui retourne toujours une promesse. Permet d’utiliser await pour des opérations asynchrones.\",\"syntaxe\":\"async function nom() { await ... }\",\"exemple\":\"async function charger() { let data = await fetch(url); }\"}]}',
    2,
    '2025-07-07 10:40:53',
    'commands_syntax'
  ),
  (
    8,
    8,
    2,
    'Opérateurs et Expressions',
    '#4D8EFF',
    '{\"intro\":\"Les opérateurs permettent d’effectuer des opérations sur des valeurs, comme des calculs, des comparaisons ou des affectations. Ils sont au cœur de toute expression JavaScript et permettent de construire des conditions, des boucles, des calculs, ou des traitements logiques. Maîtriser les opérateurs, c’est comprendre la logique même du langage.\",\"rows\":[{\"commande\":\"+\",\"type\":\"Opérateur Arithmétique\\t\",\"description\":\"Additionne deux nombres ou concatène deux chaînes.\\t\",\"syntaxe\":\"a + b\",\"exemple\":\"5 + 3 → 8\\n\\\"a\\\" + \\\"b\\\" → \\\"ab\\\"\"},{\"commande\":\"-\",\"type\":\"Opérateur Arithmétique\\t\",\"description\":\"Soustrait un nombre à un autre.\\t\",\"syntaxe\":\"a - b\",\"exemple\":\"10 - 4 → 6\\n\"},{\"commande\":\"*\",\"type\":\"Opérateur Arithmétique\\t\",\"description\":\"Multiplie deux nombres.\\t\",\"syntaxe\":\"a * b\",\"exemple\":\"3 * 4 → 12\"},{\"commande\":\"/\",\"type\":\"Opérateur Arithmétique\\t\",\"description\":\"Divise un nombre par un autre.\\t\",\"syntaxe\":\"a / b\",\"exemple\":\"10 / 2 → 5\"},{\"commande\":\"%\",\"type\":\"Opérateur Arithmétique\\t\",\"description\":\"Reste de la division entière.\\t\",\"syntaxe\":\"a % b\",\"exemple\":\"2 ** 3 → 8\"},{\"commande\":\"**\",\"type\":\"Opérateur Arithmétique\\t\",\"description\":\"Puissance (exponentiation) d’un nombre.\\t\",\"syntaxe\":\"a ** b\",\"exemple\":\"2 ** 3 → 8\"},{\"commande\":\"=\",\"type\":\"Opérateur d’Affectation\\t\",\"description\":\"Affecte une valeur à une variable.\\t\",\"syntaxe\":\"x = 5\",\"exemple\":\"let x = 5\"},{\"commande\":\"==\\t\",\"type\":\"Opérateur de Comparaison\",\"description\":\"Compare deux valeurs en les convertissant si nécessaire (égalité lâche).\",\"syntaxe\":\"a == b\\t\",\"exemple\":\"\\\"5\\\" == 5 → true\\n\"},{\"commande\":\"===\\t\",\"type\":\"Opérateur de Comparaison\",\"description\":\"Compare deux valeurs sans conversion (égalité stricte).\",\"syntaxe\":\"a === b\\t\",\"exemple\":\"\\\"5\\\" === 5 → false\\n\"},{\"commande\":\"!=\\t\",\"type\":\"Opérateur de Comparaison\",\"description\":\"Vérifie l’inégalité (avec conversion).\\t\",\"syntaxe\":\"a != b\\t\",\"exemple\":\"\\\"5\\\" != 5 → false\\n\"},{\"commande\":\"!==\\t\",\"type\":\"Opérateur de Comparaison\",\"description\":\"Vérifie l’inégalité stricte (sans conversion).\\t\",\"syntaxe\":\"a !== b\\t\",\"exemple\":\"\\\"5\\\" !== 5 → true\\n\"},{\"commande\":\">\",\"type\":\"Opérateur de Comparaison\",\"description\":\"Vérifie si la première valeur est strictement supérieure.\\t\",\"syntaxe\":\"a > b\\t\",\"exemple\":\"10 > 5 → true\\n\"},{\"commande\":\"<\",\"type\":\"Opérateur de Comparaison\",\"description\":\"Vérifie si la première valeur est strictement inférieure.\\t\",\"syntaxe\":\"a < b\\t\",\"exemple\":\"3 < 7 → true\\n\"},{\"commande\":\">=\",\"type\":\"Opérateur de Comparaison\",\"description\":\"Supérieur ou égal.\\t\",\"syntaxe\":\"a >= b\\t\",\"exemple\":\"5 >= 5 → true\\n\"},{\"commande\":\"<=\",\"type\":\"Opérateur de Comparaison\",\"description\":\"Inférieur ou égal.\\t\",\"syntaxe\":\"a <= b\\t\",\"exemple\":\"3 <= 5 → true\\n\"},{\"commande\":\"&&\",\"type\":\"Opérateur Logique\",\"description\":\"ET logique : les deux conditions doivent être vraies.\\t\",\"syntaxe\":\"a && b\\t\",\"exemple\":\"true && false → false\\n\"},{\"commande\":\"!\",\"type\":\"Opérateur Logique\\t\",\"description\":\"NON logique : inverse la valeur booléenne.\\t\",\"syntaxe\":\"!a\",\"exemple\":\"!true → false\\n\"},{\"commande\":\"typeof\\t\",\"type\":\"Opérateur Unaired\\t\",\"description\":\"Retourne le type d’une variable ou d’une valeur.\\t\",\"syntaxe\":\"typeof valeur\\t\",\"exemple\":\"typeof 42 → \\\"number\\\"\\n\"},{\"commande\":\"instanceof\",\"type\":\"Opérateur de Type\\t\",\"description\":\"Vérifie si un objet est instance d’un constructeur.\\t\",\"syntaxe\":\"objet instanceof Constructeur\\t\",\"exemple\":\"[] instanceof Array → true\\n\"},{\"commande\":\"?:\",\"type\":\"Opérateur Ternaire\\t\",\"description\":\"Condition courte. Retourne une valeur selon que la condition est vraie ou fausse.\\t\",\"syntaxe\":\"condition ? valSiVrai : valSiFaux\\t\",\"exemple\":\"age > 18 ? \\\"Majeur\\\" : \\\"Mineur\\\"\\n\\n\"}]}',
    1,
    '2025-07-07 10:57:04',
    'commands_syntax'
  ),
  (
    9,
    8,
    2,
    'Concept clé',
    '#2D3748',
    '{\"intro\":\"\",\"rows\":[{\"term\":\"Callback\",\"definition\":\"Fonction passée en paramètre à une autre fonction pour être exécutée plus tard\\n\\n\"}]}',
    4,
    '2025-07-07 13:07:43',
    'definitions'
  ),
  (
    11,
    7,
    2,
    'Concept clé :',
    '#2D3748',
    '{\"intro\":\"\",\"rows\":[{\"term\":\"JSX\",\"definition\":\"JSX (JavaScript XML) est une syntaxe qui permet d’écrire du HTML dans du JavaScript. Il est utilisé par React pour décrire l’interface utilisateur. JSX rend le code plus lisible et déclaratif, proche du HTML, tout en permettant la puissance de JavaScript.\\n\\n\\n- Un composant doit retourner un seul élément parent (souvent une <div> ou un fragment <>...</>).\\n\\n- Les attributs HTML s’écrivent en camelCase (className, htmlFor, etc.).\\n\\n- On insère des expressions JS entre {}.\"},{\"term\":\"Composant \",\"definition\":\"Un composant React est une fonction (ou une classe) qui retourne du JSX (un mélange de JavaScript et HTML). Ces composants permettent de construire des interfaces modulaires, réutilisables et dynamiques.\\n\\n\\nDeux types principaux :\\n\\n     Composants fonctionnels (les plus utilisés aujourd’hui)\\n     Composants basés sur des classes (anciens, moins utilisés)\\n\\n\\n\\nRègles importantes :\\n\\n    Le nom d’un composant doit toujours commencer       par une majuscule.\\n    Un composant retourne toujours du JSX.\\n    On peut imbriquer des composants dans d\'autres.\"},{\"term\":\"Props \",\"definition\":\"Un prop est une valeur immuable envoyée d’un composant parent à un composant enfant.\\n\\nLes props permettent de personnaliser un composant.\\nCe sont comme les arguments d’une fonction.\\nElles sont en lecture seule à l’intérieur du composant enfant.\"}]}',
    1,
    '2025-07-08 09:54:32',
    'definitions'
  ),
  (
    12,
    7,
    2,
    'Composants React',
    '#15094E',
    '{\"intro\":\"Un composant React est une fonction (ou une classe) qui retourne du JSX (un mélange de JavaScript et HTML). \\nReact ne définit pas officiellement de \\\"catégories\\\", mais dans les bonnes pratiques de développement, on distingue généralement plusieurs types selon leur rôle :\",\"rows\":[{\"commande\":\"Function Component\\t\",\"type\":\"Composant fonctionnel\\t\",\"description\":\"\\tComposant simple basé sur une fonction. Très utilisé avec les Hooks (useState, useEffect, etc.).\",\"syntaxe\":\"function MonComposant() { return <div>...</div>; }\",\"exemple\":\"jsx function Bonjour() { return <p>Salut !</p> }\"},{\"commande\":\"Arrow Function Component\",\"type\":\"Composant fonctionnel\",\"description\":\"Variante du Function Component avec une fonction fléchée, plus concise.\",\"syntaxe\":\"const MonComposant = () => { return <div>...</div>; }\",\"exemple\":\"jsx const Bonjour = () => <p>Salut !</p>\"},{\"commande\":\"Class Component\\t\",\"type\":\"Composant de classe\\t\",\"description\":\"\\tAncienne méthode. Utilise this, state, render() et componentDidMount(), etc.\",\"syntaxe\":\"class MonComposant extends React.Component { render() { return <div>...</div> } }\",\"exemple\":\"jsx class Bonjour extends React.Component { render() { return <p>Salut !</p> } }\"},{\"commande\":\"Presentational Component\",\"type\":\"Composant de présentation\",\"description\":\"Se concentre uniquement sur l’affichage (UI), reçoit les données via props. Pas de logique métier.\",\"syntaxe\":\"const MonUI = (props) => <div>{props.nom}</div>\",\"exemple\":\"jsx const Titre = ({ texte }) => <h1>{texte}</h1>\"},{\"commande\":\"Container Component\",\"type\":\"Composant conteneur\\t\",\"description\":\"Gère les données, la logique, les états. Peut contenir des appels API, Hooks, etc.\",\"syntaxe\":\"const Container = () => { const [data, setData] = useState(); return <UIComponent data={data} /> }\",\"exemple\":\"jsx const App = () => { const [n, setN] = useState(0); return <Compteur val={n} /> }\"},{\"commande\":\"Pure Component\\t\",\"type\":\"Composant pur\\t\",\"description\":\"\\tComposant optimisé qui ne se re-render que si ses props changent (utilise React.memo ou PureComponent).\",\"syntaxe\":\"const MonComposant = React.memo((props) => { ... })\",\"exemple\":\"jsx const Texte = React.memo(({ msg }) => <p>{msg}</p>)\"},{\"commande\":\"Higher-Order Component (HOC)\",\"type\":\"Composant d’ordre supérieur\",\"description\":\"Fonction qui prend un composant et retourne un nouveau composant enrichi (pattern d\'abstraction).\",\"syntaxe\":\"const hoc = (Wrapped) => (props) => <Wrapped {...props} />\",\"exemple\":\"jsx const AvecStyle = (C) => (p) => <div className=\\\"box\\\"><C {...p} /></div>\"},{\"commande\":\"Controlled Component\",\"type\":\"Formulaire contrôlé\\t\",\"description\":\"Un champ de formulaire contrôlé par React via useState. Valeur stockée dans l’état (state).\\t\",\"syntaxe\":\"<input value={valeur} onChange={(e) => setValeur(e.target.value)} />\\t\",\"exemple\":\"jsx const [val, setVal] = useState(\\\"\\\"); <input value={val} onChange={(e) => setVal(e.target.value)} />\\n\"},{\"commande\":\"Uncontrolled Component\\t\",\"type\":\"Formulaire non contrôlé\\t\",\"description\":\"Utilise ref pour accéder à la valeur du champ, sans passer par state.\\t\",\"syntaxe\":\"const inputRef = useRef(); <input ref={inputRef} />\\t\",\"exemple\":\"jsx const ref = useRef(); <input ref={ref} /><button onClick={() => console.log(ref.current.value)} />\\n\"},{\"commande\":\"Custom Hook Component\\t\",\"type\":\"Composant logique réutilisable\\t\",\"description\":\"Contient de la logique réutilisable via un Hook personnalisé (ex. useFetch, useForm, etc.)\\t\",\"syntaxe\":\"function useCustom() { const [x, setX] = useState(); ... return x }\\t\",\"exemple\":\"jsx function useCompteur() { const [n, setN] = useState(0); return {n, setN}; }\\n\\n\"}]}',
    3,
    '2025-07-09 08:45:08',
    'commands_syntax'
  ),
  (
    13,
    7,
    2,
    'En plus :',
    '#2D3748',
    '{\"intro\":\"\",\"rows\":[{\"h1\":\"Légendes supplémentaires\",\"p\":\"Composants fonctionnels → modernes, légers, compatibles avec les Hooks.\\n\\nComposants de présentation / conteneur → permettent de bien séparer l’UI et la logique métier.\\n\\nPure & HOC → utiles pour les performances et les architectures complexes.\\n\\nControlled vs Uncontrolled → surtout utilisés dans les formulaires.\\n\\nCustom Hook Component → excellent pour éviter la duplication de logique dans plusieurs composants.\"}]}',
    2,
    '2025-07-09 08:51:51',
    'simple_article'
  ),
  (
    14,
    7,
    2,
    'A savoir',
    '#940000',
    '{\"intro\":\"Mauvaise pratique\",\"rows\":[{\"item\":\"Balises\",\"description\":\"En JSX, les balises auto-fermantes doivent se terminer par /> Example :<img src=\\\"\\\" alt=\\\"photo de profil\\\" />\"},{\"item\":\"Return\",\"description\":\"le return suivi d’un saut de ligne annule le JSX suivant. JS pensera que tu retournes undefined. bonne pratiques\\n return (\\n        <section>\"},{\"item\":\"Class\",\"description\":\"En JSX, on n’utilise pas class (mot réservé JS), mais className.\"},{\"item\":\"Déclaration de fonction\",\"description\":\"React nécessite une déclaration de fonction valide (fonction fléchée ou classique avec function).\\nEt il faut que ça commence par une majuscule car React reconnaît les composants via la convention PascalCase :\"}]}',
    4,
    '2025-07-09 09:27:46',
    'simple_list'
  ),
  (
    15,
    7,
    2,
    'Questions / Réponses',
    '#275700',
    '{\"intro\":\"\",\"rows\":[{\"question\":\"Qu’est-ce qu’un props en React ?\",\"answer\":\"Le terme props est l’abréviation de “properties”. Ce sont des paramètres que l’on passe à un composant React depuis son parent, pour transmettre des données.\"}]}',
    0,
    '2025-07-09 09:33:09',
    'qa'
  );

-- --------------------------------------------------------
--
-- Structure de la table `currencies`
--
DROP TABLE IF EXISTS `currencies`;

CREATE TABLE
  IF NOT EXISTS `currencies` (
    `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
    `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `symbol` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
    PRIMARY KEY (`code`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `currencies`
--
INSERT INTO
  `currencies` (`code`, `name`, `symbol`)
VALUES
  ('EUR', 'Euro', '€'),
  ('MAD', 'Dirham Marocain', 'DH'),
  ('USD', 'Dollar Américain', '$'),
  ('XOF', 'Franc CFA', 'FCFA');

-- --------------------------------------------------------
--
-- Structure de la table `departements`
--
DROP TABLE IF EXISTS `departements`;

CREATE TABLE
  IF NOT EXISTS `departements` (
    `id_departement` int NOT NULL,
    `nom_departement` varchar(100) DEFAULT NULL,
    PRIMARY KEY (`id_departement`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `departements`
--
INSERT INTO
  `departements` (`id_departement`, `nom_departement`)
VALUES
  (1, 'Informatique'),
  (2, 'Ressources Humaines'),
  (3, 'Marketing');

-- --------------------------------------------------------
--
-- Structure de la table `employes`
--
DROP TABLE IF EXISTS `employes`;

CREATE TABLE
  IF NOT EXISTS `employes` (
    `id_employe` int NOT NULL,
    `nom` varchar(100) DEFAULT NULL,
    `prenom` varchar(100) DEFAULT NULL,
    `id_departement` int DEFAULT NULL,
    `salaire` decimal(10, 2) DEFAULT NULL,
    PRIMARY KEY (`id_employe`),
    KEY `id_departement` (`id_departement`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `employes`
--
INSERT INTO
  `employes` (
    `id_employe`,
    `nom`,
    `prenom`,
    `id_departement`,
    `salaire`
  )
VALUES
  (1, 'Dupont', 'Alice', 1, 3200.00),
  (2, 'Martin', 'Bob', 2, 2800.00),
  (3, 'Durant', 'Chloé', 1, 3100.00),
  (4, 'Lefevre', 'David', 3, 2900.00),
  (5, 'Petit', 'Emma', NULL, 2700.00);

-- --------------------------------------------------------
--
-- Structure de la table `employes_projets`
--
DROP TABLE IF EXISTS `employes_projets`;

CREATE TABLE
  IF NOT EXISTS `employes_projets` (
    `id_employe` int NOT NULL,
    `id_projet` int NOT NULL,
    PRIMARY KEY (`id_employe`, `id_projet`),
    KEY `id_projet` (`id_projet`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `employes_projets`
--
INSERT INTO
  `employes_projets` (`id_employe`, `id_projet`)
VALUES
  (1, 1),
  (3, 1),
  (2, 2),
  (3, 3),
  (4, 3);

-- --------------------------------------------------------
--
-- Structure de la table `exchange_rates`
--
DROP TABLE IF EXISTS `exchange_rates`;

CREATE TABLE
  IF NOT EXISTS `exchange_rates` (
    `currency_code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
    `rate_to_eur` decimal(15, 8) NOT NULL,
    PRIMARY KEY (`currency_code`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `exchange_rates`
--
INSERT INTO
  `exchange_rates` (`currency_code`, `rate_to_eur`)
VALUES
  ('EUR', 1.00000000),
  ('MAD', 0.09590000),
  ('USD', 0.92500000),
  ('XOF', 0.00152400);

-- --------------------------------------------------------
--
-- Structure de la table `exercises`
--
DROP TABLE IF EXISTS `exercises`;

CREATE TABLE
  IF NOT EXISTS `exercises` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `muscle_group_id` int NOT NULL,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `description` text COLLATE utf8mb4_unicode_ci,
    `image_url` varchar(2083) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    KEY `muscle_group_id` (`muscle_group_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 79 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `exercises`
--
INSERT INTO
  `exercises` (
    `id`,
    `user_id`,
    `muscle_group_id`,
    `name`,
    `description`,
    `image_url`,
    `created_at`
  )
VALUES
  (
    1,
    2,
    1,
    'Dips barre',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2000/01/dips-pectoraux.gif',
    '2025-06-11 20:47:41'
  ),
  (
    3,
    2,
    1,
    'Développé incliné haltères ',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2000/06/developpe-incline-halteres-exercice-musculation.gif',
    '2025-06-12 05:55:49'
  ),
  (
    4,
    2,
    1,
    'Développé couché barre',
    '',
    'uploads/fitness/exercise_68679a9acb973.gif',
    '2025-06-12 05:56:19'
  ),
  (
    5,
    2,
    1,
    'Ecarté Incliné Haltères',
    '',
    'https://boxlifemagazine.com/wp-content/uploads//2023/07/ecartes-incline-avec-halteres.gif',
    '2025-06-12 08:19:56'
  ),
  (
    6,
    2,
    1,
    'Développé Incliné à la Machine Convergente',
    '',
    'uploads/fitness/exercise_68679aba79cc5.gif',
    '2025-06-12 08:22:13'
  ),
  (
    7,
    2,
    4,
    'Développé militaire ',
    '',
    'https://www.muscle-masse.fr/wp-content/uploads/2023/09/developpe-epaule-halteres.gif',
    '2025-06-12 08:23:08'
  ),
  (
    8,
    2,
    5,
    'L’oiseau 45° Inclié',
    '',
    'https://plantrifit.fr/wp-content/uploads/2024/05/Rowing-Incline-.gif',
    '2025-06-12 08:24:23'
  ),
  (
    9,
    2,
    1,
    'Exercice Pec Dec',
    '',
    'https://knowledge-fitness.com/wp-content/uploads/2025/02/pec-deck-butterfly-exercice-musculation.gif',
    '2025-06-12 08:26:57'
  ),
  (
    10,
    2,
    4,
    'Développé militaire machine',
    '',
    'https://www.muscle-masse.fr/wp-content/uploads/2023/09/developpe-epaules-machine-prise-neutre.gif',
    '2025-06-12 08:27:55'
  ),
  (
    11,
    2,
    12,
    'Élévation frontale aux haltères',
    '',
    'https://www.fitadium.com/conseils/wp-content/uploads/2020/08/03101301-Dumbbell-Front-Raise_Shoulders_720.gif',
    '2025-06-12 08:31:15'
  ),
  (
    12,
    2,
    9,
    'Élévation latérale poulie basse',
    '',
    'https://www.fitadium.com/conseils/wp-content/uploads/2020/08/09771301-Band-front-lateral-raise_Shoulders_360.gif',
    '2025-06-12 08:31:52'
  ),
  (
    13,
    2,
    3,
    'Fentes Avant avec Haltères',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2000/06/fentes-avant-exercice-musculation.gif',
    '2025-06-12 08:33:13'
  ),
  (
    14,
    2,
    3,
    'Fentes Avant avec Barre',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2022/12/fente-avant-barre-vue-profil-homme.gif',
    '2025-06-12 08:35:20'
  ),
  (
    15,
    2,
    6,
    'Curl  position assise',
    '',
    'https://media.tenor.com/8T_oLOn1XJwAAAAM/rosca-alternada-com-halteres.gif',
    '2025-06-12 08:37:01'
  ),
  (
    16,
    2,
    11,
    'Barre front triceps barre',
    '',
    'https://www.body-burn.com/wp-content/uploads/2023/08/barre-front-triceps-musculation.gif',
    '2025-06-12 08:37:48'
  ),
  (
    17,
    2,
    11,
    'Barre front triceps haltères',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2022/09/extensions-triceps-decline-halteres.gif',
    '2025-06-12 08:39:29'
  ),
  (
    18,
    2,
    5,
    'Tirrage arrière épaules  poulie',
    '',
    'https://www.planeteforme.club/images/musculation-face-pull.gif',
    '2025-06-12 08:40:45'
  ),
  (
    19,
    2,
    2,
    'Tractions',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2022/02/traction-musculation-dos.gif',
    '2025-06-12 08:45:30'
  ),
  (
    20,
    2,
    2,
    'Tirage Vertical Prise Pronation ou neutre',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2022/01/tirage-vertical-prise-inversee.gif',
    '2025-06-12 08:46:21'
  ),
  (
    21,
    2,
    2,
    'Tirage Vertical en Supination à la Machine Hammer Strength',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2022/02/tirage-vertical-unilateral-machine.gif',
    '2025-06-12 08:46:49'
  ),
  (
    22,
    2,
    2,
    'Rowing Haltères',
    '',
    'https://boxlifemagazine.com/wp-content/uploads//2023/07/rowing-haltere-un-bras-1.gif',
    '2025-06-12 08:47:25'
  ),
  (
    23,
    2,
    2,
    'Rowing barre',
    '',
    'https://boxlifemagazine.com/wp-content/uploads//2023/07/rowing-barre-1.gif',
    '2025-06-12 08:47:50'
  ),
  (
    24,
    2,
    2,
    'Rowing à la Tbarre',
    '',
    'https://boxlifemagazine.com/wp-content/uploads//2023/07/rowing-barre-t-landmine-2.gif',
    '2025-06-12 08:48:12'
  ),
  (
    25,
    2,
    2,
    'Tirage horizontal ',
    '',
    'https://www.zone-musculation.com/wp-content/uploads/2024/11/tirage-horizontal.gif',
    '2025-06-12 08:48:38'
  ),
  (
    26,
    2,
    11,
    'Extension des triceps à la poulie haute',
    '',
    'https://performancessportives.com/wp-content/uploads/2023/06/Extension-des-triceps-a-la-poulie-haute-prise-neutre-largeur-dips.gif',
    '2025-06-12 08:49:27'
  ),
  (
    27,
    2,
    11,
    'Extensions des Triceps à la Poulie Haute',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2021/10/extension-triceps-poulie-haute-corde.gif',
    '2025-06-12 08:49:51'
  ),
  (
    28,
    2,
    11,
    'Extension Verticale à la Poulie Basse',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2022/04/extension-verticale-triceps-poulie-basse.gif',
    '2025-06-12 08:50:27'
  ),
  (
    29,
    2,
    6,
    'Curl à la Poulie Vis-à-vis',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2021/10/curl-poulie-vis-a-vis.gif',
    '2025-06-12 08:53:51'
  ),
  (
    30,
    2,
    2,
    'Rowing assis à un bras avec poulie basse ',
    '',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNV8q2yuCm_pz-ZD8pWfWIr5m-y9i3-BMcSg&s',
    '2025-06-12 08:54:33'
  ),
  (
    31,
    2,
    11,
    'Dips machine',
    '',
    'https://fitnessprogramer.com/wp-content/uploads/2021/04/Lever-Overhand-Triceps-Dip.gif',
    '2025-06-12 08:55:58'
  ),
  (
    32,
    2,
    6,
    'Curl marteau',
    '',
    'https://www.fitadium.com/conseils/wp-content/uploads/2020/11/03131301-Dumbbell-Hammer-Curl_Forearm_720.gif',
    '2025-06-12 08:56:39'
  ),
  (
    33,
    2,
    6,
    'Curl pupitre ',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2021/10/curl-haltere-prise-marteau-pupitre.gif',
    '2025-06-12 08:57:17'
  ),
  (
    34,
    2,
    6,
    'Curl incliné ',
    '',
    'https://www.fitadium.com/conseils/wp-content/uploads/2020/11/03151301-Dumbbell-Incline-Biceps-Curl_Upper-Arms_720.gif',
    '2025-06-12 08:57:43'
  ),
  (
    35,
    2,
    3,
    'Squat à la barre tallon surelevé',
    '',
    'https://knowledge-fitness.com/wp-content/uploads/2025/01/homme-faisant-un-squat-avec-barre.gif',
    '2025-06-12 08:58:56'
  ),
  (
    36,
    2,
    3,
    'Squats sumo avec haltère',
    '',
    'https://knowledge-fitness.com/wp-content/uploads/2025/03/squat-sumo-avec-haltere.gif',
    '2025-06-12 08:59:43'
  ),
  (
    37,
    2,
    3,
    'Squat bulgare',
    '',
    'https://f256c266.delivery.rocketcdn.me/new/wp-content/uploads/2024/09/IMG_7074.gif',
    '2025-06-12 09:00:10'
  ),
  (
    38,
    2,
    2,
    'Soulevé de terre',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2022/05/souleve-de-terre-avec-deficit.gif',
    '2025-06-12 09:00:32'
  ),
  (
    39,
    2,
    3,
    'Legs curl',
    '',
    'https://knowledge-fitness.com/wp-content/uploads/2025/02/leg-extension-exercice-musculation.gif',
    '2025-06-12 09:01:01'
  ),
  (
    40,
    2,
    3,
    'Hack Squat',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2022/01/hack-squat.gif',
    '2025-06-12 09:01:39'
  ),
  (
    41,
    2,
    3,
    'Hack Squat Inversé ',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2022/02/hack-squat-inverse.gif',
    '2025-06-12 09:02:12'
  ),
  (
    42,
    2,
    3,
    'Presse à cuisse ',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2022/08/presse-a-cuisses-inclinee.gif',
    '2025-06-12 09:02:46'
  ),
  (
    43,
    2,
    13,
    'Escalier',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2022/10/machine-a-escaliers.gif',
    '2025-06-12 09:03:25'
  ),
  (
    44,
    2,
    13,
    'Stepper ',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2022/10/stepper.gif',
    '2025-06-12 09:03:59'
  ),
  (
    45,
    2,
    13,
    'Course incliné',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2022/08/tapis-de-course-inclinaison.gif',
    '2025-06-12 09:04:47'
  ),
  (
    46,
    2,
    13,
    'Ramer',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2022/07/rameur.gif',
    '2025-06-12 09:05:16'
  ),
  (
    47,
    2,
    13,
    'Battle Rope',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2022/01/battle-rope-vague-alternee-haute.gif',
    '2025-06-12 09:06:00'
  ),
  (
    48,
    2,
    13,
    'Corde à Sauter',
    '',
    'https://www.docteur-fitness.com/wp-content/uploads/2022/07/corde-a-sauter.gif',
    '2025-06-12 09:06:44'
  ),
  (
    49,
    2,
    7,
    'Crunch Abdo',
    '',
    'https://www.body-burn.com/wp-content/uploads/2023/09/crunch-abdominaux-au-sol-exercice-musculation.gif',
    '2025-06-12 09:08:45'
  ),
  (
    50,
    2,
    7,
    'Relevé de jambes',
    '',
    'https://natural-evolution.fr/wp-content/uploads/2023/07/releve-de-genoux-suspendu-exercice-musculation.gif',
    '2025-06-12 09:09:09'
  ),
  (
    51,
    2,
    7,
    'Planche ',
    '',
    'https://sagessesante.fr/wp-content/uploads/la-planche-gainage.jpg',
    '2025-06-12 09:09:34'
  ),
  (
    52,
    2,
    7,
    'Roue',
    '',
    'https://boxlifemagazine.com/wp-content/uploads//2023/05/roulette-abdominaux.gif',
    '2025-06-12 09:10:02'
  ),
  (
    53,
    2,
    5,
    'Oiseau avec haltères ( Version arrière d\'épaules )',
    '',
    'https://www.zone-musculation.com/wp-content/uploads/2024/10/Execution-de-loiseau-avec-halteres.gif',
    '2025-06-30 11:18:49'
  ),
  (
    54,
    2,
    9,
    'Elévations latérales ',
    '',
    'https://www.fitadium.com/conseils/wp-content/uploads/2020/08/03341301-Dumbbell-Lateral-Raise_shoulder_720.gif',
    '2025-06-30 11:23:55'
  ),
  (
    55,
    2,
    1,
    'Développé Couché Serré avec Haltères :',
    '',
    'uploads/fitness/exercise_68679b5f912a4.gif',
    '2025-07-04 09:14:07'
  ),
  (
    56,
    2,
    1,
    'Ecarte couche haltere',
    '',
    'uploads/fitness/exercise_68679b99a5172.gif',
    '2025-07-04 09:15:06'
  ),
  (
    57,
    2,
    1,
    'Developpe Incliné Machine guidé',
    '',
    'uploads/fitness/exercise_68679beda7774.gif',
    '2025-07-04 09:16:30'
  ),
  (
    58,
    2,
    1,
    'Developpé Couché Smith machine',
    '',
    'uploads/fitness/exercise_68679c16c7d6c.gif',
    '2025-07-04 09:17:11'
  ),
  (
    60,
    2,
    3,
    'Soulevé de terre Jambes tendue',
    '',
    'uploads/fitness/exercise_68679c8c6d516.gif',
    '2025-07-04 09:19:10'
  ),
  (
    61,
    2,
    1,
    'Dips lesté barre',
    '',
    'uploads/fitness/exercise_68679d25270a6.gif',
    '2025-07-04 09:21:41'
  ),
  (
    62,
    2,
    1,
    'Ecarté à la poulie vis-à-vis haute ( Agenoux ou debout )',
    '',
    'uploads/fitness/exercise_68679d8345b29.gif',
    '2025-07-04 09:23:15'
  ),
  (
    63,
    2,
    1,
    'Ecarté couché à la poulie basse :',
    '',
    'uploads/fitness/exercise_68679df87cbd6.gif',
    '2025-07-04 09:25:12'
  ),
  (
    64,
    2,
    1,
    'Pompes',
    '',
    'uploads/fitness/exercise_68679e1784208.gif',
    '2025-07-04 09:25:44'
  ),
  (
    65,
    2,
    1,
    'Ecarté au élastiques',
    '',
    'uploads/fitness/exercise_68679e5d648fe.gif',
    '2025-07-04 09:26:54'
  ),
  (
    66,
    2,
    1,
    'Pecs supination Machine',
    '',
    'uploads/fitness/exercise_68679e81bdfe7.gif',
    '2025-07-04 09:27:29'
  ),
  (
    67,
    2,
    1,
    'Développe incliné poulie basse',
    '',
    'uploads/fitness/exercise_68679eb1d433e.webp',
    '2025-07-04 09:28:18'
  ),
  (
    68,
    2,
    1,
    'Ecartes poulis sur banc',
    '',
    'uploads/fitness/exercise_68679eee3e4b0.gif',
    '2025-07-04 09:29:18'
  ),
  (
    69,
    2,
    7,
    'Abd Coaster',
    '',
    'uploads/fitness/exercise_6867a14b2544a.gif',
    '2025-07-04 09:39:23'
  ),
  (
    70,
    2,
    7,
    'Crunch croisé',
    '',
    'uploads/fitness/exercise_6867a1df0ae65.gif',
    '2025-07-04 09:41:52'
  ),
  (
    71,
    2,
    7,
    'Crunch poulie haute',
    '',
    'uploads/fitness/exercise_6867a1f698a28.gif',
    '2025-07-04 09:42:15'
  ),
  (
    72,
    2,
    7,
    'Crunch machine',
    '',
    'uploads/fitness/exercise_6867a2194af45.gif',
    '2025-07-04 09:42:49'
  ),
  (
    73,
    2,
    7,
    'Relevé de jambes chaise romaine',
    '',
    'uploads/fitness/exercise_6867a23fa0ed4.gif',
    '2025-07-04 09:43:27'
  ),
  (
    74,
    2,
    7,
    'Tirage bucheron inversé',
    '',
    'uploads/fitness/exercise_6867a25d3ef08.gif',
    '2025-07-04 09:43:57'
  ),
  (
    75,
    2,
    7,
    'Crunch décliné',
    '',
    'uploads/fitness/exercise_6867a27099b86.gif',
    '2025-07-04 09:44:16'
  ),
  (
    76,
    2,
    11,
    'Dips sur banc',
    '',
    'uploads/fitness/exercise_6867a2cb7119e.gif',
    '2025-07-04 09:45:47'
  ),
  (
    77,
    2,
    6,
    'Curl Biceps Assis à la Machine',
    '',
    'uploads/fitness/exercise_6867a432170cb.gif',
    '2025-07-04 09:51:47'
  ),
  (
    78,
    2,
    2,
    'Rowing Machine',
    '',
    'uploads/fitness/exercise_6867a6965571c.gif',
    '2025-07-04 10:01:58'
  );

-- --------------------------------------------------------
--
-- Structure de la table `finances`
--
DROP TABLE IF EXISTS `finances`;

CREATE TABLE
  IF NOT EXISTS `finances` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `amount` decimal(10, 2) NOT NULL,
    `currency` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT 'FRP',
    `transaction_type` enum ('income', 'expense') COLLATE utf8mb4_unicode_ci NOT NULL,
    `income_type` enum ('active', 'passive') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `frequency` enum ('fixed', 'variable') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `source` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `category_id` int DEFAULT NULL,
    `description` text COLLATE utf8mb4_unicode_ci,
    `transaction_date` date NOT NULL,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    KEY `finances_ibfk_2` (`category_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 37 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `finances`
--
INSERT INTO
  `finances` (
    `id`,
    `user_id`,
    `amount`,
    `currency`,
    `transaction_type`,
    `income_type`,
    `frequency`,
    `source`,
    `category_id`,
    `description`,
    `transaction_date`,
    `created_at`
  )
VALUES
  (
    4,
    2,
    6000.00,
    'MAD',
    'income',
    'active',
    'fixed',
    'MCC',
    2,
    '',
    '2025-06-02',
    '2025-06-09 08:57:54'
  ),
  (
    6,
    2,
    870.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'SALAIRE',
    3,
    '2 fois 290DH ISO et moi et le reliquat d\'iso du mois dernier',
    '2025-06-05',
    '2025-06-09 09:27:05'
  ),
  (
    7,
    2,
    300.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'Salaire',
    5,
    'Tramway 290 et divers',
    '2025-06-05',
    '2025-06-09 09:28:00'
  ),
  (
    8,
    2,
    1666.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'LOCATION',
    7,
    '',
    '2025-06-07',
    '2025-06-09 09:35:38'
  ),
  (
    9,
    2,
    1500.00,
    'MAD',
    'income',
    'active',
    'fixed',
    'Location',
    9,
    '',
    '2025-06-05',
    '2025-06-09 09:36:47'
  ),
  (
    11,
    2,
    2300.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'Salaire',
    11,
    NULL,
    '2025-06-10',
    '2025-06-09 09:41:27'
  ),
  (
    12,
    2,
    231.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'Salaire',
    12,
    'Payement du nom de domaine de mon site web',
    '2025-06-05',
    '2025-06-09 09:44:51'
  ),
  (
    13,
    2,
    200.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'Salaire',
    13,
    NULL,
    '2025-06-06',
    '2025-06-09 09:46:26'
  ),
  (
    14,
    2,
    100.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'Salaire',
    15,
    '',
    '2025-06-07',
    '2025-06-09 09:47:38'
  ),
  (
    15,
    2,
    225.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    '200',
    16,
    '',
    '2025-06-04',
    '2025-06-09 09:48:51'
  ),
  (
    16,
    2,
    500.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'Salaire',
    19,
    '',
    '2025-06-10',
    '2025-06-10 12:19:28'
  ),
  (
    17,
    2,
    190.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'Salaire',
    17,
    '',
    '2025-06-10',
    '2025-06-10 12:20:57'
  ),
  (
    18,
    2,
    140.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    NULL,
    20,
    'Achat des rallonges.',
    '2025-06-05',
    '2025-06-11 08:38:04'
  ),
  (
    19,
    2,
    270.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    '',
    8,
    'Macdo * 2',
    '2025-06-06',
    '2025-06-11 08:43:05'
  ),
  (
    20,
    2,
    53.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'Salaire',
    18,
    '',
    '2025-06-10',
    '2025-06-11 08:45:15'
  ),
  (
    22,
    2,
    120.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'Pret Iso',
    21,
    NULL,
    '2025-06-13',
    '2025-06-15 15:50:04'
  ),
  (
    23,
    2,
    150.00,
    'MAD',
    'income',
    'active',
    'fixed',
    'Pret Iso',
    22,
    '',
    '2025-06-06',
    '2025-06-16 08:17:15'
  ),
  (
    24,
    2,
    200.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'Salaire',
    23,
    'Sous mis sur le côté pour l\'abonnement fitness d\'Isabelle.',
    '2025-06-27',
    '2025-06-27 18:20:32'
  ),
  (
    25,
    2,
    200.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'Salaire',
    23,
    'Sous mis sur le côté pour l\'abonnement fitness d\'Isabelle.',
    '2025-06-27',
    '2025-06-27 18:20:32'
  ),
  (
    26,
    2,
    200.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'Salaire',
    23,
    'Sous mis sur le côté pour l\'abonnement fitness d\'Isabelle.',
    '2025-06-27',
    '2025-06-27 18:20:32'
  ),
  (
    27,
    2,
    5400.00,
    'MAD',
    'income',
    'active',
    'fixed',
    'Salaire',
    2,
    '',
    '2025-07-02',
    '2025-07-02 07:15:17'
  ),
  (
    28,
    2,
    2000.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'Salaire',
    10,
    '',
    '2025-07-02',
    '2025-07-02 12:16:47'
  ),
  (
    29,
    2,
    1500.00,
    'MAD',
    'income',
    'active',
    'fixed',
    '',
    9,
    '',
    '2025-07-04',
    '2025-07-04 12:28:46'
  ),
  (
    30,
    2,
    185.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    '',
    20,
    'Câble Display boulot , Stick .',
    '2025-07-04',
    '2025-07-04 12:29:38'
  ),
  (
    31,
    2,
    580.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'Salaire',
    3,
    '',
    '2025-07-03',
    '2025-07-04 12:30:18'
  ),
  (
    32,
    2,
    162.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'Salaire',
    17,
    '',
    '2025-07-04',
    '2025-07-04 12:31:18'
  ),
  (
    33,
    2,
    250.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'Salaire',
    5,
    '',
    '2025-07-04',
    '2025-07-04 12:31:48'
  ),
  (
    34,
    2,
    2139.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'Salaire',
    11,
    '',
    '2025-07-10',
    '2025-07-04 18:58:23'
  ),
  (
    35,
    2,
    90.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'Salaire',
    22,
    '',
    '2025-07-03',
    '2025-07-04 19:00:43'
  ),
  (
    36,
    2,
    1500.00,
    'MAD',
    'expense',
    NULL,
    NULL,
    'Loyer Salé.',
    24,
    '',
    '2025-07-05',
    '2025-07-05 19:57:27'
  );

-- --------------------------------------------------------
--
-- Structure de la table `goals`
--
DROP TABLE IF EXISTS `goals`;

CREATE TABLE
  IF NOT EXISTS `goals` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `category_id` int NOT NULL,
    `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `description` text COLLATE utf8mb4_unicode_ci,
    `type` enum ('numerical', 'boolean_checklist') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'numerical',
    `target_value` decimal(15, 2) DEFAULT NULL,
    `current_value` decimal(15, 2) DEFAULT '0.00',
    `unit` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `target_date` date DEFAULT NULL,
    `status` enum ('in_progress', 'completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in_progress',
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `is_archived` tinyint (1) DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    KEY `category_id` (`category_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `goals`
--
INSERT INTO
  `goals` (
    `id`,
    `user_id`,
    `category_id`,
    `title`,
    `description`,
    `type`,
    `target_value`,
    `current_value`,
    `unit`,
    `target_date`,
    `status`,
    `created_at`,
    `updated_at`,
    `is_archived`
  )
VALUES
  (
    2,
    2,
    2,
    'Réunir 2Million',
    NULL,
    'numerical',
    2000000.00,
    230000.00,
    'FCFA',
    '2026-01-01',
    'in_progress',
    '2025-06-16 19:34:58',
    '2025-07-07 10:27:54',
    0
  ),
  (
    3,
    2,
    3,
    'Epargner 200K',
    'Epargner 200K pour mon compte épargne',
    'numerical',
    200000.00,
    0.00,
    'FCFA',
    '2025-12-30',
    'in_progress',
    '2025-06-30 11:36:53',
    '2025-06-30 11:37:13',
    0
  );

-- --------------------------------------------------------
--
-- Structure de la table `goal_categories`
--
DROP TABLE IF EXISTS `goal_categories`;

CREATE TABLE
  IF NOT EXISTS `goal_categories` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `goal_categories`
--
INSERT INTO
  `goal_categories` (
    `id`,
    `user_id`,
    `name`,
    `icon`,
    `color`,
    `created_at`
  )
VALUES
  (
    2,
    2,
    'Investissement Location',
    '-',
    '#660000',
    '2025-06-16 19:34:23'
  ),
  (
    3,
    2,
    'Epargne',
    'fa-money-bill-wheat',
    '#00ccff',
    '2025-06-30 11:36:25'
  );

-- --------------------------------------------------------
--
-- Structure de la table `goal_milestones`
--
DROP TABLE IF EXISTS `goal_milestones`;

CREATE TABLE
  IF NOT EXISTS `goal_milestones` (
    `id` int NOT NULL AUTO_INCREMENT,
    `goal_id` int NOT NULL,
    `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `target_value` decimal(15, 2) DEFAULT NULL,
    `is_completed` tinyint (1) DEFAULT '0',
    `completion_date` date DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `goal_id` (`goal_id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- --------------------------------------------------------
--
-- Structure de la table `goal_progress`
--
DROP TABLE IF EXISTS `goal_progress`;

CREATE TABLE
  IF NOT EXISTS `goal_progress` (
    `id` int NOT NULL AUTO_INCREMENT,
    `goal_id` int NOT NULL,
    `amount_added` decimal(15, 2) NOT NULL,
    `log_date` date NOT NULL,
    `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `goal_id` (`goal_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `goal_progress`
--
INSERT INTO
  `goal_progress` (
    `id`,
    `goal_id`,
    `amount_added`,
    `log_date`,
    `notes`,
    `created_at`
  )
VALUES
  (
    1,
    2,
    45000.00,
    '2025-06-16',
    'Dépôt dans l\'airtel money à Handy',
    '2025-06-25 09:08:16'
  ),
  (
    2,
    2,
    30000.00,
    '2025-06-30',
    'Dans le airtelmoney d\'isabelle , source babouches vendu par Dariane',
    '2025-06-30 17:07:26'
  ),
  (
    3,
    2,
    123000.00,
    '2025-07-02',
    NULL,
    '2025-07-02 17:52:59'
  ),
  (
    4,
    2,
    11000.00,
    '2025-07-03',
    'Revenus des babouches envoyer chez mom',
    '2025-07-03 17:54:55'
  ),
  (
    5,
    2,
    11000.00,
    '2025-07-05',
    'Revenus des babouches envoyer chez mom',
    '2025-07-05 16:30:30'
  ),
  (
    6,
    2,
    10000.00,
    '2025-07-07',
    NULL,
    '2025-07-07 10:27:54'
  );

-- --------------------------------------------------------
--
-- Structure de la table `habits`
--
DROP TABLE IF EXISTS `habits`;

CREATE TABLE
  IF NOT EXISTS `habits` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `category_id` int NOT NULL,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `frequency` enum ('daily', 'weekly', 'monthly', 'yearly') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'daily',
    `start_date` date NOT NULL,
    `is_archived` tinyint (1) NOT NULL DEFAULT '0',
    `archive_reason` text COLLATE utf8mb4_unicode_ci,
    `archived_at` datetime DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    KEY `category_id` (`category_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 23 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `habits`
--
INSERT INTO
  `habits` (
    `id`,
    `user_id`,
    `category_id`,
    `name`,
    `frequency`,
    `start_date`,
    `is_archived`,
    `archive_reason`,
    `archived_at`
  )
VALUES
  (
    1,
    2,
    1,
    'Une minute de déssin minimaliste',
    'daily',
    '2025-06-11',
    0,
    NULL,
    NULL
  ),
  (
    2,
    2,
    1,
    'Crée 2 Affiche',
    'weekly',
    '2025-06-11',
    0,
    NULL,
    NULL
  ),
  (
    3,
    2,
    3,
    'Aller 5 fois à la salle de sport',
    'weekly',
    '2025-06-11',
    0,
    NULL,
    NULL
  ),
  (
    4,
    2,
    6,
    'FAIRE 50 000 de bénéfices dans un busness',
    'monthly',
    '2025-06-11',
    0,
    NULL,
    NULL
  ),
  (
    5,
    2,
    4,
    '10 mn de culture Général',
    'daily',
    '2025-06-11',
    0,
    NULL,
    NULL
  ),
  (
    6,
    2,
    3,
    'Brosser mes dents au reveil',
    'daily',
    '2025-06-11',
    0,
    NULL,
    NULL
  ),
  (
    7,
    2,
    3,
    'Brosser mes dents avant le coucher',
    'daily',
    '2025-06-11',
    0,
    NULL,
    NULL
  ),
  (
    8,
    2,
    3,
    'Boire un verre d\'eau au coucher',
    'daily',
    '2025-06-11',
    0,
    NULL,
    NULL
  ),
  (
    9,
    2,
    3,
    'Boire un verre d\'eau au réveil',
    'daily',
    '2025-06-11',
    0,
    NULL,
    NULL
  ),
  (
    10,
    2,
    2,
    'Deux Exos PHP',
    'weekly',
    '2025-06-11',
    0,
    NULL,
    NULL
  ),
  (
    11,
    2,
    6,
    'Mettre 200 000 FCFA D\'épargne',
    'yearly',
    '2025-06-11',
    0,
    NULL,
    NULL
  ),
  (
    12,
    2,
    4,
    'Lire 10mn Par jour',
    'daily',
    '2025-06-12',
    0,
    NULL,
    NULL
  ),
  (
    13,
    2,
    2,
    '10 Requettes SQL',
    'weekly',
    '2025-06-12',
    1,
    NULL,
    '2025-06-30 15:09:16'
  ),
  (
    14,
    2,
    2,
    'Finir un projet web',
    'monthly',
    '2025-06-12',
    0,
    NULL,
    NULL
  ),
  (
    15,
    2,
    3,
    '8mn Corde à sauté',
    'daily',
    '2025-06-12',
    0,
    NULL,
    NULL
  ),
  (
    16,
    2,
    2,
    'Rajouter dex ComposantLab',
    'daily',
    '2025-06-16',
    0,
    NULL,
    NULL
  ),
  (
    17,
    2,
    2,
    'Faire 5 Exos JS',
    'weekly',
    '2025-06-28',
    1,
    NULL,
    '2025-06-30 15:08:33'
  ),
  (
    18,
    2,
    2,
    '2 Exos JS',
    'daily',
    '2025-06-30',
    0,
    NULL,
    NULL
  ),
  (
    19,
    2,
    2,
    '2 Requette SQL',
    'daily',
    '2025-06-30',
    0,
    NULL,
    NULL
  ),
  (
    20,
    2,
    2,
    '2 Exos Réact JS',
    'daily',
    '2025-07-01',
    0,
    NULL,
    NULL
  ),
  (
    21,
    2,
    2,
    '2 Exos Type script JS',
    'daily',
    '2025-07-01',
    1,
    'Manque de temps pour le moment.',
    '2025-07-01 16:35:06'
  ),
  (
    22,
    2,
    2,
    '2 Exos Python',
    'daily',
    '2025-07-01',
    0,
    NULL,
    NULL
  );

-- --------------------------------------------------------
--
-- Structure de la table `habit_categories`
--
DROP TABLE IF EXISTS `habit_categories`;

CREATE TABLE
  IF NOT EXISTS `habit_categories` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#A0AEC0',
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `habit_categories`
--
INSERT INTO
  `habit_categories` (`id`, `user_id`, `name`, `color`)
VALUES
  (1, 2, 'Design', '#FFB823'),
  (2, 2, 'Développement Web', '#00809D'),
  (3, 2, 'Fitness , Santé & Bien-être', '#725CAD'),
  (4, 2, 'Développement Personnel', '#FB9E3A'),
  (5, 2, 'Relationnel', '#C562AF'),
  (6, 2, 'Finances et Busness', '#4E71FF');

-- --------------------------------------------------------
--
-- Structure de la table `habit_tracking`
--
DROP TABLE IF EXISTS `habit_tracking`;

CREATE TABLE
  IF NOT EXISTS `habit_tracking` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `habit_id` int NOT NULL,
    `track_date` date NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_habit_date` (`user_id`, `habit_id`, `track_date`),
    UNIQUE KEY `user_habit_date_unique` (`user_id`, `habit_id`, `track_date`),
    KEY `habit_id` (`habit_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 257 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `habit_tracking`
--
INSERT INTO
  `habit_tracking` (`id`, `user_id`, `habit_id`, `track_date`)
VALUES
  (172, 2, 1, '2025-06-26'),
  (149, 2, 2, '2025-06-09'),
  (253, 2, 2, '2025-06-16'),
  (184, 2, 2, '2025-06-23'),
  (254, 2, 2, '2025-06-30'),
  (209, 2, 3, '2025-01-06'),
  (208, 2, 3, '2025-01-13'),
  (207, 2, 3, '2025-01-20'),
  (206, 2, 3, '2025-01-27'),
  (205, 2, 3, '2025-02-03'),
  (204, 2, 3, '2025-02-17'),
  (203, 2, 3, '2025-02-24'),
  (202, 2, 3, '2025-03-03'),
  (201, 2, 3, '2025-03-24'),
  (200, 2, 3, '2025-03-31'),
  (199, 2, 3, '2025-04-14'),
  (198, 2, 3, '2025-04-21'),
  (197, 2, 3, '2025-05-05'),
  (196, 2, 3, '2025-05-12'),
  (195, 2, 3, '2025-05-19'),
  (194, 2, 3, '2025-05-26'),
  (193, 2, 3, '2025-06-02'),
  (210, 2, 3, '2025-06-09'),
  (212, 2, 3, '2025-06-16'),
  (255, 2, 3, '2025-06-30'),
  (217, 2, 4, '2025-01-01'),
  (216, 2, 4, '2025-03-01'),
  (215, 2, 4, '2025-04-01'),
  (158, 2, 4, '2025-06-01'),
  (122, 2, 5, '2025-06-11'),
  (140, 2, 5, '2025-06-12'),
  (141, 2, 5, '2025-06-13'),
  (163, 2, 5, '2025-06-16'),
  (171, 2, 5, '2025-06-17'),
  (173, 2, 5, '2025-06-26'),
  (189, 2, 5, '2025-06-30'),
  (226, 2, 5, '2025-07-01'),
  (230, 2, 5, '2025-07-02'),
  (236, 2, 5, '2025-07-03'),
  (130, 2, 6, '2025-06-10'),
  (120, 2, 6, '2025-06-11'),
  (124, 2, 6, '2025-06-12'),
  (144, 2, 6, '2025-06-13'),
  (148, 2, 6, '2025-06-14'),
  (161, 2, 6, '2025-06-16'),
  (170, 2, 6, '2025-06-17'),
  (181, 2, 6, '2025-06-26'),
  (180, 2, 6, '2025-06-27'),
  (192, 2, 6, '2025-06-30'),
  (224, 2, 6, '2025-07-01'),
  (235, 2, 6, '2025-07-02'),
  (244, 2, 6, '2025-07-03'),
  (247, 2, 6, '2025-07-04'),
  (251, 2, 6, '2025-07-07'),
  (129, 2, 7, '2025-06-10'),
  (121, 2, 7, '2025-06-11'),
  (139, 2, 7, '2025-06-12'),
  (152, 2, 7, '2025-06-14'),
  (166, 2, 7, '2025-06-16'),
  (182, 2, 7, '2025-06-26'),
  (183, 2, 7, '2025-06-27'),
  (250, 2, 7, '2025-07-03'),
  (245, 2, 7, '2025-07-04'),
  (132, 2, 8, '2025-06-10'),
  (119, 2, 8, '2025-06-11'),
  (138, 2, 8, '2025-06-12'),
  (151, 2, 8, '2025-06-14'),
  (165, 2, 8, '2025-06-16'),
  (177, 2, 8, '2025-06-26'),
  (223, 2, 8, '2025-06-30'),
  (242, 2, 8, '2025-07-03'),
  (248, 2, 8, '2025-07-04'),
  (131, 2, 9, '2025-06-10'),
  (136, 2, 9, '2025-06-11'),
  (123, 2, 9, '2025-06-12'),
  (143, 2, 9, '2025-06-13'),
  (147, 2, 9, '2025-06-14'),
  (160, 2, 9, '2025-06-16'),
  (169, 2, 9, '2025-06-17'),
  (178, 2, 9, '2025-06-26'),
  (179, 2, 9, '2025-06-27'),
  (191, 2, 9, '2025-06-30'),
  (225, 2, 9, '2025-07-01'),
  (234, 2, 9, '2025-07-02'),
  (243, 2, 9, '2025-07-03'),
  (246, 2, 9, '2025-07-04'),
  (252, 2, 9, '2025-07-07'),
  (14, 2, 11, '2022-01-01'),
  (13, 2, 11, '2023-01-01'),
  (12, 2, 11, '2024-01-01'),
  (134, 2, 12, '2025-06-10'),
  (159, 2, 12, '2025-06-16'),
  (168, 2, 12, '2025-06-17'),
  (175, 2, 12, '2025-06-26'),
  (174, 2, 12, '2025-06-27'),
  (190, 2, 12, '2025-06-30'),
  (222, 2, 12, '2025-07-01'),
  (229, 2, 12, '2025-07-02'),
  (237, 2, 12, '2025-07-03'),
  (188, 2, 13, '2025-06-09'),
  (187, 2, 13, '2025-06-16'),
  (186, 2, 13, '2025-06-23'),
  (214, 2, 14, '2025-01-01'),
  (213, 2, 14, '2025-02-01'),
  (128, 2, 14, '2025-03-01'),
  (127, 2, 14, '2025-04-01'),
  (126, 2, 14, '2025-05-01'),
  (125, 2, 14, '2025-06-01'),
  (137, 2, 15, '2025-06-12'),
  (150, 2, 15, '2025-06-14'),
  (164, 2, 15, '2025-06-16'),
  (220, 2, 15, '2025-06-30'),
  (233, 2, 15, '2025-07-02'),
  (241, 2, 15, '2025-07-03'),
  (249, 2, 15, '2025-07-04'),
  (162, 2, 16, '2025-06-16'),
  (232, 2, 16, '2025-07-02'),
  (185, 2, 17, '2025-06-23'),
  (218, 2, 18, '2025-06-30'),
  (228, 2, 18, '2025-07-01'),
  (256, 2, 18, '2025-07-07'),
  (219, 2, 19, '2025-06-30'),
  (227, 2, 19, '2025-07-01'),
  (231, 2, 19, '2025-07-02'),
  (240, 2, 19, '2025-07-03'),
  (239, 2, 19, '2025-07-04'),
  (238, 2, 19, '2025-07-05');

-- --------------------------------------------------------
--
-- Structure de la table `muscle_groups`
--
DROP TABLE IF EXISTS `muscle_groups`;

CREATE TABLE
  IF NOT EXISTS `muscle_groups` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#A0AEC0',
    `image_url` varchar(2083) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 17 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `muscle_groups`
--
INSERT INTO
  `muscle_groups` (
    `id`,
    `user_id`,
    `name`,
    `color`,
    `image_url`,
    `created_at`
  )
VALUES
  (
    1,
    2,
    'Pectoraux',
    '#8ABDFF',
    'uploads/fitness/group_6867a97bef2af.jpg',
    '2025-06-11 20:42:57'
  ),
  (
    2,
    2,
    'Dos',
    '#ffe5a0',
    'https://davidcosta.fr/wp-content/uploads/2013/08/comment-muscler-son-dos-en-musculation-traction.jpg',
    '2025-06-11 20:44:56'
  ),
  (
    3,
    2,
    'Jambes',
    '#d4edbc',
    'https://julienquaglierini.com/wp-content/uploads/2024/02/muscler-jambes-cuisses-exercices.jpg',
    '2025-06-11 20:45:18'
  ),
  (
    4,
    2,
    'Haut Epaules',
    '#9acbd0',
    'https://www.dravelnutrition.fr/img/cms/BLOG/meilleur-exercice-epaule.jpg',
    '2025-06-11 20:45:32'
  ),
  (
    5,
    2,
    'Arrière Epaules',
    '#e6cff2',
    'https://davidcosta.fr/wp-content/uploads/2013/09/%C3%A9paules_muscl%C3%A9e_large.jpg',
    '2025-06-11 20:45:49'
  ),
  (
    6,
    2,
    'Biceps',
    '#d4adfc',
    'https://squaregym.fr/app/uploads/2024/08/Biceps-long-court.jpg',
    '2025-06-11 20:46:04'
  ),
  (
    7,
    2,
    'Abdos',
    '#d29f80',
    'https://musculation-nutrition.fr/wp-content/uploads/2019/06/gainage_abdominaux_musculation.jpg',
    '2025-06-11 20:46:28'
  ),
  (
    9,
    2,
    'Latérale Épaules',
    '#A0AEC0',
    'https://sp-ao.shortpixel.ai/client/to_auto,q_glossy,ret_img,w_925,h_400/https://passimale.fr/wp-content/uploads/2022/04/elevation-laterale-925x400.jpg',
    '2025-06-11 20:46:42'
  ),
  (
    11,
    2,
    'Triceps',
    '#388EFF',
    'https://squaregym.fr/app/uploads/2024/09/Triceps-dips-exercices.jpg',
    '2025-06-12 05:38:18'
  ),
  (
    12,
    2,
    'Avant épaules',
    '#FF6666',
    'uploads/fitness/group_6867a908292d1.jpg',
    '2025-06-12 08:30:18'
  ),
  (
    13,
    2,
    'Cardio',
    '#F6F924',
    'https://hips.hearstapps.com/hmg-prod/images/man-using-medicine-ball-at-cross-training-gym-royalty-free-image-1617118485.?crop=0.669xw:1.00xh;0.0505xw,0&resize=1200:*',
    '2025-06-12 08:33:53'
  ),
  (
    14,
    2,
    'Full Bodies',
    '#ADD1FF',
    'uploads/fitness/group_6867a93412ec1.jpg',
    '2025-07-04 10:13:08'
  ),
  (
    15,
    2,
    'Cardio modéré 1',
    '#00FF00',
    'uploads/fitness/group_686b6a678650a.png',
    '2025-07-07 06:34:16'
  ),
  (
    16,
    2,
    'Cardio modéré 1',
    '#00FF00',
    'uploads/fitness/group_686b6a6a21776.png',
    '2025-07-07 06:34:18'
  );

-- --------------------------------------------------------
--
-- Structure de la table `notes`
--
DROP TABLE IF EXISTS `notes`;

CREATE TABLE
  IF NOT EXISTS `notes` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `label_id` int DEFAULT NULL,
    `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `content` text COLLATE utf8mb4_unicode_ci,
    `status` enum ('active', 'archived') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    KEY `label_id` (`label_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 34 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `notes`
--
INSERT INTO
  `notes` (
    `id`,
    `user_id`,
    `label_id`,
    `title`,
    `content`,
    `status`,
    `created_at`,
    `updated_at`
  )
VALUES
  (
    3,
    2,
    2,
    'Supprimer tables gta',
    'BEGIN\n  -- Supprime chaque table une par une\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.pointageagent`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_route_path_parameters`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_referers_search_terms`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.users`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.parametreges`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_agents`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.motifspointage`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.projets`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_events`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.employees_projet`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.equipe_user`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_route_paths`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.planing_work_hours_user`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_query_arguments`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.planing_workhours`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.employees_equipe`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.equipes`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_sql_queries_log`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.pointagesemaie`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_system_classes`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.roles`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_paths`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.retardagent`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_referers`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.totalproductions`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_domains`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.banques`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.pauseagent`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.logserrorsusers`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_errors`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_routes`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.planing_days`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_connections`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_sql_query_bindings_parameters`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.contrats`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.permissions`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_languages`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_cookies`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_events_log`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.planingsremarque`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_sessions`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_queries`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_geoip`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.planing_modele`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_log`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.absences`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_devices`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.activity_log`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_sql_query_bindings`\';\nEXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.departements`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.fonctions`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.projet_user`\';\n  EXECUTE IMMEDIATE \'DROP TABLE `data-project-438313.dataproject_gta_mcc.tracker_sql_queries`\';\n\nEND;\n',
    'active',
    '2025-06-17 12:50:47',
    '2025-06-17 12:50:47'
  ),
  (
    4,
    2,
    3,
    'Prompt pour SQL en 90 jours',
    'Objectif : Maîtriser SQL et la gestion des bases de données relationnelles en 90 jours\n\nTu es mon formateur personnel pour apprendre SQL de manière complète et progressive pendant 90 jours.\nTu vas structurer l’apprentissage en modules hebdomadaires (1 module par semaine) et me proposer 1 exercice par jour.\n\nChaque jour, tu dois me fournir :\n\nLe nom du module de la semaine (ex : SELECT avancé, jointures, sous-requêtes, normalisation, procédures stockées, transactions, sécurité des données…)\n\nLe titre de l’exercice\n\nUn concept clé lié aux bases de données relationnelles ou au langage SQL (ex : ACID, normalisation, index, plan d\'exécution, injection SQL, vues, triggers, etc.)\n\nUne explication claire du concept\n\nUn énoncé d’exercice pratique, dans un contexte réel (ex : base de données d’un e-commerce, d’une école, d’un réseau social…)\n\nTu commences par me présenter la liste des modules répartis sur 13 semaines. Ensuite, tu me demandes si je suis prêt à commencer.\nQuand je te réponds « oui », tu me donnes l’exercice du jour 1, module 1, et tu attends ma réponse avant d’enchaîner sur la suite.',
    'active',
    '2025-06-18 12:43:50',
    '2025-06-18 12:55:19'
  ),
  (
    5,
    2,
    3,
    'Prompt pour Pythonen 90 jours',
    'Objectif : Maîtriser Python et la programmation logique/modulaire en 90 jours\n\nTu seras mon mentor pour apprendre et maîtriser Python en 90 jours. Tu diviseras les 90 jours en modules hebdomadaires (ex : structures de contrôle, POO, fichiers, modules, web, gestion des erreurs…).\n\nChaque jour, tu me donnes :\n\nLe module en cours\n\nLe titre de l’exercice\n\nUn concept clé de Python ou de son écosystème (ex : PEP8, fichiers JSON, virtualenv, import/export, decorators, compréhension de liste, frameworks web comme Flask ou Django...)\n\nUne courte explication du concept\n\nUn exercice pratique (ex : construire une appli console, créer un script de traitement de données, utiliser des fichiers, etc.)\n\nAvant de commencer, tu m’indiques la structure globale des modules, puis tu demandes si je suis prêt. Si je valide, tu commences au jour 1 et tu attends ma réponse avant d’aller plus loin.',
    'active',
    '2025-06-18 12:44:28',
    '2025-06-18 12:56:20'
  ),
  (
    7,
    2,
    3,
    '🟢 Prompt pour React en 90 jours',
    '🟢 Prompt pour React en 90 jours\nObjectif : Maîtriser React et les concepts modernes du développement frontend en 90 jours\n\nJe souhaite apprendre React en profondeur en 90 jours. Tu vas m\'accompagner dans cette progression, semaine après semaine, avec un module par semaine et un exercice par jour.\n\nÀ chaque exercice, tu m’indiques :\n\nLe module en cours (ex : composants, hooks, props, gestion d’état, router, effets, context API…)\n\nLe titre de l\'exercice\n\nUn concept clé de l’écosystème React ou frontend moderne (JSX, Virtual DOM, useEffect, lifting state up, lazy loading, code splitting, sécurité React, etc.)\n\nUne explication concise du concept\n\nUn exercice pratique et réaliste (ex : construire une mini app, intégrer une API, créer un système d’authentification simple, etc.)\n\nTu me présentes d’abord la progression complète des modules, puis tu me demandes si je suis prêt à démarrer. Si je réponds \"oui\", tu commences le jour 1 du premier module, et tu attends ma réponse avant de continuer.',
    'active',
    '2025-06-18 12:46:13',
    '2025-06-18 12:46:13'
  ),
  (
    8,
    2,
    3,
    '🟠 Prompt pour JavaScript en 90 jours',
    'Objectif : Maîtriser JavaScript moderne et l\'écosystème web en 90 jours\n\nTu seras mon coach pour apprendre et maîtriser JavaScript en 90 jours.\nTu découperas ces 90 jours en modules hebdomadaires (ex : fonctions, objets, DOM, asynchrone, modules, API, événements...), et chaque jour je recevrai un exercice structuré.\n\nChaque exercice doit inclure :\n\nLe module de la semaine\n\nLe titre de l’exercice\n\nUn concept clé de l’écosystème JavaScript ou du web (JSON, Fetch, CORS, Promises, Event Loop, Web Storage, LocalStorage, API REST, etc.)\n\nUne explication claire et concise du concept\n\nUn exercice pratique (ex : créer une TODO list, utiliser fetch pour charger des données, manipuler le DOM dynamiquement, etc.)\n\nAvant de commencer, tu m’indiques les modules répartis sur les 90 jours, et tu me demandes si je suis prêt. Si je confirme, tu lances le jour 1 avec l’exercice, et tu attends mon retour avant d’envoyer la suite.',
    'active',
    '2025-06-18 12:46:42',
    '2025-06-18 12:54:07'
  ),
  (
    10,
    2,
    3,
    '🟤 Prompt pour TypeScript en 90 jours',
    '🎯 Objectif : Maîtriser TypeScript et son écosystème fortement typé en 90 jours\n\nTu es mon formateur personnel pour apprendre TypeScript en 90 jours.\nLe programme est structuré autour de modules hebdomadaires (1 module par semaine), et chaque jour, tu me donneras 1 exercice pratique.\n\n✅ Chaque exercice doit contenir :\nLe nom du module de la semaine (ex : typage de base, interfaces, types personnalisés, génériques, classes, décorateurs, inférence, compatibilité JS, etc.)\n\nLe titre de l\'exercice\n\nUn concept clé lié à TypeScript ou à son écosystème (ex : transpilation, typesafety, interfaces vs types, union types, keyof, type guards, mapping types, strictNullChecks, configuration tsconfig.json, etc.)\n\nUne explication pédagogique du concept\n\nUn exercice concret adapté à un contexte réel ou professionnel (ex : validation de formulaire typé, mini API typée, classe utilisateur, use-case générique, intégration dans un projet React…)\n\nTu commences par me présenter :\n\nLa liste complète des modules hebdomadaires répartis sur les 90 jours\n\nUne brève explication de la progression\n\nPuis tu me demandes : « Est-ce que tu es prêt à commencer ? »\n\nQuand je réponds oui, tu me donnes :\n\nJour 1 / Module 1\n\nL’exercice complet (selon le format ci-dessus)\n\nEt tu attends ma réponse avant d’envoyer quoi que ce soit d’autre.\n\nL’objectif est de comprendre les types, éviter les erreurs au runtime, écrire du code robuste, et préparer une transition vers de gros projets React ou Node.js en TypeScript.',
    'active',
    '2025-06-18 12:47:19',
    '2025-06-18 12:47:19'
  ),
  (
    11,
    2,
    3,
    '🔵 Prompt pour PHP en 90 jours',
    'Objectif : Maîtriser PHP et l\'écosystème backend en 90 jours\n\nJe veux que tu sois mon formateur personnel pour apprendre et maîtriser PHP en 90 jours.\nChaque semaine, tu définiras un module (ex : POO, requêtes MySQL, sessions, sécurité, architecture MVC...), et chaque jour, tu me donneras un exercice pratique.\n\nPour chaque exercice, tu dois me fournir :\n\nLe nom du module de la semaine\n\nLe titre de l’exercice\n\nUn concept clé lié au développement backend (ex : XSS, injection SQL, sessions, routes, architecture MVC, PDO, environnement serveur, HTTP, etc.)\n\nUne courte explication du concept clé\n\nUn énoncé d’exercice concret et orienté projet (formulaires, base de données, logique métier, etc.)\n\nAvant de commencer, tu me présentes la structure des modules pour les 90 jours, et tu me demandes si je suis prêt à commencer. Une fois que je réponds \"oui\", tu démarres avec le premier exercice du jour 1, module 1, et tu attends ma réponse avant de continuer.',
    'active',
    '2025-06-18 12:48:13',
    '2025-06-18 12:52:15'
  ),
  (
    12,
    2,
    3,
    'Encapsulation CSS',
    '\"Ajoute #class devant toutes les classes CSS pour encapsuler les styles, sans modifier le reste du code, puis retourne-moi le tout tel quel.\"',
    'active',
    '2025-06-18 12:49:11',
    '2025-06-18 12:49:11'
  ),
  (
    13,
    2,
    3,
    'Amélioration synopsis',
    'Améliorer la rédaction des synopsis de films ou de séries, en les rendant concis, captivants et structurés (max 18 mots)\n',
    'active',
    '2025-06-18 12:49:46',
    '2025-06-18 12:49:46'
  ),
  (
    16,
    2,
    1,
    'VOCABULAIRE ARAB ( Darija )',
    '|******************************************|\n **** VOCABULAIRE ARAB ( Darija )  ******\n|******************************************|\n\nPersonne :\nsarbi   ====================================> ami\nRouya ====================================> frère\nArti  ====================================> Soeur\nDri =====================================> Enfant \n\nMot courant :\nBediminid  =======================> Laisse moi tranquille\nAtteny  ===============================>  Donne moi \nAfak =================================> S\'il te plait\nLafou =============================> Je vous en prie.\nyek ======================================> Oui \nShanwaï  =============================> Tu dis quoi ?\nSnoubrichi ====================>Tu voulais me dire quoi ?\nMendich ===============================> J\'ai pas.\nFemptini  ============================> Tu as compris.\nSmeïlia ==================================> Pardon\nMarba ================================>Bien venu.\nWaloo ====================================> Rien.\nFinaya ==============================> Elle/ Il est ou. \nBizef =================================> Beaucoups.\nShoukrane ================================> Merci\nKoulshi ===================================> Tout\nShouiya ==============================> Doucement\nmelk ================================>Tu as  Quoi ?\nShems ===================================> Soleil\nSarbi  ===================================> Frêre\nSarti ====================================> Soeur\nAlaj ===================================> Pourquoi\nShouma ===============================> La honte\nMalka ================================> La cuillière\nMousse ================================> Couteau \nN-casse ================================> Diminue\n\nSujet :\nana ===================================> Je / moi\nNti  =======================> Tu / Toi (féminin, singulier)\nNtia ======================> Tu / Toi (masculin, singulier) \nIl / Lui ================================> Howa / Hia\n\nPhrase courante :\nWesh andik ==================> Est-ce que tu as ? / As tu ?\nmalk  ========================> Ques-ce que tu as \nsnow andik ========================> Ques-ce que tu as\nMouchki Mouchki ====================>Pas de problème. \nKendrik ================================> Je t\'aime\nBritz ==================================> J\'ai envie\nMedouish maya ======================> Ne me parle pas\nalmni  ===============================> Aprend moi\nalmini  ===============================> Aprend moi\nBismilha ===========================> Au nom de Dieu\nAna jaïa ============================> J\'arrive\nScoot ===============================> Tais-toi \nN-casse shwouiya ======================> Diminue le prix\n( Le \"n\" se lit )\nAliments :\nMatesha =================================> Tomate\nHuile      =================================> zit\nSel         =================================> Mel ha\nRaisin sec ================================> Zbib',
    'active',
    '2025-06-18 12:59:07',
    '2025-06-25 09:08:55'
  ),
  (
    17,
    2,
    4,
    'Requête : Structure de table',
    'Requête : Structure de table (liste des colonnes, types, longueurs, nullabilité, identifiant)\n\n\nUSE bp127_admin;\nGO\n\nSELECT \n    c.name AS ColumnName,\n    t.name AS DataType,\n    c.max_length,\n    c.is_nullable,\n    c.is_identity\nFROM sys.columns c\nJOIN sys.types t ON c.user_type_id = t.user_type_id\nWHERE c.object_id = OBJECT_ID(\'Qualifications\');',
    'active',
    '2025-06-25 09:10:20',
    '2025-06-25 09:12:30'
  ),
  (
    18,
    2,
    4,
    'Recherche des colonnes et tables contenant',
    'Requête : Recherche des colonnes et tables contenant \'X\' dans leur nom avec types de données\n\n\nUSE bp127_ContactRouteReport;\n\nSELECT \n    DB_NAME() AS DatabaseName,\n    t.name AS TableName, \n    c.name AS ColumnName, \n    ty.name AS DataType\nFROM sys.tables t\nJOIN sys.columns c ON t.object_id = c.object_id\nJOIN sys.types ty ON c.user_type_id = ty.user_type_id\nWHERE c.name LIKE \'%EndReason%\' OR t.name LIKE \'%EndReason%\'\nORDER BY t.name;',
    'active',
    '2025-06-25 09:12:20',
    '2025-06-25 09:12:20'
  ),
  (
    19,
    2,
    NULL,
    'Compte',
    'GOOGLE:\nhandythequeen@gmail.com\nBiberon@241 ou Biberon@244',
    'active',
    '2025-06-25 09:35:34',
    '2025-06-25 11:32:26'
  ),
  (
    20,
    2,
    2,
    'Crée un ensemble de données sur Bigquerry',
    'CREATE SCHEMA `data-project-438313.dataproject_gta_mcc`;',
    'active',
    '2025-06-26 13:22:43',
    '2025-06-26 13:22:43'
  ),
  (
    21,
    2,
    NULL,
    'Dette Sandra',
    '**10.000** Pour la facture de la pharmacie.\n\n\n**50.000** pour le reste que tu me dois des babouches que je t\'ai envoyé la dernière fois.\n\n**60.000** du reste des parfums des huiles etc.\n\n**20.000** Facture ( fêtes des mères , Cartes de visite MMS ,  Catalogue MMS , Grille tarifaires JS )\nSoit un total de **120.000 FCFA**.',
    'active',
    '2025-06-27 19:40:17',
    '2025-07-04 10:22:47'
  ),
  (
    22,
    2,
    NULL,
    'KAMADEMIA',
    'Ignorer et passer au contenu\nHistorique de chat\n\nVous avez dit :\n“Hello, comment tu vas ?”\n00:01\nChatGPT a dit :\nSalut ! Je vais bien, merci ! Et toi, comment ça va ?\n\nVous avez dit :\n“Je veux qu\'on réfléchisse ensemble. Je suis développeur, comme tu le sais, et j\'ai un client qui m\'a demandé de lui faire un blog. Je voudrais que tu me dises quels sont les différents éléments qu\'on doit retrouver dans un blog, histoire de savoir comment je peux facturer ou du moins faire un devis au client, avec les éléments essentiels et les éléments que je pourrais rajouter en plus qui vont pouvoir améliorer l\'expérience utilisateur, enrichir le blog. A noter que sur le blog, il y aura la possibilité non seulement de faire des achats de certaines formations, lire des articles gratuitement, acheter des livres, de pouvoir aussi avoir une section podcast. Il faudra aussi qu\'il y ait la possibilité d\'avoir un espace administrateur, un peu comme un SaaS intégré, où les administrateurs auront la possibilité de manager les articles, voir un peu les statistiques des articles, un compteur de vue par article, et puis la possibilité naturellement de mettre en ligne des articles. Donc ça c\'est ce que moi j\'ai en tête tout de suite. Maintenant toi, dis-moi un peu globalement comment tu vois les choses.”\n01:30\nChatGPT a dit :\nD\'accord, je comprends. Alors, pour un blog avec les fonctionnalités que tu as mentionnées, voici les éléments essentiels et les options supplémentaires que tu pourrais envisager :\n\nÉléments essentiels :\nPage d\'accueil : Un résumé des derniers articles, catégories populaires, etc.\n\nArticles de blog : Possibilité de lire les articles avec des images, vidéos, etc.\n\nFonctionnalité de recherche : Pour trouver facilement des articles.\n\nCatégories et tags : Pour organiser les articles par sujet.\n\nSection commentaires : Permettre aux lecteurs de commenter les articles.\n\nFormulaire de contact : Pour que les visiteurs puissent contacter l\'administrateur.\n\nInscription et connexion : Pour permettre aux utilisateurs de créer un compte et se connecter.\n\nOptions supplémentaires :\nE-commerce : Intégration d\'une boutique pour vendre des formations, des livres, etc.\n\nSection podcast : Pour publier et écouter des podcasts directement sur le blog.\n\nEspace administrateur (SaaS) : Gestion des articles, statistiques (compteur de vues, etc.), mise en ligne d\'articles.\n\nSEO : Optimisation pour les moteurs de recherche (mots-clés, méta-descriptions, etc.).\n\nResponsive design : Assurer que le blog est bien visible sur tous les appareils (mobiles, tablettes, ordinateurs).\n\nSécurité : Mise en place de mesures de sécurité (certificat SSL, protection contre les attaques, etc.).\n\nAvec ces éléments, tu pourras structurer un devis détaillé pour ton client. Les fonctionnalités de base (articles, commentaires, recherche) seront les incontournables, tandis que les options supplémentaires (e-commerce, podcast, espace admin) peuvent être ajoutées selon les besoins et le budget.\n\nVous avez dit :\n“Parfait. Est-ce que tu as des idées pour chaque section qu\'on a cité, que ce soit le blog, le podcast et autres, des éléments qui peuvent être ajoutés, qui vont être innovants, qu\'on ne va pas forcément retrouver sur les autres sites ? Est-ce que tu as des propositions ?”\n00:18\nChatGPT a dit :\nBien sûr, voici des idées innovantes pour chaque section de ton blog :\n\n1. Blog :\nArticles interactifs : Intégrer des éléments interactifs comme des quiz, des sondages ou des infographies interactives pour engager les lecteurs.\n\nArticles personnalisés : Utiliser l\'IA pour recommander des articles en fonction des intérêts et du comportement de l\'utilisateur.\n\nArticles en réalité augmentée : Offrir des articles avec des éléments en réalité augmentée pour une expérience immersive.\n\n2. Podcast :\nPodcast interactif : Permettre aux auditeurs de poser des questions en direct ou de voter pour les sujets des prochains épisodes.\n\nPodcast avec transcription : Proposer une transcription textuelle des épisodes pour l\'accessibilité et le SEO.\n\nPodcast exclusif : Offrir des épisodes exclusifs pour les abonnés ou les membres premium.\n\n3. E-commerce :\nRecommandations personnalisées : Utiliser des algorithmes pour recommander des produits en fonction des achats précédents ou des préférences.\n\nEssai virtuel : Pour les formations ou livres, proposer un aperçu interactif ou un extrait gratuit.\n\nAbonnements : Offrir des abonnements mensuels ou annuels pour un accès illimité à des formations ou contenus premium.\n\n4. Espace administrateur (SaaS) :\nAnalytique avancée : Intégrer des outils d\'analyse avancée pour suivre les performances des articles (taux de conversion, engagement, etc.).\n\nGestion des utilisateurs : Offrir des rôles et permissions personnalisables pour différents types d\'utilisateurs (auteurs, éditeurs, administrateurs).\n\nAutomatisation : Mettre en place des automatisations pour la publication d\'articles, notifications, etc.\n\nCes idées peuvent vraiment distinguer le blog de ton client et offrir une expérience unique aux utilisateurs.\n\nVous avez dit :\n“Super, merci beaucoup.”\n00:01\nChatGPT a dit :\nAvec plaisir ! Si tu as d\'autres questions ou besoin d\'aide pour le projet, n\'hésite pas. Bonne chance avec ton blog !\n\n\n\n\nAucun fichier choisiAucun fichier choisi\nChatGPT peut faire des erreurs. Envisagez de vérifier les informations importantes.',
    'active',
    '2025-06-28 20:43:12',
    '2025-06-28 20:43:12'
  ),
  (
    23,
    2,
    NULL,
    'Tourrisme:',
    'Plage ;\nMarina Kayak ;\nHilton ;\nMosolé Tour Hassan ;\nZoo de Rabat ;\nRepas Macdo;\nRepas Marina ;\nCaffée ;\n\nMe renseigner pour d\'autre restau lieu insolite au pret d\'imane Zaki et Marie',
    'active',
    '2025-06-28 21:48:02',
    '2025-06-28 21:48:02'
  ),
  (
    24,
    2,
    5,
    'Notions à revoir en JS:',
    'Tableau ;\nObjects;\nForeach;\nPorté des variables ;',
    'active',
    '2025-06-28 22:04:02',
    '2025-07-08 09:50:51'
  ),
  (
    25,
    2,
    5,
    'Notions à revoir en SQL:',
    '- OFFSET\n- HAVING\n- INNER JOIN',
    'active',
    '2025-06-28 22:57:00',
    '2025-07-04 08:52:42'
  ),
  (
    27,
    2,
    NULL,
    NULL,
    '## Me renseigneret assimiler les termes\n##  **Workflow **\n**déploiement continue **',
    'active',
    '2025-07-04 15:49:25',
    '2025-07-05 20:19:55'
  ),
  (
    28,
    2,
    NULL,
    'Suivis de l\'historique de la V3 - Kakiplay',
    '1- Mise à jour de la barre de recherche\n   -Toutes les recherches fonctionnes ;\n   -Styles nétoyer et adapter.\n\n2-Mise à jour de l\'overlay des titres\n   -Réglage de la lecture ;\n   -Nouveau design ;\n   -Amélioration de l\'affichage ;\n   -Permettre un déployement pls facile et à volonter de l\'overlay ;\n   - Rajout du nom d\'artiste clicable et affichage du badge pour les artistes kakiverse.\n   - Affichage automatique de tous les titres en lecture.',
    'active',
    '2025-07-05 20:22:20',
    '2025-07-05 22:15:19'
  ),
  (
    29,
    2,
    NULL,
    'Prompt',
    'à partir de maintennat ne rajoute aucun commentaire dans le code que tu me  fournis sauf les commentaires délimitateur de section , je veux un code propre pour la suite .>',
    'active',
    '2025-07-07 11:49:10',
    '2025-07-08 10:12:31'
  ),
  (
    30,
    2,
    NULL,
    NULL,
    'Maintennat pourquoi mes sections ne s\'affichent plus ?\n\nmanagement.php?section=fitness:2734 Uncaught (in promise) TypeError: Cannot read properties of null (reading \'addEventListener\')\n    at initPlanningTab (management.php?section=fitness:2734:34)\n    at activateTab (management.php?section=fitness:3797:38)\n    at setupTabs (management.php?section=fitness:3811:9)\n    at initFitnessPage (management.php?section=fitness:3781:5)\ninitPlanningTab @ management.php?section=fitness:2734\nactivateTab @ management.php?section=fitness:3797\nsetupTabs @ management.php?section=fitness:3811\ninitFitnessPage @ management.php?section=fitness:3781\nawait in initFitnessPage\n(anonymous) @ management.php?section=fitness:3823\nmanagement.php?section=fitness:2774 Uncaught TypeError: Cannot read properties of undefined (reading \'length\')\n    at Object.workouts (management.php?section=fitness:2774:34)\n    at initBibliothequeTab (management.php?section=fitness:2958:16)\n    at activateTab (management.php?section=fitness:3799:38)\n    at HTMLDivElement.<anonymous> (management.php?section=fitness:3809:28)\nworkouts @ management.php?section=fitness:2774\ninitBibliothequeTab @ management.php?section=fitness:2958\nactivateTab @ management.php?section=fitness:3799\n(anonymous) @ management.php?section=fitness:3809\nmanagement.php?section=fitness:3835 Initialisation de l\'onglet Calendrier Global.\nmanagement.php?section=fitness:4134 Uncaught TypeError: Cannot read properties of null (reading \'addEventListener\')\n    at initGlobalCalendarTab (management.php?section=fitness:4134:29)\n    at activateTab (management.php?section=fitness:3800:38)\n    at HTMLDivElement.<anonymous> (management.php?section=fitness:3809:28)\ninitGlobalCalendarTab @ management.php?section=fitness:4134\nactivateTab @ management.php?section=fitness:3800\n(anonymous) @ management.php?section=fitness:3809\nmanagement.php?section=fitness:2994 initProgressTab: Démarrage de l\'initialisation de l\'onglet Progression.\nmanagement.php?section=fitness:3403 initProgressTab.init: Appel API pour les stats de progression.\nmanagement.php?section=fitness:3404 Uncaught (in promise) TypeError: Cannot read properties of undefined (reading \'utils\')\n    at init (management.php?section=fitness:3404:38)\n    at initProgressTab (management.php?section=fitness:3413:9)\n    at activateTab (management.php?section=fitness:3801:38)\n    at HTMLDivElement.<anonymous> (management.php?section=fitness:3809:28)\ninit @ management.php?section=fitness:3404\ninitProgressTab @ management.php?section=fitness:3413\nactivateTab @ management.php?section=fitness:3801\n(anonymous) @ management.php?section=fitness:3809\nmanagement.php?section=fitness:3614 Uncaught TypeError: Cannot read properties of null (reading \'addEventListener\')\n    at Object.setupDropZone (management.php?section=fitness:3614:29)\n    at init (management.php?section=fitness:3638:22)\n    at initNutritionTab (management.php?section=fitness:3668:9)\n    at activateTab (management.php?section=fitness:3802:39)\n    at HTMLDivElement.<anonymous> (management.php?section=fitness:3809:28)\nsetupDropZone @ management.php?section=fitness:3614\ninit @ management.php?section=fitness:3638\ninitNutritionTab @ management.php?section=fitness:3668\nactivateTab @ management.php?section=fitness:3802\n(anonymous) @ management.php?section=fitness:3809\nmanagement.php?section=fitness:3539 Uncaught (in promise) TypeError: Cannot read properties of undefined (reading \'utils\')\n    at Object.fetchAndRenderCalendar (management.php?section=fitness:3539:42)\n    at init (management.php?section=fitness:3637:22)\n    at initNutritionTab (management.php?section=fitness:3668:9)\n    at activateTab (management.php?section=fitness:3802:39)\n    at HTMLDivElement.<anonymous> (management.php?section=fitness:3809:28)\nfetchAndRenderCalendar @ management.php?section=fitness:3539\ninit @ management.php?section=fitness:3637\ninitNutritionTab @ management.php?section=fitness:3668\nactivateTab @ management.php?section=fitness:3802\n(anonymous) @ management.php?section=fitness:3809\nmanagement.php?section=fitness:2734 Uncaught TypeError: Cannot read properties of null (reading \'addEventListener\')\n    at initPlanningTab (management.php?section=fitness:2734:34)\n    at activateTab (management.php?section=fitness:3797:38)\n    at HTMLDivElement.<anonymous> (management.php?section=fitness:3809:28)\ninitPlanningTab @ management.php?section=fitness:2734\nactivateTab @ management.php?section=fitness:3797\n(anonymous) @ management.php?section=fitness:3809',
    'active',
    '2025-07-07 12:57:44',
    '2025-07-08 08:42:35'
  ),
  (
    31,
    2,
    NULL,
    NULL,
    'Plus le problème est douleureu , plus ils vont être pêt à payer.\n\nPlus le problème est urgent, plus le prix devient secondaire.\n\nPlus le produit touche à l\'identité des gens, plus c\'est fort.\n\nPlus le problème est populaire, plus tu vas pouvoir toucher du monde.\n\nPlus le problème est fréquent, plus tu vas gagner de l\'argent.\n\n\nSi tu veux être dans le top 1% tu dois développer une combinaison de compétences unique.',
    'active',
    '2025-07-11 10:03:25',
    '2025-07-11 10:08:59'
  ),
  (
    32,
    2,
    NULL,
    'Citation :',
    'Ne vends jamais un produit, ton temps ou une caractéristique.\nVends une transformation.\nVends un voyage émotionnel.\nVends un changement d\'identité.\n( Auteur : David Laroche : Entrepreneur, coach et conseiller de dirigeants et top performer.)\n\n\nL\'argent n\'obéis paas aux travailleurs il obéit aux créateurs de valeurs. ( Auteur : David Laroche : Entrepreneur, coach et conseiller de dirigeants et top performer.)',
    'active',
    '2025-07-11 11:12:44',
    '2025-07-11 11:23:34'
  ),
  (
    33,
    2,
    NULL,
    NULL,
    '/* Global Reset & Base Styles */\nhtml,\nbody,\n#root {\n  height: 100%;\n  width: 100%;\n  overflow: hidden;\n  margin: 0;\n  font-family: \"Inter\", sans-serif;\n  -webkit-font-smoothing: antialiased;\n  -moz-osx-font-smoothing: grayscale;\n  text-rendering: optimizeLegibility;\n}\n\n.app-layout {\n  display: flex;\n  flex-direction: column;\n  height: 100%;\n  width: 100%;\n}\n\n.main-section {\n  display: flex;\n  flex: 1;\n  overflow: hidden;\n}\n\n/* Desktop Styles (Default) */\n.sidebar {\n  background-color: transparent;\n  color: var(--text-dark);\n  width: 250px;\n  padding: 0.5rem 1rem;\n  flex-shrink: 0;\n  overflow-y: auto;\n  transition: width 0.3s ease-in-out;\n  display: block;\n  border-right: 9px solid black;\n}\n\n.main-content {\n  color: var(--text-dark);\n  flex: 1;\n  display: flex;\n  flex-direction: column;\n  overflow-y: auto;\n  padding-top: 0;\n  transition: flex 0.3s ease-in-out, transform 0.3s ease-in-out,\n    opacity 0.3s ease-in-out;\n}\n\n.navbar {\n  background-color: transparent;\n  color: var(--text-dark);\n  padding: 1rem;\n  display: flex;\n  justify-content: space-between;\n  align-items: center;\n  flex-shrink: 0;\n  position: sticky;\n  top: 0;\n  z-index: 10;\n}\n\n.navbar-left {\n  display: flex;\n  align-items: center;\n  gap: 15px;\n}\n\n.navbar-right {\n  display: flex;\n  align-items: center;\n  gap: 20px;\n}\n\n.nav-icon-button {\n  background: none;\n  border: none;\n  color: var(--text-dark);\n  font-size: 1.2rem;\n  cursor: pointer;\n  transition: color 0.2s ease;\n}\n\n.nav-icon-button:hover {\n  color: var(--color-primary);\n}\n\n.profile-pic {\n  width: 35px;\n  height: 35px;\n  border-radius: 50%;\n  object-fit: cover;\n  cursor: pointer;\n  border: 2px solid transparent;\n  transition: border-color 0.2s ease;\n}\n\n.profile-pic:hover {\n  border-color: var(--color-primary);\n}\n\n.search-area {\n  position: relative;\n  display: flex;\n  align-items: center;\n}\n\n.search-toggle-button {\n  z-index: 2;\n  position: relative;\n  transition: opacity 0.3s ease-out;\n}\n\n.search-toggle-button.is-hidden {\n  opacity: 0;\n  pointer-events: none;\n}\n\n.search-input-wrapper {\n  background-color: rgba(255, 255, 255, 0.1);\n  border: 1px solid rgba(255, 255, 255, 0.2);\n  border-radius: 20px;\n  overflow: hidden;\n  display: flex;\n  align-items: center;\n\n  width: 0;\n  padding: 0;\n  opacity: 0;\n  transform: translateX(-10px);\n  pointer-events: none;\n\n  transition: width 0.3s ease-out, opacity 0.3s ease-out,\n    transform 0.3s ease-out, padding 0.3s ease-out;\n\n  position: absolute;\n  right: 0;\n  z-index: 1;\n  height: 35px;\n}\n\n.search-input-wrapper.is-open {\n  width: 250px;\n  padding: 8px 15px;\n  opacity: 1;\n  transform: translateX(0);\n  pointer-events: auto;\n}\n\n.search-icon-inside-input {\n  color: rgba(255, 255, 255, 0.5);\n  margin-right: 10px;\n  font-size: 1.1rem;\n}\n\n.search-input {\n  background: none;\n  border: none;\n  color: var(--text-dark);\n  font-size: 0.9rem;\n  outline: none;\n  width: 100%;\n  padding: 0;\n}\n\n.search-input::placeholder {\n  color: rgba(255, 255, 255, 0.5);\n}\n\n.player {\n  background-color: var(--color-footer);\n  color: var(--text-dark);\n  padding: 5px 20px;\n  display: flex;\n  align-items: center;\n  justify-content: flex-start;\n  flex-shrink: 0;\n  gap: 30px;\n  min-height: 60px;\n}\n\n.player-left {\n  display: flex;\n  align-items: center;\n  gap: 15px;\n  flex-shrink: 0;\n  flex-grow: 0;\n  min-width: 0;\n  cursor: pointer;\n}\n\n.album-art {\n  width: 50px;\n  height: 50px;\n  border-radius: 5px;\n  object-fit: cover;\n  flex-shrink: 0;\n}\n\n.song-info {\n  display: flex;\n  flex-direction: column;\n  min-width: 0;\n}\n\n.song-title {\n  font-weight: bold;\n  white-space: nowrap;\n  overflow: hidden;\n  text-overflow: ellipsis;\n  font-size: 0.95rem;\n}\n\n.artist-name {\n  font-size: 0.8rem;\n  color: rgba(255, 255, 255, 0.7);\n  white-space: nowrap;\n  overflow: hidden;\n  text-overflow: ellipsis;\n}\n\n.heart-icon {\n  color: var(--color-primary);\n  margin-left: 8px;\n}\n\n.player-center-group {\n  display: flex;\n  flex-direction: row;\n  align-items: center;\n  flex: 1;\n  gap: 20px;\n  min-width: 0;\n}\n\n.progress-container {\n  display: flex;\n  align-items: center;\n  flex-grow: 1;\n  gap: 10px;\n  min-width: 150px;\n  width: 100%;\n}\n\n.current-time,\n.total-time {\n  font-size: 0.8rem;\n  color: rgba(255, 255, 255, 0.7);\n  flex-shrink: 0;\n}\n\n.progress-slider {\n  -webkit-appearance: none;\n  width: 100%;\n  height: 6px;\n  background: #555;\n  border-radius: 3px;\n  outline: none;\n  transition: background 0.2s ease;\n  flex-grow: 1;\n  cursor: pointer;\n  --progress: 0%;\n}\n\n.progress-slider::-webkit-slider-runnable-track {\n  width: 100%;\n  height: 6px;\n  background: linear-gradient(\n    to right,\n    var(--color-primary) var(--progress),\n    #555 var(--progress)\n  );\n  border-radius: 3px;\n}\n\n.progress-slider::-webkit-slider-thumb {\n  -webkit-appearance: none;\n  width: 16px;\n  height: 16px;\n  border-radius: 50%;\n  background: var(--color-primary);\n  cursor: pointer;\n  margin-top: -5px;\n  box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);\n}\n\n.progress-slider::-moz-range-track {\n  width: 100%;\n  height: 6px;\n  background: linear-gradient(\n    to right,\n    var(--color-primary) var(--progress),\n    #555 var(--progress)\n  );\n  border-radius: 3px;\n}\n\n.progress-slider::-moz-range-thumb {\n  width: 16px;\n  height: 16px;\n  border-radius: 50%;\n  background: var(--color-primary);\n  cursor: pointer;\n  border: none;\n  box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);\n}\n\n.player-buttons-group {\n  display: flex;\n  align-items: center;\n  gap: 15px;\n  flex-shrink: 0;\n}\n\n.control-button {\n  font-size: 1.1rem;\n  color: var(--text-dark);\n  padding: 6px;\n  transition: color 0.2s ease;\n}\n\n.control-button:hover {\n  color: var(--color-primary);\n}\n\n.play-pause-button {\n  background-color: var(--color-primary);\n  border-radius: 50%;\n  width: 40px;\n  height: 40px;\n  display: flex;\n  align-items: center;\n  justify-content: center;\n  font-size: 1.3rem;\n  color: #121212;\n  transition: transform 0.2s ease;\n}\n\n.play-pause-button:hover {\n  transform: scale(1.05);\n}\n\n.volume-container {\n  display: flex;\n  align-items: center;\n  gap: 8px;\n  width: 120px;\n  flex-shrink: 0;\n  margin-left: auto;\n}\n\n.volume-icon {\n  font-size: 1.1rem;\n  color: var(--text-dark);\n}\n\n.volume-slider {\n  -webkit-appearance: none;\n  width: 100%;\n  height: 4px;\n  background: #555;\n  border-radius: 2px;\n  outline: none;\n  transition: background 0.2s ease;\n  cursor: pointer;\n  --volume: 0%;\n}\n\n.volume-slider::-webkit-slider-runnable-track {\n  width: 100%;\n  height: 4px;\n  background: linear-gradient(\n    to right,\n    var(--color-primary) var(--volume),\n    #555 var(--volume)\n  );\n  border-radius: 2px;\n}\n\n.volume-slider::-webkit-slider-thumb {\n  -webkit-appearance: none;\n  width: 12px;\n  height: 12px;\n  border-radius: 50%;\n  background: var(--color-primary);\n  cursor: pointer;\n  margin-top: -4px;\n  box-shadow: 0 0 3px rgba(0, 0, 0, 0.5);\n}\n\n.volume-slider::-moz-range-track {\n  width: 100%;\n  height: 4px;\n  background: linear-gradient(\n    to right,\n    var(--color-primary) var(--volume),\n    #555 var(--volume)\n  );\n  border-radius: 2px;\n}\n\n.volume-slider::-moz-range-thumb {\n  width: 12px;\n  height: 12px;\n  border-radius: 50%;\n  background: var(--color-primary);\n  cursor: pointer;\n  border: none;\n  box-shadow: 0 0 3px rgba(0, 0, 0, 0.5);\n}\n\n.sidebar-section h3 {\n  margin-top: 1rem;\n  margin-bottom: 0.5rem;\n  color: var(--color-footer);\n  text-transform: uppercase;\n  font-size: 0.8rem;\n  font-weight: bold;\n  padding-left: 0.5rem;\n}\n\n.sidebar-section ul {\n  list-style: none;\n  padding: 0;\n  margin: 0;\n}\n\n.sidebar-section li {\n  margin-bottom: 0.25rem;\n}\n\n.sidebar-section a {\n  color: var(--text-dark);\n  text-decoration: none;\n  padding: 0.5rem;\n  height: 40px;\n  display: flex;\n  align-items: center;\n  transition: background-color 0.2s var(--transition-easing),\n    color 0.2s var(--transition-easing);\n  position: relative;\n  overflow: hidden;\n  padding-left: 1rem;\n}\n\n.sidebar-section a:hover {\n  background-color: var(--sidebar-item-hover-bg-dark);\n  color: var(--sidebar-item-hover-text-dark);\n}\n\n.sidebar-section a.active {\n  background: linear-gradient(\n    to right,\n    var(--color-footer) 0%,\n    rgba(11, 83, 69, 0.2) 70%,\n    transparent 100%\n  );\n  color: var(--text-dark);\n  font-weight: bold;\n}\n\n.sidebar-section a.active::before {\n  content: \"\";\n  position: absolute;\n  left: 0;\n  top: 50%;\n  transform: translateY(-50%);\n  width: 4px;\n  height: 95%;\n  background-color: white;\n}\n\n.sidebar-icon {\n  margin-right: 10px;\n  width: 20px;\n  text-align: center;\n}\n\n.page-content {\n  padding: 1rem;\n  flex: 1;\n}\n\n.sidebar-header {\n  padding: 1rem 0;\n  text-align: center;\n  margin-bottom: 1rem;\n}\n\n.sidebar-logo {\n  max-width: 150px;\n  height: auto;\n  margin: 0 auto;\n}\n\n.mobile-menu-trigger,\n.sidebar-close-btn {\n  background: none;\n  border: none;\n  font-size: 1.5rem;\n  font-weight: bolder;\n  cursor: pointer;\n  z-index: 1002;\n  color: white;\n  background-color: var(--color-footer);\n  padding: 0.2rem;\n  aspect-ratio: 1;\n  height: 40px;\n  width: 40px;\n  border-radius: 100%;\n}\n\n/* Full Screen Player Styles */\n.full-screen-player {\n  position: fixed;\n  top: 0;\n  left: 0;\n  width: 100%;\n  height: 100%;\n  z-index: 2000;\n  display: flex;\n  flex-direction: column;\n  color: var(--text-dark);\n\n  transform: translateY(100%);\n  opacity: 0;\n  visibility: hidden;\n  pointer-events: none;\n  transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out,\n    visibility 0.3s;\n}\n\n.full-screen-player.is-open {\n  transform: translateY(0);\n  opacity: 1;\n  visibility: visible;\n  pointer-events: auto;\n}\n\n.full-screen-header {\n  display: flex;\n  justify-content: flex-end;\n  padding: 1rem;\n  flex-shrink: 0;\n}\n\n.full-screen-close-button {\n  background: none;\n  border: none;\n  color: var(--color-primary);\n  font-size: 2.5rem;\n  cursor: pointer;\n}\n\n.full-screen-content {\n  flex: 1;\n  display: flex;\n  flex-direction: column;\n  align-items: center;\n  justify-content: center;\n  padding: 15px;\n  text-align: center;\n  gap: 15px;\n  overflow-y: auto;\n}\n\n.full-screen-album-art {\n  width: clamp(200px, 60vw, 250px);\n  height: clamp(200px, 60vw, 250px);\n  border-radius: 8px;\n  object-fit: cover;\n  margin-bottom: 10px;\n  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.5);\n}\n\n.full-screen-song-info {\n  margin-bottom: 10px;\n}\n\n.full-screen-song-title {\n  font-size: clamp(1.4rem, 3.5vw, 1.7rem);\n  font-weight: bold;\n  margin-bottom: 3px;\n}\n\n.full-screen-artist-name {\n  font-size: clamp(0.9rem, 2vw, 1.1rem);\n  color: rgba(255, 255, 255, 0.7);\n}\n\n.full-screen-progress-section {\n  width: clamp(250px, 70vw, 400px);\n  margin-bottom: 15px;\n}\n\n.full-screen-controls-section {\n  display: flex;\n  justify-content: center;\n  align-items: center;\n  gap: clamp(10px, 1.5vw, 15px);\n  margin-bottom: 15px;\n}\n\n.full-screen-controls-section .control-button {\n  font-size: clamp(1rem, 1.5vw, 1.2rem);\n  padding: clamp(3px, 0.4vw, 4px);\n}\n\n.full-screen-controls-section .play-pause-button {\n  width: clamp(30px, 4vw, 45px);\n  height: clamp(30px, 4vw, 45px);\n  font-size: clamp(1.2rem, 2vw, 1.6rem);\n}\n\n.full-screen-volume-section {\n  display: flex;\n  align-items: center;\n  gap: 8px;\n  width: clamp(120px, 30vw, 180px);\n  margin-bottom: 15px;\n}\n\n.full-screen-volume-section .volume-icon {\n  font-size: clamp(1rem, 2vw, 1.2rem);\n}\n\n/* Media Queries for Responsive Design */\n@media (max-width: 1024px) {\n  .sidebar {\n    width: 200px;\n    padding-top: 0.8rem;\n    padding-bottom: 0.8rem;\n  }\n  .sidebar-section h3 {\n    font-size: 0.75rem;\n  }\n  .sidebar-section a {\n    padding: 0.4rem;\n    height: 35px;\n  }\n  .player {\n    padding: 0.8rem;\n  }\n}\n\n@media (max-width: 768px) {\n  .app-layout {\n    flex-direction: column;\n    overflow: hidden; /* Prevent body scroll when sidebars open */\n  }\n\n  .main-section {\n    flex-direction: column;\n    overflow: hidden; /* Clip content for sliding panels */\n    position: relative; /* Context for absolute positioning of sidebars */\n    width: 100%; /* Ensure it spans full width */\n    height: 100%; /* Ensure it takes full height to contain absolute children */\n  }\n\n  .mobile-menu-trigger {\n    display: block;\n    position: fixed;\n    top: 1rem;\n    left: 1rem;\n    z-index: 900;\n  }\n\n  .sidebar {\n    border-right: none;\n  }\n\n  .sidebar {\n    position: fixed; /* Left sidebar still fixed */\n    top: 0;\n    left: -350px;\n    width: 250px;\n    height: 100%;\n    background: var(--background-dark);\n    padding: 1rem;\n    box-shadow: 2px 0 5px rgba(0, 0, 0, 0.5);\n    transition: left 0.3s var(--transition-easing);\n    z-index: 1001;\n    overflow-y: auto;\n    display: block;\n  }\n\n  .sidebar.is-open {\n    left: 0;\n  }\n\n  .sidebar-close-btn {\n    position: absolute;\n    top: 1rem;\n    right: 1rem;\n  }\n\n  .main-content {\n    flex: 1;\n    padding: 0;\n    transform: translateX(0);\n    opacity: 1;\n    pointer-events: auto;\n    transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out; /* Add transition */\n  }\n\n  .navbar {\n    border-bottom: none;\n    padding-left: 60px;\n    width: 100%; /* Ensure navbar takes full width */\n  }\n\n  .page-content {\n    padding: 0.8rem;\n  }\n\n  .player {\n    flex-direction: row;\n    min-height: 80px;\n    padding: 10px;\n    flex-wrap: nowrap;\n    justify-content: space-between;\n    align-items: center;\n    width: 100%; /* Ensure player takes full width */\n  }\n\n  .player-left {\n    flex: 1 1 auto;\n    max-width: 120px;\n    gap: 8px;\n  }\n\n  .album-art {\n    width: 45px;\n    height: 45px;\n  }\n\n  .song-info {\n    flex: 1;\n    min-width: 0;\n  }\n\n  .song-title {\n    font-size: 0.85rem;\n  }\n\n  .artist-name {\n    font-size: 0.7rem;\n  }\n\n  .player-center-group {\n    flex-direction: row;\n    gap: 15px;\n    flex: none;\n    width: auto;\n  }\n\n  .progress-container {\n    display: none;\n  }\n\n  .player-buttons-group {\n    display: flex;\n    align-items: center;\n    gap: 15px;\n    flex-wrap: nowrap;\n  }\n\n  .desktop-shuffle-button,\n  .desktop-repeat-button {\n    display: none;\n  }\n\n  .mobile-shuffle-button {\n    display: block;\n    font-size: 1.5rem;\n    color: var(--color-primary);\n  }\n\n  .play-pause-button {\n    width: 40px;\n    height: 40px;\n    font-size: 1.3rem;\n  }\n\n  .volume-container {\n    display: none;\n  }\n\n  .main-section {\n    padding-bottom: 80px;\n    position: relative;\n  }\n\n  .app-layout.sidebar-open::before {\n    content: \"\";\n    position: fixed;\n    top: 0;\n    left: 0;\n    right: 0;\n    bottom: 0;\n    background: rgba(0, 0, 0, 0.5);\n    z-index: 1000;\n    cursor: pointer;\n  }\n\n  /* Right Sidebar mobile display - within main-section */\n  .right-sidebar {\n    position: absolute; /* Positioned relative to main-section */\n    top: 0;\n    left: 100%; /* Fully hidden off-screen to the right of main-section */\n    width: 100%; /* Takes full width of main-section when open */\n    height: 100%;\n    background: var(--background-dark);\n    padding: 1rem;\n    box-shadow: -5px 0 10px rgba(0, 0, 0, 0.5);\n    transition: left 0.3s var(--transition-easing);\n    z-index: 100; /* Lower z-index than left sidebar, higher than main-content */\n    overflow-y: auto;\n    border-left: none;\n    display: block; /* Ensure it\'s block for transition */\n  }\n\n  .right-sidebar.is-open {\n    left: 0; /* Slides into view */\n    width: 100%;\n    padding: 1rem;\n  }\n\n  /* When right sidebar is open, push main-content out */\n  .main-content.is-hidden-by-right-sidebar {\n    transform: translateX(-100%); /* Push main-content off-screen to the left */\n    opacity: 0;\n    pointer-events: none;\n  }\n\n  /* Right Sidebar Toggle Button Mobile state */\n  .right-sidebar-toggle-button {\n    display: block !important;\n    background-color: rgba(0, 0, 0, 0.3);\n    color: var(--text-dark);\n    border-radius: 50%;\n    width: 35px;\n    height: 35px;\n    font-size: 1rem;\n    right: 10px;\n    top: calc(50% - 17.5px);\n    transition: right 0.3s var(--transition-easing), background-color 0.2s ease,\n      color 0.2s ease;\n    box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);\n    z-index: 1002;\n    position: fixed;\n  }\n\n  .right-sidebar-toggle-button:hover {\n    background-color: rgba(0, 0, 0, 0.5);\n    color: var(--color-primary);\n  }\n\n  .right-sidebar-toggle-button.is-open {\n    right: 10px;\n    border-radius: 50%;\n  }\n\n  /* Overlay for Right Sidebar (no global overlay for this setup, main-content pushes out) */\n  .app-layout.right-sidebar-open::after {\n    content: none;\n  }\n\n  .app-layout.right-sidebar-open {\n    overflow: hidden; /* Prevent body scroll when right sidebar opens */\n  }\n}\n\n@media (min-width: 991px) {\n  .mobile-menu-trigger,\n  .sidebar-close-btn,\n  .mobile-shuffle-button {\n    display: none !important;\n  }\n\n  .desktop-shuffle-button,\n  .desktop-repeat-button {\n    display: block;\n  }\n\n  .player-center-group {\n    flex-direction: row;\n    gap: 20px;\n  }\n\n  .progress-container {\n    display: flex;\n  }\n\n  .volume-container {\n    display: flex;\n  }\n\n  /* Desktop search bar always visible */\n  .search-area {\n    position: static;\n    display: flex;\n    align-items: center;\n  }\n\n  .search-toggle-button {\n    display: none !important;\n  }\n\n  .search-input-wrapper {\n    width: 500px;\n    padding: 10px 15px;\n    opacity: 1;\n    transform: translateX(0);\n    pointer-events: auto;\n\n    transition: none;\n    position: static;\n    right: auto;\n    z-index: auto;\n    margin-left: 0;\n    height: 35px;\n  }\n\n  .search-input-wrapper.is-open {\n    /* No specific changes needed here, as default state is overridden */\n  }\n\n  .search-icon-inside-input {\n    display: inline-block;\n  }\n\n  .navbar-right {\n    gap: 15px;\n  }\n}\n\n/* Ensure desktop display for right sidebar and toggle */\n@media (min-width: 769px) {\n  .right-sidebar {\n    display: block;\n  }\n  .right-sidebar-toggle-button {\n    display: flex;\n  }\n}',
    'active',
    '2025-07-11 11:14:46',
    '2025-07-11 11:14:46'
  );

-- --------------------------------------------------------
--
-- Structure de la table `note_images`
--
DROP TABLE IF EXISTS `note_images`;

CREATE TABLE
  IF NOT EXISTS `note_images` (
    `id` int NOT NULL AUTO_INCREMENT,
    `note_id` int NOT NULL,
    `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `note_id` (`note_id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- --------------------------------------------------------
--
-- Structure de la table `note_labels`
--
DROP TABLE IF EXISTS `note_labels`;

CREATE TABLE
  IF NOT EXISTS `note_labels` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `note_labels`
--
INSERT INTO
  `note_labels` (`id`, `user_id`, `name`, `color`, `created_at`)
VALUES
  (1, 2, 'All', '#c8c6c6', '2025-06-17 12:41:36'),
  (
    2,
    2,
    'Requettes bigquery',
    '#ffffff',
    '2025-06-17 12:50:06'
  ),
  (3, 2, 'Prompt', '#a3fff4', '2025-06-18 12:43:32'),
  (
    4,
    2,
    'Requettes SQL Server',
    '#ffe894',
    '2025-06-25 09:09:35'
  ),
  (
    5,
    2,
    'Programation',
    '#d1fffe',
    '2025-06-28 22:04:33'
  );

-- --------------------------------------------------------
--
-- Structure de la table `nutrition_drinks`
--
DROP TABLE IF EXISTS `nutrition_drinks`;

CREATE TABLE
  IF NOT EXISTS `nutrition_drinks` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `drink_type` enum ('Eau', 'Café', 'Thé', 'Autre') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Eau',
    `quantity_ml` int NOT NULL,
    `log_time` datetime NOT NULL,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `nutrition_drinks`
--
INSERT INTO
  `nutrition_drinks` (
    `id`,
    `user_id`,
    `drink_type`,
    `quantity_ml`,
    `log_time`
  )
VALUES
  (1, 2, 'Eau', 250, '2025-06-17 17:04:09'),
  (2, 2, 'Thé', 200, '2025-06-17 17:04:20'),
  (3, 2, 'Café', 100, '2025-06-30 11:38:12'),
  (4, 2, 'Eau', 250, '2025-06-30 14:12:59'),
  (5, 2, 'Café', 100, '2025-06-30 14:34:58'),
  (6, 2, 'Eau', 250, '2025-06-30 14:35:00'),
  (7, 2, 'Café', 100, '2025-07-04 11:02:02'),
  (8, 2, 'Eau', 250, '2025-07-04 11:02:03');

-- --------------------------------------------------------
--
-- Structure de la table `nutrition_logs`
--
DROP TABLE IF EXISTS `nutrition_logs`;

CREATE TABLE
  IF NOT EXISTS `nutrition_logs` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `meal_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `meal_time` datetime NOT NULL,
    `calories` int DEFAULT NULL,
    `protein_g` decimal(10, 1) DEFAULT NULL,
    `carbs_g` decimal(10, 1) DEFAULT NULL,
    `fat_g` decimal(10, 1) DEFAULT NULL,
    `notes` text COLLATE utf8mb4_unicode_ci,
    `image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `nutrition_logs`
--
INSERT INTO
  `nutrition_logs` (
    `id`,
    `user_id`,
    `meal_type`,
    `name`,
    `meal_time`,
    `calories`,
    `protein_g`,
    `carbs_g`,
    `fat_g`,
    `notes`,
    `image_path`,
    `created_at`
  )
VALUES
  (
    1,
    2,
    'Déjeuner',
    'Riz , pomme de terre , poisson.',
    '2025-06-30 14:13:00',
    400,
    NULL,
    NULL,
    NULL,
    'Riz , pomme de terre , poisson.',
    'uploads/meal_68629ccf51a0d7.84680759.webp',
    '2025-06-30 14:18:55'
  ),
  (
    2,
    2,
    'Déjeuner',
    'Riz , pomme de terre , poisson.',
    '2025-06-30 16:19:00',
    NULL,
    NULL,
    NULL,
    NULL,
    'Riz , pomme de terre , poisson.',
    'uploads/meal_68629d261c9af3.53807273.webp',
    '2025-06-30 14:20:22'
  ),
  (
    3,
    2,
    'Déjeuner',
    'Riz , pomme de terre , poisson.',
    '2025-06-30 14:33:00',
    NULL,
    NULL,
    NULL,
    NULL,
    'Riz , pomme de terre , poisson.',
    'uploads/meal_6862a06034cf21.30704787.webp',
    '2025-06-30 14:34:08'
  );

-- --------------------------------------------------------
--
-- Structure de la table `nutrition_meals`
--
DROP TABLE IF EXISTS `nutrition_meals`;

CREATE TABLE
  IF NOT EXISTS `nutrition_meals` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `meal_type` enum (
      'Petit-déjeuner',
      'Déjeuner',
      'Dîner',
      'Collation'
    ) COLLATE utf8mb4_unicode_ci NOT NULL,
    `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `calories` int DEFAULT NULL,
    `protein_g` int DEFAULT NULL,
    `carbs_g` int DEFAULT NULL,
    `fat_g` int DEFAULT NULL,
    `notes` text COLLATE utf8mb4_unicode_ci,
    `image_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `meal_time` datetime NOT NULL,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `nutrition_meals`
--
INSERT INTO
  `nutrition_meals` (
    `id`,
    `user_id`,
    `meal_type`,
    `name`,
    `calories`,
    `protein_g`,
    `carbs_g`,
    `fat_g`,
    `notes`,
    `image_path`,
    `meal_time`
  )
VALUES
  (
    1,
    2,
    'Déjeuner',
    'Riz aux poulets ',
    NULL,
    NULL,
    NULL,
    NULL,
    '',
    'uploads/meal_68519fe332fbf7.35611115.jpg',
    '2025-06-17 14:10:00'
  );

-- --------------------------------------------------------
--
-- Structure de la table `projets`
--
DROP TABLE IF EXISTS `projets`;

CREATE TABLE
  IF NOT EXISTS `projets` (
    `id_projet` int NOT NULL,
    `nom_projet` varchar(100) DEFAULT NULL,
    `budget` decimal(10, 2) DEFAULT NULL,
    PRIMARY KEY (`id_projet`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `projets`
--
INSERT INTO
  `projets` (`id_projet`, `nom_projet`, `budget`)
VALUES
  (1, 'Migration Système', 15000.00),
  (2, 'Recrutement 2025', 10000.00),
  (3, 'Campagne Pub', 20000.00);

-- --------------------------------------------------------
--
-- Structure de la table `quotes`
--
DROP TABLE IF EXISTS `quotes`;

CREATE TABLE
  IF NOT EXISTS `quotes` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int DEFAULT '2',
    `quote_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
    `author_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `author_profession` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 83 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `quotes`
--
INSERT INTO
  `quotes` (
    `id`,
    `user_id`,
    `quote_text`,
    `author_name`,
    `author_profession`
  )
VALUES
  (
    1,
    2,
    'La chance est là où l\'opportunité rencontre la préparation.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    2,
    2,
    'Dans le mariage, si vous êtes un homme, apprenez deux phrases. L\'un est « oui, ma chérie » et l\'autre est « ma chérie, tu as raison ». Être patient. Soyez d\'abord de bons amis. Et se serrer les coudes.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    3,
    2,
    'Faites attention à ce que vous demandez car lorsque vous priez pour la pluie, vous devez également faire face à la boue.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    4,
    2,
    'La plus grande leçon que j\'ai apprise dans la vie est « Qui sait ce qui est bien ou mal ? » Les choses arrivent que vous voulez vraiment, et elles s\'avèrent être la pire chose au monde.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    5,
    2,
    'Les rêves sans objectifs ne sont que des rêves et ils alimentent finalement la déception.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    6,
    2,
    'Rien dans la vie ne vaut la peine si vous ne prenez pas de risques. Chaque expérience ratée est un pas de plus vers le succès.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    7,
    2,
    'Mettez Dieu en premier dans tout ce que vous faites... Tout ce que j\'ai est par la grâce de Dieu, comprenez cela. C\'est un cadeau... Je ne suis pas toujours resté avec Lui, mais Il est resté avec moi.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    8,
    2,
    'Les Américains adorent parler de la Constitution et de la façon dont elle protège les droits de chaque citoyen et promet la liberté à chaque citoyen, mais c\'est aussi un pays basé sur le racisme et ils n\'en parlent pas.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    9,
    2,
    'Pourquoi fermons-nous les yeux lorsque nous prions, pleurons, embrassons ou rêvons ? Parce que les plus belles choses de la vie ne sont pas vues mais ressenties par le coeur.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    10,
    2,
    'Les objectifs sur la route de la réalisation ne peuvent être atteints sans discipline et cohérence.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    11,
    2,
    'Le secret d\'un mariage heureux ? Faites tout ce que votre femme vous dit. \'Oui ma chérie\' Et respire.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    12,
    2,
    'L\'écriture est une arme et elle est plus puissante qu\'un poing ne pourrait jamais l\'être.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    13,
    2,
    'Tout travail, la comédie incluse, devient ennuyeux à un moment donné et même les meilleurs salaires ne peuvent pallier ça.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    14,
    2,
    'Ma foi m\'aide à comprendre que les circonstances ne dictent pas mon bonheur, ma paix intérieure.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    15,
    2,
    'N\'aspirez pas à gagner votre vie, aspirez à faire la différence.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    16,
    2,
    'Chaque expérience ratée est un pas de plus vers le succès.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    17,
    2,
    'Le talent vient de Dieu. Si on vous en a donné, alors valorisez-le, cultivez-le, travaillez-le et développez-le.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    18,
    2,
    'Si vous n\'échouez pas, c\'est que vous n\'essayez même pas.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    19,
    2,
    'Pour protéger les moutons, tu dois attraper le loup. Et il faut un loup pour attraper un loup, tu comprends ?',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    20,
    2,
    'Je suis très fier d\'être noir, mais noir n\'est pas tout ce que je suis. C\'est mon passé culturel, ma constitution génétique, mais ce n\'est pas tout ce que je suis et ce n\'est pas non plus la base à partir de laquelle je réponds à toutes les questions.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    21,
    2,
    'Succès ? Je ne sais pas ce que signifie ce mot. Je suis heureux. Mais le succès, cela renvoie à ce que signifie le succès aux yeux de quelqu\'un. Pour moi, le succès est la paix intérieure. C\'est une bonne journée pour moi.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    22,
    2,
    'Si vous voulez être un guerrier, vous devez vous entraîner.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    23,
    2,
    'Les chances que vous prenez... les gens que vous rencontrez... les gens que vous aimez... la foi que vous avez - c\'est ce qui va définir votre vie.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    24,
    2,
    'Faites ce que vous avez à faire pour pouvoir faire ce que vous voulez.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    25,
    2,
    'Vous devez être qui vous êtes dans ce monde, quoi qu\'il arrive.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    26,
    2,
    'Je prie pour que vous mettiez tous vos chaussures sous le lit la nuit afin que vous deviez vous mettre à genoux le matin pour les trouver. Et pendant que vous êtes là-bas, remerciez Dieu pour la grâce, la miséricorde et la compréhension.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    27,
    2,
    'Faites ce que vous avez à faire, faites ce que vous voulez faire.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    28,
    2,
    'En fin de compte, il ne s\'agit pas de ce que vous avez ou même de ce que vous avez accompli. Il s\'agit de ce que vous avez fait avec ces réalisations. Il s\'agit de qui vous avez élevé, de qui vous avez amélioré. Il s\'agit de ce que vous avez rendu.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    29,
    2,
    'Il y a un livre intitulé \"Le sociopathe d\'à côté\". Je pensais que la plupart des sociopathes étaient violents. En fait, ils ne le sont pas. Mais presque tous les sociopathes veulent gagner, quoi qu\'il arrive.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    30,
    2,
    'Certains ont dit que l\'Amérique avait fait un pas en avant en élisant un président noir. À la lumière de l\'élargissement inconstitutionnel des pouvoirs, du manque de transparence et d\'alimenter les feux de l\'agitation qui n\'a clairement pas été le cas. Votez sur la base des mérites, pas pour remplir un quota racial.',
    'Denzel Washington',
    'Acteur, Artiste, Cinéaste'
  ),
  (
    31,
    2,
    'Ce n\'est pas votre faute si vous êtes né pauvre. En revanche, si vous mourrez pauvre, c\'est votre erreur.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    32,
    2,
    'La patience est un élément clé de la réussite.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    33,
    2,
    'Je choisis une personne paresseuse pour un travail difficile, car une personne paresseuse va trouver un moyen facile de le faire.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    34,
    2,
    'J\'ai un ami qui a réussi tous ses examens. Moi j\'ai échoué à tous. Lui est ingénieur chez Microsoft. Moi je suis le fondateur.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    35,
    2,
    'Le succès est un mauvais professeur. Il pousse les gens intelligents à croire qu\'ils sont infaillibles.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    36,
    2,
    'Il ne faut jamais se comparer aux autres. Le faire c\'est s\'insulter soi-même.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    37,
    2,
    'Pour gagner gros, il faut parfois prendre de gros risques.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    38,
    2,
    'Les gagnants seront ceux qui restructurent la manière dont l\'information circule dans leur entreprise.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    39,
    2,
    'Si vous croyez que votre professeur est dur avec vous, attendez d\'avoir un patron.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    40,
    2,
    'Un ordinateur en sécurité est un ordinateur éteint. Et encore...',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    41,
    2,
    'Dans le futur, les leaders seront ceux qui savent donner le pouvoir aux autres.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    42,
    2,
    'La concurrence est toujours une chose fantastique, et l\'industrie informatique est extrêmement concurrentielle.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    43,
    2,
    'Célébrer le succès, c\'est bien, mais il est plus important de tirer les leçons de l\'échec.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    44,
    2,
    'Les gens ont toujours peur du changement. Ils avaient même peur de l\'électricité quand elle a été inventée.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    45,
    2,
    'La télévision n\'est pas la vraie vie. Dans la vie réelle les gens en fait doivent quitter le café et aller à l\'emploi.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    46,
    2,
    'Je crois en l\'innovation et que la façon d\'obtenir l\'innovation est de financer la recherche et d\'apprendre les faits de base.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    47,
    2,
    'Au-delà d\'un certain point, l\'argent n\'a pas d\'utilité pour moi.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    48,
    2,
    'Il y a plus de gens qui meurent du paludisme que tout type de cancers.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    49,
    2,
    'Si tu peux bien faire, la moindre des choses c\'est que ça ait l\'air bien !',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    50,
    2,
    'Le succès est un enseignant moche. Il séduit les gens intelligents à croire qu\'ils ne peuvent pas perdre.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    51,
    2,
    'La vie n\'est pas divisée en semestres. L\'été est une saison, pas un trimestre de congé. S\'assumer est une responsabilité individuelle : très peu d\'employeurs sont disposés à le faire pour vous à votre place.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    52,
    2,
    'Vous n\'allez pas faire 60000€ l\'année après votre diplôme. Vous ne serez pas Vice-président en sortant.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    53,
    2,
    'Si vous ne pouvez pas le faire bien, rendez-le beau.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    54,
    2,
    'Soyez gentil avec les geeks. L\'un d\'eux pourrait devenir votre patron.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    55,
    2,
    'Investir pour la pauvreté requiert la participation de toute la communauté.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    56,
    2,
    'Mon ambition a toujours été de rendre les rêves réalisables.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    57,
    2,
    'Si on a qu\'un marteau comme outil, tous les problèmes ne tarderont pas à ressembler à des clous à enfoncer dans le mur.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    58,
    2,
    'J\'ai 100 milliards de dollars... Vous vous rendez compte que je pouvais dépenser 3 millions de dollars par jour, chaque jour, pour les 100 prochaines années? Et c\'est si je ne fais pas un sou...',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    59,
    2,
    'Dans trois ans, tous les produits fabriqués par mon entreprise seront obsolètes. La seule question est de savoir si nous allons les rendre obsolètes ou si quelqu\'un d\'autre le fera.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    60,
    2,
    'Le logiciel est une excellente combinaison entre l\'art et l\'ingénierie.',
    'Bill Gates',
    'Homme d\'affaire, Homme le plus riche, Homme riche, Milliardaire, Recordman'
  ),
  (
    61,
    2,
    'Ne priez pas pour une vie facile, priez pour avoir la force d\'endurer la difficulté.',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    62,
    2,
    'La simplicité est le principe de l\'art.',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    63,
    2,
    'La connaissance donne le pouvoir, mais la force de caractère entraîne le respect.',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    64,
    2,
    'Ne crains pas l\'échec. Ce n\'est pas l\'échec, mais le manque d\'ambition qui est un crime. Avec des objectifs élevés, l\'échec peut être glorieux.',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    65,
    2,
    'Celui qui veut réussir doit apprendre à combattre, persévérer et souffrir.',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    66,
    2,
    'Connaître ne suffit pas. Il faut savoir appliquer. La volonté ne suffit pas. Il faut savoir agir.',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    67,
    2,
    'Il faut vider son esprit, être informe, sans contours - comme de l\'eau.',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    68,
    2,
    'Ne pense pas. Ressens. C\'est comme un doigt qui pointe la Lune. Ne te concentre pas sur le doigt ou tu vas manquer cette beauté céleste.',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    69,
    2,
    'Il n\'y a pas de limites. Il y a des niveaux seulement, et tu ne dois pas en rester là, il faut aller au-delà. Si cela doit te tuer, que cela te tue. Un homme doit toujours dépasser son niveau.',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    70,
    2,
    'Toute forme de connaissance, au bout du compte, est une connaissance de soi-même.',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    71,
    2,
    'Remarquez que l\'arbre le plus robuste cède facilement tandis que le bambou ou le saule survie en pliant sous le vent.',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    72,
    2,
    'J\'ai une maîtrise de philosophie. Je peux donc facilement comprendre pourquoi je ne trouve pas de travail !',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    73,
    2,
    'La vérité n\'a pas de chemin. La vérité est vivante et par conséquent, changeante.',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    74,
    2,
    'Pour se connaître soi-même il faut s\'étudier en action avec une autre personne.',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    75,
    2,
    'Les sceptiques disent: « L\'homme ne peut pas voler », le faiseur dit: « Peut-être, mais nous allons essayer ».',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    76,
    2,
    'Comme le Cobra, votre coup doit être sentit avant d\'être vu.',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    77,
    2,
    'Aimer apprendre, c\'est être près de la connaissance. Pratiquer avec vigueur, c\'est être proche de la magnanimité. Avoir le sentiment de honte, c\'est être près de l\'énergie.',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    78,
    2,
    'Ce que vous pensez habituellement détermine largement ce que vous deviendrez à terme.',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    79,
    2,
    'L\'effet miroir est vécu par la personne qui désire toujours connaître comment il est perçu par les autres. Au lieu de se montrer critique, il émet des critiques, et se sent exposé à la critique comme sur une scène de théâtre.',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    80,
    2,
    'Ne vous préoccupez pas de savoir qui a raison ou qui a tort ou de ce qui est mieux. Ne soyez ni pour ni contre.',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    81,
    2,
    'Je n\'aspire ni à posséder ni à être possédé. Je n\'aspire plus non plus à atteindre le Paradis. Et plus important encore à mes yeux, je ne crains plus l\'Enfer.',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  ),
  (
    82,
    2,
    'Le devenir est une négation de l\'être.',
    'Bruce Lee',
    'Acteur, Artiste, Cinéaste, Pratiquant d\'art martial, Sportif'
  );

-- --------------------------------------------------------
--
-- Structure de la table `tasks`
--
DROP TABLE IF EXISTS `tasks`;

CREATE TABLE
  IF NOT EXISTS `tasks` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `urgency_id` int DEFAULT NULL,
    `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `due_date` date DEFAULT NULL,
    `due_time` time DEFAULT NULL,
    `status` enum ('pending', 'completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `completed_at` datetime DEFAULT NULL,
    `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`),
    KEY `urgency_id` (`urgency_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 28 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tasks`
--
INSERT INTO
  `tasks` (
    `id`,
    `user_id`,
    `urgency_id`,
    `title`,
    `due_date`,
    `due_time`,
    `status`,
    `created_at`,
    `completed_at`,
    `updated_at`
  )
VALUES
  (
    1,
    2,
    1,
    'Refaire le CV de MOM',
    '2025-06-11',
    '18:44:00',
    'completed',
    '2025-06-09 08:46:14',
    '2025-06-15 15:47:08',
    '2025-06-18 10:20:48'
  ),
  (
    2,
    2,
    2,
    'Envoyé le catalogue de maman.',
    '2025-06-08',
    '14:51:00',
    'completed',
    '2025-06-09 08:47:17',
    '2025-06-09 08:47:21',
    '2025-06-18 10:20:48'
  ),
  (
    3,
    2,
    4,
    'Refaire le catalogue de mom adapter au résaux',
    '2025-06-30',
    '15:47:00',
    'pending',
    '2025-06-09 08:48:04',
    NULL,
    '2025-06-18 10:20:48'
  ),
  (
    4,
    2,
    2,
    'Kaki play - Gerre l\'affichages des stats streams Totaux',
    '2025-06-14',
    '18:58:00',
    'completed',
    '2025-06-09 11:59:08',
    '2025-06-12 11:11:42',
    '2025-06-18 10:20:48'
  ),
  (
    5,
    2,
    2,
    'Kaki play - Rajouter le systeme de playlist',
    '2025-06-14',
    '18:59:00',
    'completed',
    '2025-06-09 11:59:52',
    '2025-06-12 11:11:53',
    '2025-06-18 10:20:48'
  ),
  (
    6,
    2,
    2,
    'Kaki play - Afficher la listes complette des albums',
    '2025-06-14',
    '17:00:00',
    'completed',
    '2025-06-09 12:00:36',
    '2025-06-09 13:05:37',
    '2025-06-18 10:20:48'
  ),
  (
    7,
    2,
    2,
    'Kaki play - Pour les Derniers Albums mieux gerer les cliques sur les artistes.',
    '2025-06-14',
    '18:04:00',
    'completed',
    '2025-06-09 12:04:16',
    '2025-06-12 09:27:29',
    '2025-06-18 10:20:48'
  ),
  (
    8,
    2,
    2,
    'Kaki play - Rajouter le meme sytemes de hover des cartes que celui utiliser sur les cartes des Derniers Albums',
    '2025-06-14',
    '17:08:00',
    'completed',
    '2025-06-09 12:08:07',
    '2025-06-09 14:27:42',
    '2025-06-18 10:20:48'
  ),
  (
    9,
    2,
    2,
    'Kaki play - Metre la meme taille des cartes que celles utiliser sur les cartes des Derniers Albums',
    '2025-06-14',
    '18:09:00',
    'completed',
    '2025-06-09 12:09:32',
    '2025-06-09 14:27:55',
    '2025-06-18 10:20:48'
  ),
  (
    10,
    2,
    2,
    'Kaki play -Voir pourquoi les albums et les titres ne sont pas publié sur les iphones',
    '2025-06-13',
    '18:17:00',
    'pending',
    '2025-06-09 12:17:10',
    NULL,
    '2025-06-18 10:20:48'
  ),
  (
    11,
    2,
    2,
    'Kaki play - Rajouter les indicateurs reapeat .',
    '2025-06-14',
    '18:23:00',
    'completed',
    '2025-06-09 12:23:11',
    '2025-06-09 14:28:04',
    '2025-06-18 10:20:48'
  ),
  (
    12,
    2,
    4,
    'Faire la fiche des assurances pour Imane',
    '2025-06-15',
    '20:47:00',
    'completed',
    '2025-06-09 12:47:43',
    '2025-06-16 08:19:39',
    '2025-06-18 10:20:48'
  ),
  (
    13,
    2,
    2,
    'Faire les fiches de soins pour mom',
    '2025-06-15',
    '18:19:00',
    'completed',
    '2025-06-11 13:19:07',
    '2025-06-15 15:47:27',
    '2025-06-18 10:20:48'
  ),
  (
    14,
    2,
    1,
    'Prendre mon tapis souris',
    '2025-06-11',
    '20:55:00',
    'completed',
    '2025-06-11 16:55:48',
    '2025-06-12 05:59:08',
    '2025-06-18 10:20:48'
  ),
  (
    15,
    2,
    1,
    'Léhahiah A - Masqué la promos fête des mères',
    '2025-06-11',
    '18:22:00',
    'completed',
    '2025-06-11 17:22:36',
    '2025-06-11 18:35:16',
    '2025-06-18 10:20:48'
  ),
  (
    16,
    2,
    4,
    'Léhahiah  A - Nétoyage des fichiers unitile.',
    '2025-06-11',
    '23:27:00',
    'completed',
    '2025-06-11 18:27:43',
    '2025-06-16 13:01:48',
    '2025-06-18 10:20:48'
  ),
  (
    17,
    2,
    1,
    'Léhahiah A - Gerre la civilité sur les messages WhatsApp',
    '2025-06-11',
    NULL,
    'completed',
    '2025-06-11 18:39:50',
    '2025-06-11 21:16:06',
    '2025-06-18 10:20:48'
  ),
  (
    18,
    2,
    2,
    'Léhahiah A - Revoire les réservations et les offres',
    '2025-06-12',
    '01:45:00',
    'completed',
    '2025-06-11 21:45:33',
    '2025-06-16 13:01:53',
    '2025-06-18 10:20:48'
  ),
  (
    19,
    2,
    2,
    'Léhahiah A - Mieux gérer l\'affichage du panier de réservation ( respondive )',
    '2025-06-12',
    NULL,
    'completed',
    '2025-06-12 06:05:52',
    '2025-06-16 13:01:51',
    '2025-06-18 10:20:48'
  ),
  (
    20,
    2,
    2,
    'Léhahiah A. - Rajouter le blog.',
    '2025-06-14',
    NULL,
    'pending',
    '2025-06-12 06:08:55',
    NULL,
    '2025-06-18 10:20:48'
  ),
  (
    22,
    2,
    2,
    'Cahiss - Finire la page d\'accueil',
    '2025-06-15',
    '14:30:00',
    'completed',
    '2025-06-12 09:31:00',
    '2025-06-15 15:47:23',
    '2025-06-18 10:20:48'
  ),
  (
    23,
    2,
    2,
    'Kaki play - Nétoyage des fichiers unitile.',
    '2025-06-15',
    '00:02:00',
    'pending',
    '2025-06-12 19:02:48',
    NULL,
    '2025-06-18 10:20:48'
  ),
  (
    24,
    2,
    2,
    'Léhahiah A. - Rajouter les feuilles de soins.',
    '2025-06-17',
    NULL,
    'completed',
    '2025-06-17 12:35:41',
    '2025-06-17 12:35:53',
    '2025-06-18 10:20:48'
  ),
  (
    25,
    2,
    3,
    'Me renseigner pour d\'autre restau lieu insolite au pret d\'imane Zaki et Marie ( parc aquatique )',
    '2025-07-02',
    NULL,
    'completed',
    '2025-06-28 21:48:21',
    '2025-07-02 12:16:17',
    '2025-07-02 12:16:17'
  ),
  (
    26,
    2,
    4,
    'Refaire ma grille tarifaire',
    NULL,
    NULL,
    'pending',
    '2025-06-29 00:01:50',
    NULL,
    '2025-06-29 00:01:50'
  ),
  (
    27,
    2,
    3,
    'Cahiss - Voire les Images lourdes et les messages Testimoniales',
    NULL,
    NULL,
    'completed',
    '2025-07-02 12:16:03',
    '2025-07-04 20:22:08',
    '2025-07-04 20:22:08'
  );

-- --------------------------------------------------------
--
-- Structure de la table `task_urgencies`
--
DROP TABLE IF EXISTS `task_urgencies`;

CREATE TABLE
  IF NOT EXISTS `task_urgencies` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `description` text COLLATE utf8mb4_unicode_ci,
    `color` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#A0AEC0',
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `task_urgencies`
--
INSERT INTO
  `task_urgencies` (`id`, `user_id`, `name`, `description`, `color`)
VALUES
  (
    1,
    2,
    'Important et Urgent',
    'Tâche critique à exécuter immédiatement, a un fort impact si ignorée.',
    '#F94343'
  ),
  (
    2,
    2,
    'Important mais Non Urgent',
    'Important mais NonTâche stratégique, améliore le long terme, pas de pression immédiate. Urgent',
    '#FFF100'
  ),
  (
    3,
    2,
    'Non Important mais Urgent',
    'Souvent imposée par d\'autres, demande réactivité mais peu d’impact durable.',
    '#388EFF'
  ),
  (
    4,
    2,
    'Non Important et Non Urgent',
    'Faible valeur ajoutée, distrayante ou superflue.',
    '#9EFFC3'
  );

-- --------------------------------------------------------
--
-- Structure de la table `training_logs`
--
DROP TABLE IF EXISTS `training_logs`;

CREATE TABLE
  IF NOT EXISTS `training_logs` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `log_date` date NOT NULL,
    `notes` text COLLATE utf8mb4_unicode_ci,
    `feeling` tinyint (1) DEFAULT NULL COMMENT '1=Faible, 2=Fatigué, 3=Normal, 4=En Forme, 5=Excellent',
    `trained_muscle_group_ids` text COLLATE utf8mb4_unicode_ci COMMENT 'Stocke les IDs des groupes musculaires validés, séparés par une virgule',
    `completed_exercise_ids` text COLLATE utf8mb4_unicode_ci COMMENT 'Stores JSON array of completed exercise IDs for this log',
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_log_date_unique` (`user_id`, `log_date`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 52 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `training_logs`
--
INSERT INTO
  `training_logs` (
    `id`,
    `user_id`,
    `log_date`,
    `notes`,
    `feeling`,
    `trained_muscle_group_ids`,
    `completed_exercise_ids`
  )
VALUES
  (1, 2, '2025-06-09', 'Fatigué', 2, NULL, NULL),
  (2, 2, '2025-06-12', '', 5, '5,12,4,9,1', NULL),
  (3, 2, '2025-06-11', '', 2, NULL, NULL),
  (4, 2, '2025-01-01', '', 3, NULL, NULL),
  (5, 2, '2025-01-02', '', 3, NULL, NULL),
  (6, 2, '2025-01-03', '', 3, NULL, NULL),
  (7, 2, '2025-01-04', '', 3, NULL, NULL),
  (8, 2, '2025-01-05', '', 3, NULL, NULL),
  (9, 2, '2025-01-06', '', 4, NULL, NULL),
  (10, 2, '2025-01-07', '', 4, NULL, NULL),
  (11, 2, '2025-01-08', '', 2, NULL, NULL),
  (12, 2, '2025-01-10', '', 2, NULL, NULL),
  (13, 2, '2025-01-09', '', 2, NULL, NULL),
  (14, 2, '2025-01-11', '', 2, NULL, NULL),
  (15, 2, '2025-01-12', '', 2, NULL, NULL),
  (16, 2, '2025-01-13', '', 2, NULL, NULL),
  (17, 2, '2025-01-14', '', 3, NULL, NULL),
  (18, 2, '2025-01-15', '', 3, NULL, NULL),
  (19, 2, '2025-01-16', '', 3, NULL, NULL),
  (20, 2, '2025-01-20', '', 3, NULL, NULL),
  (21, 2, '2025-01-27', '', 3, NULL, NULL),
  (22, 2, '2025-01-28', '', 3, NULL, NULL),
  (23, 2, '2025-01-29', '', 3, NULL, NULL),
  (24, 2, '2025-01-30', '', 3, NULL, NULL),
  (25, 2, '2025-01-23', '', 3, NULL, NULL),
  (26, 2, '2025-01-24', '', 3, NULL, NULL),
  (27, 2, '2025-01-31', '', 3, NULL, NULL),
  (28, 2, '2025-01-25', '', 3, NULL, NULL),
  (
    29,
    2,
    '2025-06-13',
    'Beaucoups d\'énergie même apres la salle.',
    5,
    '6,2,11',
    NULL
  ),
  (30, 2, '2025-06-06', '', 3, '6,2,11', NULL),
  (31, 2, '2025-06-05', '', 3, NULL, NULL),
  (32, 2, '2025-06-04', '', 3, NULL, NULL),
  (33, 2, '2025-06-02', '', 3, NULL, NULL),
  (34, 2, '2026-01-02', '', 3, NULL, NULL),
  (35, 2, '2025-06-14', '', 2, '13,3', NULL),
  (36, 2, '2025-05-30', '', 4, '6,2,11', NULL),
  (37, 2, '2025-05-29', '', 4, '5,12,4,9,1', NULL),
  (38, 2, '2025-05-27', '', 3, NULL, NULL),
  (39, 2, '2025-05-26', '', 3, '5,12,4,9,1', NULL),
  (40, 2, '2025-05-19', '', 4, '5,12,4,9,1', NULL),
  (41, 2, '2025-05-20', '', 3, '6,2,11', NULL),
  (
    42,
    2,
    '2025-06-30',
    'Un peu fatigué au début de la séance mais apres c\'étais okay ',
    3,
    '5,12,4,1',
    NULL
  ),
  (43, 2, '2025-06-26', '', 3, '5,12,4,9,1', NULL),
  (44, 2, '2025-06-25', '', 3, NULL, NULL),
  (45, 2, '2025-06-24', '', 3, NULL, NULL),
  (46, 2, '2025-06-23', '', 3, NULL, NULL),
  (47, 2, '2025-05-05', '', 3, '5,12,4,9,1', NULL),
  (48, 2, '2025-05-01', '', 3, '5,12,4,9,1', NULL),
  (49, 2, '2025-07-01', '', 3, '6,2,11', NULL),
  (50, 2, '2025-07-03', '', 3, '7,5,12,4,9,1', '[]'),
  (51, 2, '2025-07-04', '', 3, '6,2,11', '[]');

-- --------------------------------------------------------
--
-- Structure de la table `training_log_exercises`
--
DROP TABLE IF EXISTS `training_log_exercises`;

CREATE TABLE
  IF NOT EXISTS `training_log_exercises` (
    `id` int NOT NULL AUTO_INCREMENT,
    `training_log_id` int NOT NULL,
    `exercise_id` int NOT NULL,
    PRIMARY KEY (`id`),
    KEY `tle_tl_fk` (`training_log_id`),
    KEY `tle_ex_fk` (`exercise_id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- --------------------------------------------------------
--
-- Structure de la table `users`
--
DROP TABLE IF EXISTS `users`;

CREATE TABLE
  IF NOT EXISTS `users` (
    `id` int NOT NULL AUTO_INCREMENT,
    `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
    `theme_preference` enum ('light', 'dark') COLLATE utf8mb4_unicode_ci DEFAULT 'light',
    `currency_preference` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT 'MAD',
    PRIMARY KEY (`id`),
    UNIQUE KEY `username` (`username`),
    UNIQUE KEY `email` (`email`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--
INSERT INTO
  `users` (
    `id`,
    `username`,
    `password_hash`,
    `email`,
    `created_at`,
    `theme_preference`,
    `currency_preference`
  )
VALUES
  (
    2,
    'King',
    '$2y$10$3cxysVh3SE7SMFSHWn9WGe.EvqudDUJcZ9eIT39G8KB9DIbXO9bHS',
    'arthurakendenguesonnet@gmail.com',
    '2025-06-08 15:42:32',
    'light',
    'XOF'
  );

-- --------------------------------------------------------
--
-- Structure de la table `workout_plans`
--
DROP TABLE IF EXISTS `workout_plans`;

CREATE TABLE
  IF NOT EXISTS `workout_plans` (
    `id` int NOT NULL AUTO_INCREMENT,
    `user_id` int NOT NULL,
    `muscle_group_id` int NOT NULL,
    `training_days` longtext CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_bin,
      PRIMARY KEY (`id`),
      KEY `wp_user_fk` (`user_id`),
      KEY `wp_mg_fk` (`muscle_group_id`)
  );

--
-- Déchargement des données de la table `workout_plans`
--
INSERT INTO
  `workout_plans` (
    `id`,
    `user_id`,
    `muscle_group_id`,
    `training_days`
  )
VALUES
  (1, 2, 1, '[\"1\",\"4\"]'),
  (2, 2, 5, '[\"1\",\"4\"]'),
  (3, 2, 12, '[\"1\",\"4\"]'),
  (4, 2, 6, '[\"2\",\"5\"]'),
  (5, 2, 2, '[\"2\",\"5\"]'),
  (6, 2, 4, '[\"1\",\"4\"]'),
  (7, 2, 3, '[\"2\",\"5\"]'),
  (8, 2, 9, '[\"1\",\"4\"]'),
  (9, 2, 11, '[\"1\",\"4\"]'),
  (10, 2, 13, '[\"6\"]'),
  (11, 2, 7, '[\"1\",\"4\"]'),
  (12, 2, 16, '[\"1\",\"4\"]');

-- --------------------------------------------------------
--
-- Structure de la table `workout_plan_exercises`
--
DROP TABLE IF EXISTS `workout_plan_exercises`;

CREATE TABLE
  IF NOT EXISTS `workout_plan_exercises` (
    `id` int NOT NULL AUTO_INCREMENT,
    `workout_plan_id` int NOT NULL,
    `exercise_id` int NOT NULL,
    `series` int NOT NULL,
    `repetitions` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
    `rest_time_seconds` int DEFAULT NULL,
    `weights_per_set` longtext CHARACTER
    SET
      utf8mb4 COLLATE utf8mb4_bin COMMENT 'Stocke les poids pour chaque série, ex: [80, 85, 90]',
      `display_order` int NOT NULL DEFAULT '0',
      PRIMARY KEY (`id`),
      KEY `wpe_wp_fk` (`workout_plan_id`),
      KEY `wpe_ex_fk` (`exercise_id`)
  );

--
-- Déchargement des données de la table `workout_plan_exercises`
--
INSERT INTO
  `workout_plan_exercises` (
    `id`,
    `workout_plan_id`,
    `exercise_id`,
    `series`,
    `repetitions`,
    `rest_time_seconds`,
    `weights_per_set`,
    `display_order`
  )
VALUES
  (2, 10, 45, 1, '30mn', NULL, '[\"0\"]', 0),
  (3, 10, 43, 1, '10mn', NULL, '[\"0\"]', 0),
  (4, 10, 46, 1, '10mn', NULL, '[\"0\"]', 0),
  (20, 1, 6, 3, '8', 30, '[\"80\",\"80\",\"80\"]', 3),
  (22, 1, 1, 3, '8', 35, '[\"15\",\"15\",\"15\"]', 0),
  (
    25,
    8,
    54,
    3,
    '8',
    40,
    '[\"16\",\"16\",\"16\"]',
    0
  ),
  (38, 5, 19, 3, '8', 40, '[0,0,0]', 0),
  (
    39,
    5,
    23,
    3,
    '8',
    30,
    '[\"40\",\"40\",\"40\"]',
    0
  ),
  (
    40,
    5,
    78,
    3,
    '8',
    40,
    '[\"70\",\"70\",\"70\"]',
    0
  ),
  (
    44,
    1,
    58,
    3,
    '8',
    40,
    '[\"50\",\"60\",\"60\"]',
    1
  ),
  (
    45,
    1,
    3,
    4,
    '8',
    50,
    '[\"26\",\"28\",\"28\",\"28\"]',
    2
  ),
  (
    46,
    2,
    8,
    3,
    '17',
    40,
    '[\"18\",\"18\",\"18\"]',
    0
  ),
  (
    47,
    2,
    53,
    3,
    '17',
    40,
    '[\"12\",\"12\",\"12\"]',
    0
  ),
  (48, 6, 7, 3, '8', 40, '[\"22\",\"22\",\"22\"]', 0),
  (
    53,
    8,
    12,
    6,
    '12',
    40,
    '[\"12\",\"14\",\"12\",\"14\",\"12\",\"14\"]',
    0
  ),
  (
    54,
    5,
    25,
    4,
    '8',
    40,
    '[\"70\",\"75\",\"80\",\"80\"]',
    0
  ),
  (
    55,
    5,
    20,
    4,
    '8',
    40,
    '[\"70\",\"70\",\"75\",\"75\"]',
    0
  ),
  (
    56,
    5,
    78,
    3,
    '8',
    40,
    '[\"90\",\"90\",\"90\"]',
    0
  ),
  (57, 7, 35, 3, '8', 1, '[\"50\",\"50\",\"50\"]', 0),
  (
    58,
    7,
    39,
    3,
    '12',
    45,
    '[\"128\",\"120\",\"120\"]',
    0
  ),
  (
    59,
    7,
    40,
    3,
    '8',
    45,
    '[\"50\",\"50\",\"50\"]',
    0
  ),
  (
    62,
    4,
    77,
    4,
    '9',
    40,
    '[\"40\",\"40\",\"50\",\"50\"]',
    0
  ),
  (
    64,
    4,
    32,
    4,
    '10',
    10,
    '[\"20\",\"18\",\"20\",\"18\"]',
    0
  ),
  (
    65,
    9,
    26,
    4,
    '9',
    40,
    '[\"25\",\"25\",\"25\",\"25\"]',
    0
  ),
  (
    68,
    3,
    11,
    6,
    '10',
    40,
    '[\"16\",\"14\",\"16\",\"14\",\"16\",\"14\"]',
    0
  ),
  (
    69,
    9,
    31,
    3,
    '8',
    40,
    '[\"12\",\"12\",\"12\"]',
    0
  ),
  (
    70,
    11,
    71,
    3,
    '12',
    40,
    '[\"35\",\"35\",\"35\"]',
    0
  );

--
-- Contraintes pour les tables déchargées
--
--
-- Contraintes pour la table `categories`
--
ALTER TABLE `categories` ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `categories_ibfk_2` FOREIGN KEY (`category_type_id`) REFERENCES `category_types` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `category_types`
--
ALTER TABLE `category_types` ADD CONSTRAINT `category_types_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `courses_sheets`
--
ALTER TABLE `courses_sheets` ADD CONSTRAINT `courses_sheets_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `courses_languages` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `employes`
--
ALTER TABLE `employes` ADD CONSTRAINT `employes_ibfk_1` FOREIGN KEY (`id_departement`) REFERENCES `departements` (`id_departement`);

--
-- Contraintes pour la table `employes_projets`
--
ALTER TABLE `employes_projets` ADD CONSTRAINT `employes_projets_ibfk_1` FOREIGN KEY (`id_employe`) REFERENCES `employes` (`id_employe`),
ADD CONSTRAINT `employes_projets_ibfk_2` FOREIGN KEY (`id_projet`) REFERENCES `projets` (`id_projet`);

--
-- Contraintes pour la table `exercises`
--
ALTER TABLE `exercises` ADD CONSTRAINT `ex_mg_fk` FOREIGN KEY (`muscle_group_id`) REFERENCES `muscle_groups` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `ex_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `finances`
--
ALTER TABLE `finances` ADD CONSTRAINT `finances_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
ADD CONSTRAINT `finances_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `goals`
--
ALTER TABLE `goals` ADD CONSTRAINT `goals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `goals_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `goal_categories` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `goal_categories`
--
ALTER TABLE `goal_categories` ADD CONSTRAINT `goal_categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `goal_milestones`
--
ALTER TABLE `goal_milestones` ADD CONSTRAINT `goal_milestones_ibfk_1` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `goal_progress`
--
ALTER TABLE `goal_progress` ADD CONSTRAINT `goal_progress_ibfk_1` FOREIGN KEY (`goal_id`) REFERENCES `goals` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `habits`
--
ALTER TABLE `habits` ADD CONSTRAINT `habits_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `habits_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `habit_categories` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `habit_categories`
--
ALTER TABLE `habit_categories` ADD CONSTRAINT `habit_categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `habit_tracking`
--
ALTER TABLE `habit_tracking` ADD CONSTRAINT `habit_tracking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `habit_tracking_ibfk_2` FOREIGN KEY (`habit_id`) REFERENCES `habits` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `muscle_groups`
--
ALTER TABLE `muscle_groups` ADD CONSTRAINT `mg_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `notes`
--
ALTER TABLE `notes` ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `note_labels` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `note_images`
--
ALTER TABLE `note_images` ADD CONSTRAINT `note_images_ibfk_1` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `note_labels`
--
ALTER TABLE `note_labels` ADD CONSTRAINT `note_labels_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `nutrition_drinks`
--
ALTER TABLE `nutrition_drinks` ADD CONSTRAINT `nd_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `nutrition_logs`
--
ALTER TABLE `nutrition_logs` ADD CONSTRAINT `nutrition_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `nutrition_meals`
--
ALTER TABLE `nutrition_meals` ADD CONSTRAINT `nm_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `quotes`
--
ALTER TABLE `quotes` ADD CONSTRAINT `quotes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `tasks`
--
ALTER TABLE `tasks` ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`urgency_id`) REFERENCES `task_urgencies` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `task_urgencies`
--
ALTER TABLE `task_urgencies` ADD CONSTRAINT `task_urgencies_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `training_logs`
--
ALTER TABLE `training_logs` ADD CONSTRAINT `tl_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `training_log_exercises`
--
ALTER TABLE `training_log_exercises` ADD CONSTRAINT `tle_ex_fk` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `tle_tl_fk` FOREIGN KEY (`training_log_id`) REFERENCES `training_logs` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `workout_plans`
--
ALTER TABLE `workout_plans` ADD CONSTRAINT `wp_mg_fk` FOREIGN KEY (`muscle_group_id`) REFERENCES `muscle_groups` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `wp_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `workout_plan_exercises`
--
ALTER TABLE `workout_plan_exercises` ADD CONSTRAINT `wpe_ex_fk` FOREIGN KEY (`exercise_id`) REFERENCES `exercises` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `wpe_wp_fk` FOREIGN KEY (`workout_plan_id`) REFERENCES `workout_plans` (`id`) ON DELETE CASCADE;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;