import React, { useState, useEffect } from "react";
import "./Dashboard.css";

// Le composant n'accepte plus de props pour le thème
const Dashboard = () => {
  const [notes, setNotes] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  // ... le useEffect ne change pas ...
  useEffect(() => {
    fetch("http://localhost/arthursonnet.com/api/v1/notes/read.php")
      .then((response) => {
        if (!response.ok) throw new Error("Erreur de réponse du serveur.");
        return response.json();
      })
      .then((data) => {
        if (data && Array.isArray(data.records)) {
          setNotes(data.records);
        } else {
          console.error("Réponse API non conforme:", data);
          setNotes([]);
        }
      })
      .catch((error) => {
        console.error("Erreur de fetch pour le dashboard:", error);
        setError("Impossible de charger les notes.");
      })
      .finally(() => setIsLoading(false));
  }, []);

  if (isLoading)
    return (
      <main className="main-container">
        <p>Chargement...</p>
      </main>
    );
  if (error)
    return (
      <main className="main-container">
        <p className="error-message">{error}</p>
      </main>
    );

  return (
    <main className="main-container">
      {/* L'en-tête est simplifié, sans le bouton */}
      <header className="main-header">
        <h1>Dashboard</h1>
        <p>Bienvenue sur votre espace personnel.</p>
      </header>
      <div className="content-area">
        {/* ... le reste du code ne change pas ... */}
        <h2>Vos dernières notes</h2>
        <div className="notes-grid">
          {notes.length > 0 ? (
            notes.map((note) => (
              <div key={note.id} className="note-card">
                <h3>{note.title || "Note sans titre"}</h3>
                <p>
                  {note.content ? note.content.substring(0, 100) + "..." : ""}
                </p>
                <small>
                  Créé le: {new Date(note.created_at).toLocaleDateString()}
                </small>
              </div>
            ))
          ) : (
            <p>Aucune note à afficher pour le moment.</p>
          )}
        </div>
      </div>
    </main>
  );
};

export default Dashboard;
