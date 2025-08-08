import React, { useState, useEffect } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faTachometerAlt,
  faStickyNote,
  faBookOpen,
} from "@fortawesome/free-solid-svg-icons";
import ThemeSwitcher from "../ThemeSwitcher/ThemeSwitcher"; // 1. Import du ThemeSwitcher
import "./Sidebar.css";

// 2. Accepte 'theme' et 'toggleTheme' en props
const Sidebar = ({ theme, toggleTheme }) => {
  const [links, setLinks] = useState([]);
  const [error, setError] = useState(null);

  // ... le useEffect pour fetch les liens ne change pas ...
  useEffect(() => {
    fetch("http://localhost/arthursonnet.com/api/v1/categories/read.php")
      .then((response) => {
        if (!response.ok)
          throw new Error("La réponse du réseau n'était pas ok");
        return response.json();
      })
      .then((data) => {
        if (data.records) setLinks(data.records);
        else setLinks([]);
      })
      .catch((error) => {
        console.error(
          "Erreur lors de la récupération des liens de la sidebar:",
          error
        );
        setError("Impossible de charger les catégories.");
      });
  }, []);

  return (
    <div className="sidebar">
      <div>
        {" "}
        {/* Div pour regrouper le contenu principal */}
        <div className="sidebar-header">
          <h2>Mon SaaS</h2>
        </div>
        <nav className="sidebar-nav">
          <ul>
            {/* ... les li ne changent pas ... */}
            <li>
              <a href="#dashboard" className="active">
                <FontAwesomeIcon
                  icon={faTachometerAlt}
                  className="sidebar-icon"
                />
                Dashboard
              </a>
            </li>
            <li>
              <a href="#notes">
                <FontAwesomeIcon icon={faStickyNote} className="sidebar-icon" />
                Notes
              </a>
            </li>
            {error && <li className="error-message">{error}</li>}
            {links.map((link) => (
              <li key={link.id}>
                <a href={`#category-${link.id}`}>
                  <FontAwesomeIcon
                    icon={faBookOpen}
                    className="sidebar-icon"
                    style={{ color: link.color }}
                  />
                  {link.name}
                </a>
              </li>
            ))}
          </ul>
        </nav>
      </div>

      {/* 3. Placement du bouton en bas de la sidebar */}
      <div className="sidebar-footer">
        <ThemeSwitcher theme={theme} toggleTheme={toggleTheme} />
      </div>
    </div>
  );
};

export default Sidebar;
