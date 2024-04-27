// Navigation.tsx
import React from "react";
import { NavLink } from "react-router-dom";
import "./Navigation.css"; // Ensure you have a corresponding CSS file

const Navigation = () => {
  // This function is used to set the class name based on the isActive boolean
  const setActiveClass = ({ isActive }: { isActive: boolean }) =>
    isActive ? "nav-item active" : "nav-item";

  return (
    <header className="nav-header">
      <div className="nav-brand">🌀 YourLogo</div>
      <nav className="nav-links">
        <NavLink to="/swap" className={setActiveClass}>
          Swap
        </NavLink>
        <NavLink to="/pool" className={setActiveClass}>
          Pool
        </NavLink>
        <NavLink to="/farm" className={setActiveClass}>
          Farm
        </NavLink>
        {/* ... other links */}
      </nav>
      <button className="connect-wallet-btn">Connect Wallet</button>
    </header>
  );
};

export default Navigation;
