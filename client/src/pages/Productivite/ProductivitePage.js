import React from "react";
import { useNavigate } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faTasks,
  faStickyNote,
  faBullseye,
} from "@fortawesome/free-solid-svg-icons";
import "./ProductivitePage.css";

const ProductivitePage = () => {
  const navigate = useNavigate();

  const cards = [
    {
      title: "Notes",
      description: "Gérez vos notes et archives personnelles.",
      icon: faStickyNote,
      path: "/productivite/notes",
    },
    {
      title: "Tâches",
      description: "Organisez vos tâches avec des niveaux d’urgence.",
      icon: faTasks,
      path: "/productivite/tasks",
    },
    {
      title: "Objectifs",
      description:
        "Suivez la progression de vos objectifs financiers et de vie.",
      icon: faBullseye,
      path: "/productivite/goals",
    },
  ];

  return (
    <main className="productivite-page-container">
      <header className="productivite-header">
        <h1>Productivité</h1>
        <p>
          Gérez vos différents aspects de productivité depuis un seul endroit.
        </p>
      </header>
      <section className="productivite-cards-grid">
        {cards.map((card) => (
          <div
            key={card.title}
            className="productivite-card"
            onClick={() => navigate(card.path)}
          >
            <div className="card-icon-container">
              <FontAwesomeIcon icon={card.icon} />
            </div>
            <h2 className="card-title">{card.title}</h2>
            <p className="card-description">{card.description}</p>
          </div>
        ))}
      </section>
    </main>
  );
};

export default ProductivitePage;
