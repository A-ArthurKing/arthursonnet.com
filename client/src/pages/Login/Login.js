// src/pages/Login/Login.js

import React, { useState } from "react";
import { useAuth } from "../../context/AuthContext";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faUser, faLock } from "@fortawesome/free-solid-svg-icons";
import "./Login.css";

/**
 * Page de connexion de l'application.
 */
const Login = () => {
  const { login } = useAuth();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState("");
  const [isLoading, setIsLoading] = useState(false);

  // Gestion de la soumission du formulaire
  const handleSubmit = async (event) => {
    event.preventDefault();
    setIsLoading(true);
    setError("");

    try {
      // Rétablissement de l'URL de l'API d'authentification.
      const response = await fetch(
        "http://localhost/arthursonnet.com/api/v1/auth/login.php",
        {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ username, password }),
        }
      );

      const result = await response.json();

      if (response.ok && result.status === "success") {
        login(result.user);
      } else {
        setError(result.message || "Une erreur est survenue.");
      }
    } catch (err) {
      setError("Impossible de se connecter au serveur.");
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="login-page">
      <div className="login-promo-panel">
        <div className="promo-content">
          <h2>Conçu pour la performance</h2>
          <p>Votre tableau de bord personnel pour une vie optimisée.</p>
        </div>
      </div>

      <div className="login-form-panel">
        <form
          className="login-form-container"
          onSubmit={handleSubmit}
          noValidate
        >
          <h1>Se Connecter</h1>
          <div className="login-card">
            <div className="input-group">
              <label htmlFor="username">Nom d'utilisateur</label>
              <div className="input-with-icon">
                <FontAwesomeIcon icon={faUser} />
                <input
                  type="text"
                  id="username"
                  placeholder="Votre nom d'utilisateur"
                  value={username}
                  onChange={(e) => setUsername(e.target.value)}
                  required
                />
              </div>
            </div>
            <div className="input-group">
              <label htmlFor="password">Mot de passe</label>
              <div className="input-with-icon">
                <FontAwesomeIcon icon={faLock} />
                <input
                  type="password"
                  id="password"
                  placeholder="············"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  required
                />
              </div>
            </div>
            {error && <p className="error-message">{error}</p>}

            <button type="submit" className="login-button" disabled={isLoading}>
              {isLoading ? "Connexion..." : "Entrer"}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default Login;
