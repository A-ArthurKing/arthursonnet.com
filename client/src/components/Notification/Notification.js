// client/src/components/Notification/Notification.js
import React, { useEffect, useState } from "react";
import { createPortal } from "react-dom";
import "./Notification.css";

const Notification = ({ message, type, onClose }) => {
  const [isVisible, setIsVisible] = useState(false);

  useEffect(() => {
    if (message) {
      setIsVisible(true);
      const timer = setTimeout(() => {
        setIsVisible(false);
        setTimeout(onClose, 500); // Wait for fade-out animation
      }, 3000);
      return () => clearTimeout(timer);
    }
  }, [message, onClose]);

  if (!message) return null;

  const notificationClass = `notification-popup ${type} ${
    isVisible ? "visible" : ""
  }`;

  return createPortal(
    <div className={notificationClass}>
      <span className="notification-message">{message}</span>
    </div>,
    document.body
  );
};

export default Notification;
