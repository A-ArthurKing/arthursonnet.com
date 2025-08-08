// src/context/AuthContext.js

import React, { createContext, useState, useContext } from "react";

// Création du contexte
const AuthContext = createContext(null);

/**
 * Le "Provider" est un composant qui englobe notre application
 * et met à disposition l'état d'authentification et les fonctions associées.
 */
export const AuthProvider = ({ children }) => {
  // Initialise l'état en vérifiant si une information utilisateur est déjà en session.
  const [user, setUser] = useState(JSON.parse(sessionStorage.getItem("user")));

  // La fonction de connexion
  const login = (userData) => {
    // Stocke les infos de l'utilisateur dans le sessionStorage pour persister après un rechargement.
    sessionStorage.setItem("user", JSON.stringify(userData));
    setUser(userData);
  };

  // La fonction de déconnexion
  const logout = () => {
    sessionStorage.removeItem("user");
    setUser(null);
  };

  // Met à disposition 'user', 'login', et 'logout' à tous les composants enfants.
  const value = { user, login, logout };

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
};

/**
 * Hook personnalisé pour utiliser facilement le contexte d'authentification
 * dans n'importe quel composant.
 */
export const useAuth = () => {
  return useContext(AuthContext);
};
