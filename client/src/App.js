import React, { useState, useEffect, createContext, useContext } from "react";
import {
  BrowserRouter as Router,
  Routes,
  Route,
  Navigate,
} from "react-router-dom";
import { useAuth } from "./context/AuthContext";
import Sidebar from "./components/Sidebar/Sidebar";
import Dashboard from "./pages/Dashboard/Dashboard";
import Login from "./pages/Login/Login";
import ProductivitePage from "./pages/Productivite/ProductivitePage";
import NotesPage from "./pages/Productivite/NotesPage";
import TasksPage from "./pages/Productivite/TasksPage";
import Notification from "./components/Notification/Notification";

// #region Contexte de notifications
const NotificationContext = createContext();

export const useNotification = () => {
  return useContext(NotificationContext);
};

export const NotificationProvider = ({ children }) => {
  const [notification, setNotification] = useState(null);

  const showNotification = (message, type = "success") => {
    setNotification({ message, type });
  };

  const value = { showNotification };

  return (
    <NotificationContext.Provider value={value}>
      {children}
      {notification && (
        <Notification
          message={notification.message}
          type={notification.type}
          onClose={() => setNotification(null)}
        />
      )}
    </NotificationContext.Provider>
  );
};
// #endregion

// #region Composant principal App
function App() {
  const { user } = useAuth();
  const [theme, setTheme] = useState(localStorage.getItem("theme") || "light");
  const [isSidebarCollapsed, setIsSidebarCollapsed] = useState(false); // Changé à false pour un état par défaut non masqué
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
      <Sidebar
        theme={theme}
        toggleTheme={toggleTheme}
        isCollapsed={isSidebarCollapsed}
        toggleSidebar={toggleSidebar}
        closeMobileNav={() => setIsMobileNavOpen(false)}
        isMobileNavOpen={isMobileNavOpen}
        openMobileNav={toggleMobileNav}
      />
      <div className="main-content-wrapper">
        <div className="main-content">{children}</div>
      </div>
      {isMobileNavOpen && (
        <div className="mobile-overlay" onClick={toggleMobileNav}></div>
      )}
    </div>
  );

  return (
    <NotificationProvider>
      <Router>
        <Routes>
          <Route
            path="/login"
            element={user ? <Navigate to="/" /> : <Login />}
          />
          <Route
            path="/*"
            element={
              user ? (
                <MainLayout>
                  <Routes>
                    <Route path="/" element={<Dashboard />} />
                    <Route
                      path="/productivite"
                      element={<ProductivitePage />}
                    />
                    <Route path="/productivite/notes" element={<NotesPage />} />
                    <Route
                      path="/productivite/notes/archives"
                      element={<NotesPage />}
                    />
                    <Route path="/productivite/tasks" element={<TasksPage />} />
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
    </NotificationProvider>
  );
}

export default App;
