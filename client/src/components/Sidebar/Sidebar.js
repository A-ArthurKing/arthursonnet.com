// src/components/Sidebar/Sidebar.js

import React from "react";
import { NavLink } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faTachometerAlt,
  faTasks,
  faBookOpen,
  faChevronLeft,
  faBars,
  faTimes,
} from "@fortawesome/free-solid-svg-icons";
import ThemeSwitcher from "../ThemeSwitcher/ThemeSwitcher";
import "./Sidebar.css";

// Définition statique des liens de navigation, remplaçant l'appel à l'API.
const staticLinks = [
  { id: 1, name: "Catégorie 1", color: "#6A5ACD" },
  { id: 2, name: "Catégorie 2", color: "#00CED1" },
  { id: 3, name: "Catégorie 3", color: "#FF8C00" },
];

const Sidebar = ({
  theme,
  toggleTheme,
  isCollapsed,
  toggleSidebar,
  closeMobileNav,
  isMobileNavOpen,
  openMobileNav,
}) => {
  /**
   * Ferme le menu mobile après un clic sur un lien.
   * Cette fonction assure une meilleure expérience utilisateur.
   */
  const handleNavLinkClick = () => {
    closeMobileNav();
  };

  /**
   * Construit les classes CSS de la sidebar en fonction de l'état
   * replié ou ouvert (mobile).
   */
  const sidebarClassName = `sidebar ${isCollapsed ? "collapsed" : ""} ${
    isMobileNavOpen ? "mobile-open" : ""
  }`;

  return (
    <>
      <div className={sidebarClassName}>
        <div>
          {/* #region En-tête */}
          <div className="sidebar-header">
            <span className="sidebar-title">Mon SaaS</span>
            <button onClick={toggleSidebar} className="sidebar-toggle">
              <FontAwesomeIcon icon={faChevronLeft} />
            </button>
          </div>
          {/* #endregion */}

          {/* #region Navigation */}
          <nav className="sidebar-nav">
            <ul>
              <li>
                <NavLink to="/" end onClick={handleNavLinkClick}>
                  <FontAwesomeIcon
                    icon={faTachometerAlt}
                    className="sidebar-icon"
                  />
                  <span className="nav-text">Dashboard</span>
                </NavLink>
              </li>
              <li>
                <NavLink to="/productivite" onClick={handleNavLinkClick}>
                  <FontAwesomeIcon icon={faTasks} className="sidebar-icon" />
                  <span className="nav-text">Productivité</span>
                </NavLink>
              </li>
              {staticLinks.map((link) => (
                <li key={link.id}>
                  {/* Utilisation de l'icône faBookOpen pour les liens statiques */}
                  <a href={`#category-${link.id}`} onClick={handleNavLinkClick}>
                    <FontAwesomeIcon
                      icon={faBookOpen}
                      className="sidebar-icon"
                      style={{ color: link.color }}
                    />
                    <span className="nav-text">{link.name}</span>
                  </a>
                </li>
              ))}
            </ul>
          </nav>
          {/* #endregion */}
        </div>

        {/* #region Pied de page */}
        <div className="sidebar-footer">
          <ThemeSwitcher theme={theme} toggleTheme={toggleTheme} />
        </div>
        {/* #endregion */}
      </div>
      {/* #region Bouton de menu mobile */}
      <button
        onClick={isMobileNavOpen ? closeMobileNav : openMobileNav}
        className={`mobile-toggle-button ${isMobileNavOpen ? "open" : ""}`}
      >
        <FontAwesomeIcon icon={isMobileNavOpen ? faTimes : faBars} />
      </button>
      {/* #endregion */}
    </>
  );
};

export default Sidebar;
