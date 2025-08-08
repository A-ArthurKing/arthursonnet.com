// --- Imports ---
import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faSun, faMoon } from "@fortawesome/free-solid-svg-icons";
import "./ThemeSwitcher.css";

/**
 * Composant bouton pour basculer entre le thème clair et sombre.
 * @param {object} props
 * @param {string} props.theme - Le thème actuel ('light' or 'dark').
 * @param {function} props.toggleTheme - La fonction pour changer le thème.
 */
const ThemeSwitcher = ({ theme, toggleTheme }) => {
  return (
    <button
      className="theme-switcher"
      onClick={toggleTheme}
      aria-label={`Passer au thème ${theme === "light" ? "sombre" : "clair"}`}
    >
      <FontAwesomeIcon icon={theme === "light" ? faMoon : faSun} />
    </button>
  );
};

export default ThemeSwitcher;
