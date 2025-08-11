// ProductivitePage.js

import React from "react";
import { Link } from "react-router-dom";
import "./ProductivitePage.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faBullseye,
  faListCheck,
  faStickyNote,
} from "@fortawesome/free-solid-svg-icons";

const ProductivitePage = () => {
  return (
    <main className="productivity-page">
      <header className="page-header">
        <h1>Espace Productivité</h1>
        <p>Gérez vos objectifs, vos tâches et vos notes en un seul endroit.</p>
      </header>

      <div className="card-container">
        {/* Carte pour les Objectifs */}
        <div className="card">
          <div className="card-header">
            <div
              className="icon-wrapper"
              style={{
                backgroundColor: "rgba(255, 99, 132, 0.2)",
                color: "rgb(255, 99, 132)",
              }}
            >
              <FontAwesomeIcon icon={faBullseye} />
            </div>
            <h2>Objectifs</h2>
          </div>
          <p className="card-content">
            Définissez et suivez vos objectifs à long terme pour atteindre vos
            ambitions.
          </p>
        </div>

        {/* Carte pour les Tâches */}
        <div className="card">
          <div className="card-header">
            <div
              className="icon-wrapper"
              style={{
                backgroundColor: "rgba(54, 162, 235, 0.2)",
                color: "rgb(54, 162, 235)",
              }}
            >
              <FontAwesomeIcon icon={faListCheck} />
            </div>
            <h2>Tâches</h2>
          </div>
          <p className="card-content">
            Organisez votre quotidien avec une liste de tâches claire et
            hiérarchisée.
          </p>
        </div>

        {/* Carte pour les Notes (rendue cliquable) */}
        <Link to="/productivite/notes" className="card">
          <div className="card-header">
            <div
              className="icon-wrapper"
              style={{
                backgroundColor: "rgba(255, 206, 86, 0.2)",
                color: "rgb(255, 206, 86)",
              }}
            >
              <FontAwesomeIcon icon={faStickyNote} />
            </div>
            <h2>Notes</h2>
          </div>
          <p className="card-content">
            Capturez rapidement vos idées, mémos et inspirations du moment.
          </p>
        </Link>
      </div>
    </main>
  );
};

export default ProductivitePage;
