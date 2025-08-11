import React, { useState, useEffect, useRef } from "react";
import { Link, useNavigate } from "react-router-dom";
import { Editor } from "@tinymce/tinymce-react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faPlus,
  faArchive,
  faTag,
  faArrowLeft,
  faFilter,
  faTimes,
  faSearch,
  faCaretDown,
  faTrashAlt,
  faBoxOpen,
  faArchive as faArchiveSolid,
  faEdit,
} from "@fortawesome/free-solid-svg-icons";
import Confirmation from "../../Confirmation";
import "./NotesPage.css";

const NotesPage = () => {
  const [notes, setNotes] = useState([]);
  const [labels, setLabels] = useState([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState(null);
  const [selectedNote, setSelectedNote] = useState(null);
  const [notification, setNotification] = useState(null);
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedCategory, setSelectedCategory] = useState(null);
  const [isFilterDropdownOpen, setIsFilterDropdownOpen] = useState(false);
  const [isLabelDropdownOpen, setIsLabelDropdownOpen] = useState(false);
  const [showDeleteConfirmation, setShowDeleteConfirmation] = useState(false);
  const [showArchiveConfirmation, setShowArchiveConfirmation] = useState(false);
  const [isLabelsModalOpen, setIsLabelsModalOpen] = useState(false);
  const [newLabel, setNewLabel] = useState({ name: "", color: "#000000" });
  const [editingLabel, setEditingLabel] = useState(null);
  const navigate = useNavigate();

  const isArchivePage = window.location.pathname.includes("/archives");

  const saveTimerRef = useRef(null);
  const editorRef = useRef(null);
  const apiKey = "62ss3wccnxwa0vkwpu8qr0oeuwuiq70oyc41bx9tefnsqpt2";

  const showNotification = (message, type) => {
    setNotification({ message, type });
    if (type === "success") {
      setTimeout(() => {
        setNotification(null);
      }, 3000);
    }
  };

  const fetchLabels = async () => {
    try {
      const response = await fetch(
        "http://localhost/arthursonnet.com/api/v1/notes/get_labels.php"
      );
      if (!response.ok)
        throw new Error("Erreur lors de la récupération des labels.");
      const data = await response.json();
      if (data.status === "success" && Array.isArray(data.records)) {
        setLabels(data.records);
      } else {
        console.error("Réponse API labels non conforme:", data);
        setLabels([]);
      }
    } catch (err) {
      console.error("Erreur de fetch pour les labels:", err);
    }
  };

  const handleSaveNote = async (note) => {
    if (!note || (!note.title && !note.content)) {
      return;
    }

    clearTimeout(saveTimerRef.current);

    saveTimerRef.current = setTimeout(async () => {
      try {
        const response = await fetch(
          "http://localhost/arthursonnet.com/api/v1/notes/update_note.php",
          {
            method: "PUT",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(note),
          }
        );

        if (!response.ok) {
          throw new Error("Erreur lors de la sauvegarde.");
        }

        const result = await response.json();
        if (result.status === "success") {
          showNotification("Note enregistrée avec succès.", "success");
          setNotes((prevNotes) =>
            prevNotes.map((n) => (n.id === note.id ? note : n))
          );
        } else {
          throw new Error(result.message);
        }
      } catch (err) {
        showNotification(
          "Erreur lors de l'enregistrement de la note.",
          "error"
        );
        console.error("Erreur de sauvegarde:", err);
      }
    }, 1000);
  };

  const handleCreateNote = async () => {
    try {
      const response = await fetch(
        "http://localhost/arthursonnet.com/api/v1/notes/add_note.php",
        {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ userId: 2 }),
        }
      );

      if (!response.ok) {
        throw new Error("Erreur lors de la création de la note.");
      }

      const newNote = await response.json();
      if (newNote.status === "success" && newNote.record) {
        setNotes((prevNotes) => [newNote.record, ...prevNotes]);
        setSelectedNote(newNote.record);
        showNotification("Nouvelle note créée.", "success");
      } else {
        throw new Error(newNote.message);
      }
    } catch (err) {
      showNotification("Erreur lors de la création de la note.", "error");
      console.error("Erreur de création de note:", err);
    }
  };

  const handleDeleteNote = async () => {
    if (!selectedNote) return;

    try {
      const response = await fetch(
        `http://localhost/arthursonnet.com/api/v1/notes/delete_note.php?id=${selectedNote.id}`,
        {
          method: "DELETE",
        }
      );

      if (!response.ok) {
        throw new Error("Erreur lors de la suppression de la note.");
      }

      const result = await response.json();
      if (result.status === "success") {
        showNotification("Note supprimée avec succès.", "success");
        setNotes((prevNotes) =>
          prevNotes.filter((n) => n.id !== selectedNote.id)
        );
        setSelectedNote(null);
      } else {
        throw new Error(result.message);
      }
    } catch (err) {
      showNotification("Erreur lors de la suppression de la note.", "error");
      console.error("Erreur de suppression de note:", err);
    } finally {
      setShowDeleteConfirmation(false);
    }
  };

  const handleArchiveNote = async () => {
    if (!selectedNote) return;
    const updatedNote = { ...selectedNote, status: "archived" };
    await handleSaveNote(updatedNote);
    setShowArchiveConfirmation(false);
    setNotes((prevNotes) => prevNotes.filter((n) => n.id !== selectedNote.id));
    setSelectedNote(null);
    showNotification("Note archivée avec succès.", "success");
  };

  const handleUnarchiveNote = async () => {
    if (!selectedNote) return;
    const updatedNote = { ...selectedNote, status: "active" };
    await handleSaveNote(updatedNote);
    setShowArchiveConfirmation(false);
    setNotes((prevNotes) => prevNotes.filter((n) => n.id !== selectedNote.id));
    setSelectedNote(null);
    showNotification("Note désarchivée avec succès.", "success");
  };

  const handleAddLabel = async () => {
    if (!newLabel.name) return;
    try {
      const response = await fetch(
        "http://localhost/arthursonnet.com/api/v1/notes/add_label.php",
        {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ userId: 2, ...newLabel }),
        }
      );
      if (!response.ok)
        throw new Error("Erreur lors de la création de l'étiquette.");
      const result = await response.json();
      if (result.status === "success") {
        fetchLabels();
        setNewLabel({ name: "", color: "#000000" });
        showNotification("Étiquette créée avec succès.", "success");
      } else {
        throw new Error(result.message);
      }
    } catch (err) {
      showNotification("Erreur lors de la création de l'étiquette.", "error");
      console.error("Erreur de création d'étiquette:", err);
    }
  };

  const handleUpdateLabel = async () => {
    if (!editingLabel.name) return;
    try {
      const response = await fetch(
        "http://localhost/arthursonnet.com/api/v1/notes/update_label.php",
        {
          method: "PUT",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify(editingLabel),
        }
      );
      if (!response.ok)
        throw new Error("Erreur lors de la modification de l'étiquette.");
      const result = await response.json();
      if (result.status === "success") {
        fetchLabels();
        setEditingLabel(null);
        showNotification("Étiquette mise à jour avec succès.", "success");
      } else {
        throw new Error(result.message);
      }
    } catch (err) {
      showNotification(
        "Erreur lors de la modification de l'étiquette.",
        "error"
      );
      console.error("Erreur de modification d'étiquette:", err);
    }
  };

  const handleDeleteLabel = async (labelId) => {
    try {
      const response = await fetch(
        "http://localhost/arthursonnet.com/api/v1/notes/delete_label.php",
        {
          method: "DELETE",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ id: labelId }),
        }
      );
      if (!response.ok)
        throw new Error("Erreur lors de la suppression de l'étiquette.");
      const result = await response.json();
      if (result.status === "success") {
        fetchLabels();
        showNotification("Étiquette supprimée avec succès.", "success");
      } else {
        throw new Error(result.message);
      }
    } catch (err) {
      showNotification(
        "Erreur lors de la suppression de l'étiquette.",
        "error"
      );
      console.error("Erreur de suppression d'étiquette:", err);
    }
  };

  useEffect(() => {
    const statusParam = isArchivePage ? "archived" : "active";
    fetch(
      `http://localhost/arthursonnet.com/api/v1/notes/get_notes.php?status=${statusParam}`
    )
      .then((response) => {
        if (!response.ok) throw new Error("Erreur de réponse du serveur.");
        return response.json();
      })
      .then((data) => {
        if (data.status === "success" && Array.isArray(data.records)) {
          setNotes(data.records);
        } else {
          setNotes([]);
          if (data.status === "error") {
            setError(data.message);
          } else {
            console.error("Réponse API non conforme:", data);
            setError("Réponse API non conforme.");
          }
        }
      })
      .catch((error) => {
        console.error("Erreur de fetch pour les notes:", error);
        setError(
          "Impossible de charger les notes. Veuillez vérifier votre connexion au serveur."
        );
      })
      .finally(() => setIsLoading(false));

    fetchLabels();
  }, [isArchivePage]);

  const handleNoteClick = (note) => {
    setSelectedNote(note);
    setIsFilterDropdownOpen(false);
  };

  const handleTitleChange = (e) => {
    const newTitle = e.target.value;
    setSelectedNote((prevNote) => {
      const updatedNote = { ...prevNote, title: newTitle };
      handleSaveNote(updatedNote);
      return updatedNote;
    });
  };

  const handleEditorChange = (newContent) => {
    setSelectedNote((prevNote) => {
      const updatedNote = { ...prevNote, content: newContent };
      handleSaveNote(updatedNote);
      return updatedNote;
    });
  };

  const handleLabelChange = (label) => {
    setSelectedNote((prevNote) => {
      const updatedNote = {
        ...prevNote,
        label_id: label ? label.id : null,
        label_name: label ? label.name : null,
        label_color: label ? label.color : null,
      };
      handleSaveNote(updatedNote);
      return updatedNote;
    });
    setIsLabelDropdownOpen(false);
  };

  const filteredNotes = notes.filter((note) => {
    const matchesSearch =
      (note.title &&
        note.title.toLowerCase().includes(searchQuery.toLowerCase())) ||
      (note.content &&
        note.content.toLowerCase().includes(searchQuery.toLowerCase()));
    const matchesCategory =
      selectedCategory === null || note.label_id === selectedCategory;
    return matchesSearch && matchesCategory;
  });

  const formatNoteContent = (content) => {
    if (!content) return "";
    const plainText = content
      .replace(/<[^>]+>/g, "")
      .replace(/#+.*|```[\s\S]*?```|\*\*[\s\S]*?\*\*|\*[\s\S]*?\*/g, "")
      .trim();
    return plainText.substring(0, 150) + (plainText.length > 150 ? "..." : "");
  };

  if (isLoading) {
    return (
      <main className="notes-page-container">
        <p>Chargement des notes...</p>
      </main>
    );
  }

  return (
    <main className="notes-page-container">
      <header className="notes-header">
        <button onClick={() => navigate(-1)} className="btn-back">
          <FontAwesomeIcon icon={faArrowLeft} />
        </button>
        <h1>{isArchivePage ? "Archives des notes" : "Mes Notes"}</h1>
        <div className="notes-actions">
          <div className="search-bar-wrapper">
            <input
              type="text"
              placeholder="Rechercher..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              className="search-input"
            />
            {searchQuery && (
              <button
                onClick={() => setSearchQuery("")}
                className="clear-search-btn"
              >
                <FontAwesomeIcon icon={faTimes} />
              </button>
            )}
            <FontAwesomeIcon icon={faSearch} className="search-icon" />
          </div>
          {!isArchivePage && (
            <div className="filter-dropdown-wrapper">
              <button
                className="btn-filter"
                onClick={() => setIsFilterDropdownOpen(!isFilterDropdownOpen)}
              >
                <FontAwesomeIcon icon={faFilter} /> Filtre
              </button>
              <div
                className={`filter-dropdown ${
                  isFilterDropdownOpen ? "open" : ""
                }`}
              >
                <button
                  onClick={() => {
                    setSelectedCategory(null);
                    setIsFilterDropdownOpen(false);
                  }}
                  className={`filter-button ${
                    !selectedCategory ? "active" : ""
                  }`}
                >
                  Toutes les notes
                </button>
                {labels.map((label) => (
                  <button
                    key={label.id}
                    onClick={() => {
                      setSelectedCategory(label.id);
                      setIsFilterDropdownOpen(false);
                    }}
                    className={`filter-button ${
                      selectedCategory === label.id ? "active" : ""
                    }`}
                  >
                    <span
                      className="label-color-dot"
                      style={{ backgroundColor: label.color }}
                    ></span>{" "}
                    {label.name}
                  </button>
                ))}
                <button
                  className="btn-manage-labels"
                  onClick={() => {
                    setIsLabelsModalOpen(true);
                    setIsFilterDropdownOpen(false);
                  }}
                >
                  <FontAwesomeIcon icon={faEdit} /> Gérer les étiquettes
                </button>
              </div>
            </div>
          )}
          {isArchivePage ? (
            <Link to="/productivite/notes" className="btn-archive">
              <FontAwesomeIcon icon={faBoxOpen} /> Notes actives
            </Link>
          ) : (
            <Link to="/productivite/notes/archives" className="btn-archive">
              <FontAwesomeIcon icon={faArchiveSolid} /> Archives
            </Link>
          )}

          {!isArchivePage && (
            <button className="btn-add" onClick={handleCreateNote}>
              <FontAwesomeIcon icon={faPlus} /> Nouvelle note
            </button>
          )}
        </div>
      </header>

      {error && <div className="error-message-notes">{error}</div>}

      <section className="notes-content-area">
        <div className="notes-list-sidebar">
          {filteredNotes.length > 0 ? (
            filteredNotes.map((note) => (
              <div
                key={note.id}
                className={`note-card ${
                  selectedNote && selectedNote.id === note.id ? "selected" : ""
                }`}
                onClick={() => handleNoteClick(note)}
              >
                <div className="note-card-header">
                  {note.title && <h3>{note.title}</h3>}
                  {note.label_name && (
                    <span
                      className="note-label"
                      style={{ backgroundColor: note.label_color }}
                    >
                      <FontAwesomeIcon icon={faTag} /> {note.label_name}
                    </span>
                  )}
                </div>
                <p className="note-content-preview">
                  {formatNoteContent(note.content)}
                </p>
                <div className="note-footer">
                  <small>
                    Créée le: {new Date(note.created_at).toLocaleDateString()}
                  </small>
                </div>
              </div>
            ))
          ) : (
            <p className="no-notes-message">
              {isArchivePage
                ? "Aucune note archivée."
                : "Aucune note ne correspond à votre recherche ou votre filtre."}
            </p>
          )}
        </div>

        <div className="note-editor-pane">
          {selectedNote ? (
            <>
              <div className="note-editor-header">
                <button
                  onClick={() => setSelectedNote(null)}
                  className="btn-back-mobile"
                >
                  <FontAwesomeIcon icon={faArrowLeft} />
                </button>
                <input
                  type="text"
                  className="note-editor-title"
                  value={selectedNote.title || ""}
                  onChange={handleTitleChange}
                  placeholder="Titre de la note"
                />
                <div className="editor-actions">
                  <div className="label-selector-wrapper">
                    <button
                      className="btn-label-selector"
                      onClick={() =>
                        setIsLabelDropdownOpen(!isLabelDropdownOpen)
                      }
                    >
                      {selectedNote.label_name ? (
                        <span
                          className="note-label-selected"
                          style={{ backgroundColor: selectedNote.label_color }}
                        >
                          <FontAwesomeIcon icon={faTag} />{" "}
                          {selectedNote.label_name}
                        </span>
                      ) : (
                        <>
                          <FontAwesomeIcon icon={faTag} /> Étiqueter{" "}
                          <FontAwesomeIcon icon={faCaretDown} />
                        </>
                      )}
                    </button>
                    <div
                      className={`label-dropdown ${
                        isLabelDropdownOpen ? "open" : ""
                      }`}
                    >
                      <button
                        onClick={() => handleLabelChange(null)}
                        className="label-button"
                      >
                        Aucune étiquette
                      </button>
                      {labels.map((label) => (
                        <button
                          key={label.id}
                          onClick={() => handleLabelChange(label)}
                          className="label-button"
                        >
                          <span
                            className="label-color-dot"
                            style={{ backgroundColor: label.color }}
                          ></span>{" "}
                          {label.name}
                        </button>
                      ))}
                    </div>
                  </div>
                  {isArchivePage ? (
                    <button
                      className="btn-unarchive"
                      onClick={handleUnarchiveNote}
                    >
                      <FontAwesomeIcon icon={faBoxOpen} />
                    </button>
                  ) : (
                    <button
                      className="btn-archive-editor"
                      onClick={() => setShowArchiveConfirmation(true)}
                    >
                      <FontAwesomeIcon icon={faArchiveSolid} />
                    </button>
                  )}
                  <button
                    className="btn-delete"
                    onClick={() => setShowDeleteConfirmation(true)}
                  >
                    <FontAwesomeIcon icon={faTrashAlt} />
                  </button>
                </div>
              </div>
              <Editor
                apiKey={apiKey}
                onInit={(evt, editor) => (editorRef.current = editor)}
                value={selectedNote.content || ""}
                init={{
                  height: "100%",
                  menubar: false,
                  plugins: [
                    "advlist autolink lists link image charmap print preview anchor",
                    "searchreplace visualblocks code fullscreen",
                    "insertdatetime media table paste code help wordcount",
                  ],
                  toolbar:
                    "undo redo | formatselect | " +
                    "bold italic backcolor | alignleft aligncenter " +
                    "alignright alignjustify | bullist numlist outdent indent | " +
                    "removeformat | help",
                }}
                onEditorChange={handleEditorChange}
              />
            </>
          ) : (
            <div className="editor-placeholder">
              Sélectionnez une note pour commencer à éditer.
            </div>
          )}
        </div>
      </section>

      {notification && (
        <Confirmation
          message={notification.message}
          type={notification.type}
          onClose={() => setNotification(null)}
        />
      )}

      {showDeleteConfirmation && (
        <Confirmation
          message={`Êtes-vous sûr de vouloir supprimer la note "${selectedNote.title}" ?`}
          type="error"
          onClose={() => setShowDeleteConfirmation(false)}
          onConfirm={handleDeleteNote}
        />
      )}

      {showArchiveConfirmation && (
        <Confirmation
          message={`Êtes-vous sûr de vouloir archiver la note "${selectedNote.title}" ?`}
          type="info"
          onClose={() => setShowArchiveConfirmation(false)}
          onConfirm={handleArchiveNote}
        />
      )}

      {isLabelsModalOpen && (
        <div className="modal-overlay">
          <div className="modal-content">
            <div className="modal-header">
              <h2>Gérer les étiquettes</h2>
              <button
                onClick={() => setIsLabelsModalOpen(false)}
                className="btn-close-modal"
              >
                <FontAwesomeIcon icon={faTimes} />
              </button>
            </div>
            <div className="modal-body">
              <h3>Créer une nouvelle étiquette</h3>
              <div className="add-label-form">
                <input
                  type="text"
                  placeholder="Nom de l'étiquette"
                  value={newLabel.name}
                  onChange={(e) =>
                    setNewLabel({ ...newLabel, name: e.target.value })
                  }
                />
                <input
                  type="color"
                  value={newLabel.color}
                  onChange={(e) =>
                    setNewLabel({ ...newLabel, color: e.target.value })
                  }
                />
                <button onClick={handleAddLabel} className="btn-add-label">
                  <FontAwesomeIcon icon={faPlus} /> Ajouter
                </button>
              </div>
              <div className="labels-list">
                {labels.map((label) => (
                  <div key={label.id} className="label-item">
                    {editingLabel && editingLabel.id === label.id ? (
                      <div className="edit-label-form">
                        <input
                          type="text"
                          value={editingLabel.name}
                          onChange={(e) =>
                            setEditingLabel({
                              ...editingLabel,
                              name: e.target.value,
                            })
                          }
                        />
                        <input
                          type="color"
                          value={editingLabel.color}
                          onChange={(e) =>
                            setEditingLabel({
                              ...editingLabel,
                              color: e.target.value,
                            })
                          }
                        />
                        <button
                          onClick={handleUpdateLabel}
                          className="btn-save-label"
                        >
                          Sauvegarder
                        </button>
                        <button
                          onClick={() => setEditingLabel(null)}
                          className="btn-cancel-edit"
                        >
                          Annuler
                        </button>
                      </div>
                    ) : (
                      <>
                        <span
                          className="label-name-display"
                          style={{ backgroundColor: label.color }}
                        >
                          <FontAwesomeIcon icon={faTag} /> {label.name}
                        </span>
                        <div className="label-actions">
                          <button
                            onClick={() => setEditingLabel(label)}
                            className="btn-edit-label"
                          >
                            <FontAwesomeIcon icon={faEdit} />
                          </button>
                          <button
                            onClick={() => handleDeleteLabel(label.id)}
                            className="btn-delete-label"
                          >
                            <FontAwesomeIcon icon={faTrashAlt} />
                          </button>
                        </div>
                      </>
                    )}
                  </div>
                ))}
              </div>
            </div>
          </div>
        </div>
      )}
    </main>
  );
};

export default NotesPage;
