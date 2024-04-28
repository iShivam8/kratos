// Navigation.tsx
import React from "react";
import { NavLink } from "react-router-dom";
import logo from "klpt_logo.png";
import "./Navigation.css";

const Navigation = () => {
  const setActiveClass = ({ isActive }: { isActive: boolean }) =>
    isActive ? "nav-item active" : "nav-item";

  return (
    <header className="nav-header absolute w-screen z-50">
      <div className="nav-brand flex flex-row items-center ml-4">
        <img src={"klpt_logo.png"} alt="logo" className="rounded-full w-8" />
        <span className="font-vinque font-bold text-3xl text-red-600 ml-2 pb-1">
          Kratos
        </span>
      </div>
      <nav className="nav-links text-lg font-bold">
        <NavLink to="/swap" className={setActiveClass}>
          <span className="p-3 hover:bg-slate-800 hover:rounded-lg">Swap</span>
        </NavLink>
        <NavLink to="/pools" className={setActiveClass}>
          <span className="p-3 hover:bg-slate-800 hover:rounded-lg">Pools</span>
        </NavLink>
        <NavLink to="/governance" className={setActiveClass}>
          <span className="p-3 hover:bg-slate-800 hover:rounded-lg">
            Governance
          </span>
        </NavLink>
        <NavLink to="/airdrop" className={setActiveClass}>
          <span className="p-3 hover:bg-slate-800 hover:rounded-lg">
            Airdrop
          </span>
        </NavLink>
      </nav>
      {/* <button className="connect-wallet-btn">Connect Wallet</button> */}
    </header>
  );
};

export default Navigation;
