import React, { useState, useEffect, useMemo } from "react";
import { useNavigate, Link } from "react-router-dom";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faPlus,
  faCheckCircle,
  faSpinner,
  faArrowLeft,
  faTasks,
  faCaretDown,
  faTimes,
} from "@fortawesome/free-solid-svg-icons";
import { useNotification } from "../../App";
import "./TasksPage.css";

const TasksPage = () => {
  // #region État et Hooks
  const [tasks, setTasks] = useState([]);
  const [urgencies, setUrgencies] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);
  const [showAddTaskForm, setShowAddTaskForm] = useState(false);
  const [newTaskTitle, setNewTaskTitle] = useState("");
  const [newTaskUrgency, setNewTaskUrgency] = useState(null);
  const [newTaskDueDate, setNewTaskDueDate] = useState("");
  const [newTaskDueTime, setNewTaskDueTime] = useState("");
  const [showUrgencyDropdown, setShowUrgencyDropdown] = useState(false);
  const navigate = useNavigate();
  const { showNotification } = useNotification();
  const isCompletedPage = window.location.pathname.includes("/completed");
  // #endregion

  // #region Récupération des données
  const fetchTasks = async () => {
    setIsLoading(true);
    setError(null);
    const status = isCompletedPage ? "completed" : "pending";

    try {
      const response = await fetch(
        `http://localhost/arthursonnet.com/api/v1/taches/get_tasks.php?status=${status}`
      );

      if (!response.ok) {
        throw new Error("Erreur de réponse du serveur.");
      }
      const data = await response.json();

      if (data.status === "success") {
        setTasks(data.records);
      } else {
        setTasks([]);
        setError(data.message);
      }
    } catch (err) {
      console.error("Erreur de fetch pour les tâches:", err);
      setError(
        "Impossible de charger les tâches. Veuillez vérifier votre connexion au serveur."
      );
      showNotification("Erreur de chargement des tâches.", "error");
    } finally {
      setIsLoading(false);
    }
  };

  const fetchUrgencies = async () => {
    try {
      const response = await fetch(
        `http://localhost/arthursonnet.com/api/v1/taches/get_urgencies.php`
      );
      const data = await response.json();
      if (data.status === "success") {
        setUrgencies(data.records);
      }
    } catch (err) {
      console.error("Erreur lors de la récupération des urgences:", err);
    }
  };

  useEffect(() => {
    fetchTasks();
    fetchUrgencies();
  }, [isCompletedPage]);
  // #endregion

  // #region Logique de mise à jour et de formatage
  const handleTaskCompletion = async (taskId, isChecked) => {
    try {
      const response = await fetch(
        `http://localhost/arthursonnet.com/api/v1/taches/update_task.php`,
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            id: taskId,
            status: isChecked ? "completed" : "pending",
          }),
        }
      );

      if (!response.ok) {
        throw new Error("Échec de la mise à jour de la tâche.");
      }

      const result = await response.json();
      if (result.status === "success") {
        const message = isChecked
          ? "Tâche finalisée avec succès !"
          : "Tâche réactivée avec succès !";
        showNotification(message, "success");
        fetchTasks();
      } else {
        throw new Error(result.message);
      }
    } catch (err) {
      console.error("Erreur lors de la mise à jour de la tâche:", err);
      showNotification("Erreur lors de la mise à jour de la tâche.", "error");
    }
  };

  const handleAddTask = async (e) => {
    e.preventDefault();
    if (!newTaskTitle.trim()) {
      showNotification("Le titre de la tâche ne peut pas être vide.", "error");
      return;
    }

    try {
      const response = await fetch(
        `http://localhost/arthursonnet.com/api/v1/taches/add_task.php`,
        {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            userId: 2,
            title: newTaskTitle,
            urgency_id: newTaskUrgency?.id,
            due_date: newTaskDueDate,
            due_time: newTaskDueTime,
          }),
        }
      );

      const result = await response.json();
      if (response.ok && result.status === "success") {
        showNotification("Tâche ajoutée avec succès !", "success");
        setNewTaskTitle("");
        setNewTaskUrgency(null);
        setNewTaskDueDate("");
        setNewTaskDueTime("");
        setShowAddTaskForm(false);
        fetchTasks();
      } else {
        throw new Error(result.message || "Échec de l'ajout de la tâche.");
      }
    } catch (err) {
      console.error("Erreur lors de l'ajout de la tâche:", err);
      showNotification("Erreur lors de l'ajout de la tâche.", "error");
    }
  };

  const formatDate = (date, time) => {
    if (!date) return null;

    const timePart = time ? ` à ${time.substring(0, 5)}` : "";
    const [year, month, day] = date.split("-");
    const formattedDate = `${day} ${new Date(date).toLocaleString("fr-FR", {
      month: "long",
    })} ${year}`;

    return `${formattedDate}${timePart}`;
  };

  const groupedTasks = useMemo(() => {
    return tasks.reduce((groups, task) => {
      const groupName = task.type || "Sans catégorie";
      if (!groups[groupName]) {
        groups[groupName] = [];
      }
      groups[groupName].push(task);
      return groups;
    }, {});
  }, [tasks]);
  // #endregion

  // #region Rendu
  if (isLoading) {
    return (
      <main className="tasks-page-container loading-state">
        <FontAwesomeIcon icon={faSpinner} spin className="loading-spinner" />
        <p>Chargement des tâches...</p>
      </main>
    );
  }

  return (
    <main className="tasks-page-container">
      <header className="tasks-header">
        <button onClick={() => navigate(-1)} className="btn-back">
          <FontAwesomeIcon icon={faArrowLeft} />
        </button>
        <h1>{isCompletedPage ? "Tâches Complétées" : "Tâches en Cours"}</h1>
        <div className="tasks-actions">
          {isCompletedPage ? (
            <Link to="/productivite/tasks" className="btn-action btn-pending">
              <FontAwesomeIcon icon={faTasks} /> Tâches en cours
            </Link>
          ) : (
            <Link
              to="/productivite/tasks/completed"
              className="btn-action btn-completed"
            >
              <FontAwesomeIcon icon={faCheckCircle} /> Tâches complétées
            </Link>
          )}
          <button
            className="btn-add-task"
            onClick={() => setShowAddTaskForm(!showAddTaskForm)}
          >
            <FontAwesomeIcon icon={faPlus} /> Nouvelle tâche
          </button>
        </div>
      </header>

      {showAddTaskForm && (
        <div className="add-task-form">
          <form onSubmit={handleAddTask}>
            <div className="form-row">
              <input
                type="text"
                placeholder="Titre de la nouvelle tâche"
                value={newTaskTitle}
                onChange={(e) => setNewTaskTitle(e.target.value)}
              />
              <div className="urgency-dropdown-wrapper">
                <button
                  type="button"
                  className="urgency-dropdown-btn"
                  onClick={() => setShowUrgencyDropdown(!showUrgencyDropdown)}
                >
                  {newTaskUrgency ? (
                    <>
                      <span
                        className="urgency-color-dot"
                        style={{ backgroundColor: newTaskUrgency.color }}
                      ></span>
                      {newTaskUrgency.name}
                    </>
                  ) : (
                    <span>Sélectionner une urgence</span>
                  )}
                  <FontAwesomeIcon icon={faCaretDown} />
                </button>
                {showUrgencyDropdown && (
                  <ul className="urgency-dropdown">
                    {urgencies.map((urgency) => (
                      <li
                        key={urgency.id}
                        className="urgency-dropdown-item"
                        onClick={() => {
                          setNewTaskUrgency(urgency);
                          setShowUrgencyDropdown(false);
                        }}
                      >
                        <span
                          className="urgency-color-dot"
                          style={{ backgroundColor: urgency.color }}
                        ></span>
                        {urgency.name}
                      </li>
                    ))}
                  </ul>
                )}
              </div>
            </div>
            <div className="form-row">
              <input
                type="date"
                value={newTaskDueDate}
                onChange={(e) => setNewTaskDueDate(e.target.value)}
              />
              <input
                type="time"
                value={newTaskDueTime}
                onChange={(e) => setNewTaskDueTime(e.target.value)}
              />
              <button type="submit">Ajouter</button>
            </div>
          </form>
        </div>
      )}

      <section className="tasks-list-container">
        {Object.keys(groupedTasks).length > 0 ? (
          Object.keys(groupedTasks).map((groupName) => (
            <div key={groupName} className="task-group">
              <h2 className="task-group-title">{groupName}</h2>
              <div className="tasks-list">
                {groupedTasks[groupName].map((task) => (
                  <div
                    key={task.id}
                    className={`task-item ${
                      task.status === "completed" ? "completed" : ""
                    }`}
                    style={{
                      "--urgency-color":
                        task.urgency_color || "var(--color-border)",
                    }}
                  >
                    <div className="task-checkbox-container">
                      <input
                        type="checkbox"
                        className="task-checkbox"
                        checked={task.status === "completed"}
                        onChange={(e) =>
                          handleTaskCompletion(task.id, e.target.checked)
                        }
                      />
                    </div>
                    <div className="task-content">
                      <div className="task-header">
                        <h3 className="task-title">{task.title}</h3>
                      </div>
                      <div className="task-details">
                        {task.urgency_name && (
                          <span
                            className="task-urgency-name"
                            style={{ "--urgency-color": task.urgency_color }}
                          >
                            {task.urgency_name}
                          </span>
                        )}
                        {task.due_date && (
                          <span className="task-due-date">
                            Échéance :{" "}
                            {formatDate(task.due_date, task.due_time)}
                          </span>
                        )}
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          ))
        ) : (
          <p className="no-tasks-message">
            {isCompletedPage
              ? "Aucune tâche complétée."
              : "Aucune tâche en cours."}
          </p>
        )}
      </section>
    </main>
  );
  // #endregion
};

export default TasksPage;
