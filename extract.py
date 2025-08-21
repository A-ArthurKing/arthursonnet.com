import os

# 📌 1. Configurations
dossier_racine = r"C:\wamp64\www\arthursonnet.com"

fichiers_saas = [
    # =========================
    # 🔧 BACKEND PHP (API)
    # =========================
    "Database.php",
    "login.php",
    "add_note.php",
    "delete_note.php",
    "update_note.php",
    "get_notes.php",
    "read.php",
    "add_label.php",
    "delete_label.php",
    "update_label.php",
    "get_labels.php",
    ".htaccess",
    "arthursonnet.sql",

    # =========================
    # 🎨 FRONTEND REACT
    # =========================
    "index.js",
    "App.js",
    "AuthContext.js",
    "Login.js",
    "Dashboard.js",
    "NotesPage.js",
    "Sidebar.js",
    "ThemeSwitcher.js",
    "index.html",    
    "package.json",  
    "package-lock.json", 

    # =========================
    # 🌍 FICHIERS TRANSVERSAUX
    # =========================
    "mon_logo.png",
    "startProject.txt",
    "charte-graphyque.txt",


    # =========================
    # PAGE COMPONNETS
    # =========================
    "Notification.css",
    "Notification.js",
    
    "Siderbar.css",
    "Sidebar.js",
    
    "themeSwitcher.css",
    "themeSwitcher.js",
    
    
    # =========================
    # PAGE LOGIN
    # =========================
    "Login.js",
    "Login.js",
    
    # =========================
    # PAGE DASHBOARD
    # =========================
    "Dashboard.js",
    "Dashboard.css",
    
    # =========================
    # PAGE PRODUCTIVITE
    # =========================
    # Front
    "NotesPag.css",
    "NotesPage.css",
    "NotesPage.js",
    
    "ProductivitePage.js",
    "ProductivitePage.css",
    
    # Backend (notes)
    "add_label.php",
    "add_note.php",
    "delete_label.php",
    "delete_note.php",
    "get_labels.php",
    "get_notes.php",
    "read.php",
    "update_label.php",
    "update_note.php",
    
    # Backend (taches)
    "get_task.php",
    "add_task.php",
    "update_task.php",
    "get_urgencies.php",

]

fichier_sortie_txt = "fichiers_requis.txt"

# 📌 2. Stockage des résultats
liste_fichiers_trouves = []
liste_fichiers_manquants = []


# 📌 Fonction pour générer l'arborescence comme ton PHP
def display_directory_tree(root_dir, prefix=""):
    lignes = []
    ignore = {".git", ".vscode", "node_modules", "vendor", "__pycache__"}

    try:
        items = sorted([f for f in os.listdir(root_dir) if f not in ignore])
    except PermissionError:
        return [prefix + " [Accès refusé]\n"]

    for i, item in enumerate(items):
        chemin = os.path.join(root_dir, item)
        is_last = (i == len(items) - 1)

        lignes.append(prefix + ("└── " if is_last else "├── ") + item + "\n")

        if os.path.isdir(chemin):
            new_prefix = prefix + ("    " if is_last else "│   ")
            lignes.extend(display_directory_tree(chemin, new_prefix))
    return lignes


# 📌 3. Recherche des fichiers
for nom_fichier in fichiers_saas:
    chemin_trouve = None

    for root, dirs, files in os.walk(dossier_racine):
        if nom_fichier in files:
            chemin_trouve = os.path.join(root, nom_fichier)
            break

    if chemin_trouve:
        liste_fichiers_trouves.append(chemin_trouve)
    else:
        liste_fichiers_manquants.append(nom_fichier)


# 📌 4. Création du fichier texte
with open(fichier_sortie_txt, "w", encoding="utf-8") as sortie:
    # --- Arborescence globale du projet ---
    sortie.write("📂 ARBORESCENCE DU PROJET :\n")
    sortie.write(dossier_racine + "\n\n")
    sortie.writelines(display_directory_tree(dossier_racine))
    sortie.write("\n\n")

    # --- Liste des fichiers trouvés ---
    sortie.write("📂 FICHIERS FOURNIS :\n")
    for chemin in liste_fichiers_trouves:
        sortie.write(f"- {chemin}\n")

    # --- Liste des fichiers manquants ---
    sortie.write("\n❌ FICHIERS MANQUANTS :\n")
    if liste_fichiers_manquants:
        for nom in liste_fichiers_manquants:
            sortie.write(f"- {nom}\n")
    else:
        sortie.write("(Aucun fichier manquant)\n")

    # --- Contenu des fichiers trouvés ---
    sortie.write("\n\n================= CONTENU DES FICHIERS =================\n")
    for chemin in liste_fichiers_trouves:
        sortie.write(f"\n===== {os.path.basename(chemin)} =====\n")
        with open(chemin, "r", encoding="utf-8", errors="replace") as f:
            sortie.write(f.read() + "\n")

print("✅ Extraction terminée !")
print(f"📄 Résultat dans : {os.path.abspath(fichier_sortie_txt)}")
