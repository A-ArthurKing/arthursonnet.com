// src/App.js

import React, { useState, useEffect } from "react";
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Navigate,
} from "react-router-dom";
import { useAuth } from "./context/AuthContext";

// Component Imports
import Sidebar from "./components/Sidebar/Sidebar";
import Dashboard from "./pages/Dashboard/Dashboard";
import Login from "./pages/Login/Login";
import ProductivitePage from "./pages/Productivite/ProductivitePage";
import NotesPage from "./pages/Productivite/NotesPage";

// CSS Imports
import "./App.css";

function App() {
  const { user } = useAuth();
  const [theme, setTheme] = useState(localStorage.getItem("theme") || "light");
  const [isSidebarCollapsed, setIsSidebarCollapsed] = useState(true);
  const [isMobileNavOpen, setIsMobileNavOpen] = useState(false);

  const toggleTheme = () => {
    setTheme((currentTheme) => (currentTheme === "light" ? "dark" : "light"));
  };

  const toggleSidebar = () => {
    setIsSidebarCollapsed(!isSidebarCollapsed);
  };

  const toggleMobileNav = () => {
    setIsMobileNavOpen(!isMobileNavOpen);
  };

  useEffect(() => {
    document.body.className = "";
    document.body.classList.add(`${theme}-theme`);
    localStorage.setItem("theme", theme);
  }, [theme]);

  const MainLayout = ({ children }) => (
    <div
      className={`
        app-layout 
        ${isSidebarCollapsed ? "sidebar-collapsed" : ""}
        ${isMobileNavOpen ? "mobile-nav-open" : ""}
      `}
    >
      {isMobileNavOpen && (
        <div className="mobile-overlay" onClick={toggleMobileNav}></div>
      )}
      <Sidebar
        theme={theme}
        toggleTheme={toggleTheme}
        isCollapsed={isSidebarCollapsed}
        toggleSidebar={toggleSidebar}
        closeMobileNav={() => setIsMobileNavOpen(false)}
        isMobileNavOpen={isMobileNavOpen}
        openMobileNav={toggleMobileNav}
      />
      <div className="main-content">{children}</div>
    </div>
  );

  return (
    <Router>
      <Routes>
        <Route path="/login" element={user ? <Navigate to="/" /> : <Login />} />
        <Route
          path="/*"
          element={
            user ? (
              <MainLayout>
                <Routes>
                  <Route path="/" element={<Dashboard />} />
                  <Route path="/productivite" element={<ProductivitePage />} />
                  <Route path="/productivite/notes" element={<NotesPage />} />
                  {/* AJOUT DE LA NOUVELLE ROUTE POUR LES NOTES ARCHIVÉES */}
                  <Route
                    path="/productivite/notes/archives"
                    element={<NotesPage />}
                  />
                  <Route path="*" element={<Navigate to="/" />} />
                </Routes>
              </MainLayout>
            ) : (
              <Navigate to="/login" />
            )
          }
        />
      </Routes>
    </Router>
  );
}

export default App;
