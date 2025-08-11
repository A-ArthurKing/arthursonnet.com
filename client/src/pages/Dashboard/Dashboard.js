import React, { useState, useEffect } from "react";
import "./Dashboard.css";
// On retire l'import de react-icons ici

const Dashboard = () => {
  const [dashboardData, setDashboardData] = useState({
    totalNotes: 0,
    latestNote: null,
  });
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch("http://localhost/arthursonnet.com/api/v1/notes/get_notes.php")
      .then((response) => {
        if (!response.ok) throw new Error("Erreur de réponse du serveur.");
        return response.json();
      })
      .then((data) => {
        if (data && Array.isArray(data.records)) {
          setDashboardData({
            totalNotes: data.records.length,
            latestNote: data.records.length > 0 ? data.records[0] : null,
          });
        } else {
          console.error("Réponse API non conforme ou vide:", data);
          setDashboardData({ totalNotes: 0, latestNote: null });
        }
      })
      .catch((error) => {
        console.error("Erreur de fetch pour le dashboard:", error);
        setError("Impossible de charger les données du tableau de bord.");
      })
      .finally(() => setIsLoading(false));
  }, []);

  if (isLoading)
    return (
      <main className="dashboard-page">
        <div className="loading-spinner"></div>
        <p>Chargement en cours...</p>
      </main>
    );

  if (error)
    return (
      <main className="dashboard-page">
        <div className="error-card">
          <i className="fas fa-times-circle error-icon"></i>
          <p className="error-message">{error}</p>
        </div>
      </main>
    );

  const { totalNotes, latestNote } = dashboardData;

  return (
    <main className="dashboard-page">
      <header className="dashboard-header">
        <h1>Dashboard</h1>
        <p>Bienvenue sur votre espace de gestion des notes.</p>
      </header>

      <section className="dashboard-grid">
        {/* Carte 1: Nombre total de notes */}
        <div className="dashboard-card stat-card">
          <div className="card-header">
            <i className="fas fa-sticky-note card-icon"></i>
            <span className="card-title">Notes totales</span>
          </div>
          <p className="card-value">{totalNotes}</p>
        </div>

        {/* Carte 2: Ajouter une note */}
        <div className="dashboard-card add-card">
          <div className="card-header">
            <i className="fas fa-plus card-icon"></i>
            <span className="card-title">Créer une note</span>
          </div>
          <p className="card-value">
            <a href="/create-note" className="add-link">
              Cliquez pour commencer
            </a>
          </p>
        </div>

        {/* Carte 3: Dernière note */}
        {latestNote && (
          <div className="dashboard-card note-card">
            <div className="card-header">
              <i className="fas fa-check-circle card-icon"></i>
              <span className="card-title">Dernière note</span>
            </div>
            <div className="note-content">
              <h3>{latestNote.title || "Note sans titre"}</h3>
              <p>
                {latestNote.content
                  ? `${latestNote.content.substring(0, 100)}...`
                  : "Pas de contenu."}
              </p>
              <small>
                Créée le: {new Date(latestNote.created_at).toLocaleDateString()}
              </small>
            </div>
          </div>
        )}
      </section>
    </main>
  );
};

export default Dashboard;
