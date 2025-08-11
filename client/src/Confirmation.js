// src/Confirmation.js

import React from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faCheckCircle,
  faTimesCircle,
  faTimes,
  faTrashAlt,
} from "@fortawesome/free-solid-svg-icons";
import "./Confirmation.css";

const Confirmation = ({ message, type, onClose, onConfirm }) => {
  const isError = type === "error";
  const isConfirmation = typeof onConfirm === "function";

  return (
    <div className={`confirmation ${isError ? "error" : "success"}`}>
      <FontAwesomeIcon
        icon={isError ? faTimesCircle : faCheckCircle}
        className="confirmation-icon"
      />
      <span className="confirmation-message">{message}</span>
      {isConfirmation ? (
        <div className="confirmation-buttons">
          <button onClick={onClose} className="btn-cancel">
            Annuler
          </button>
          <button onClick={onConfirm} className="btn-confirm">
            <FontAwesomeIcon icon={faTrashAlt} /> Confirmer
          </button>
        </div>
      ) : (
        <button onClick={onClose} className="confirmation-close-btn">
          <FontAwesomeIcon icon={faTimes} />
        </button>
      )}
    </div>
  );
};

export default Confirmation;
