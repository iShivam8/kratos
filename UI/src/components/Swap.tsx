import { createBrowserRouter } from "react-router-dom";
import { RouterProvider } from "react-router-dom";
import ConnectWallet from "./ConnectWallet";
import "./Swap.css";
import Airdrop from "./Airdrop";
import Pools from "./Airdrop";
import MobileApp from "./MobileApp";
import Navigation from "./Navigation";
// import { BrowserRouter as Router } from "react-router-dom";

const Swap = () => {
  // const appRouter = createBrowserRouter([
  //   {
  //     path: "/",
  //     element: <Swap />,
  //   },
  //   {
  //     path: "/airdrop",
  //     element: <Airdrop />,
  //   },
  //   {
  //     path: "/pools",
  //     element: <Pools />,
  //   },
  //   {
  //     path: "/app",
  //     element: <MobileApp />,
  //   },
  // ]);

  return (
    <>
      <Navigation />
      <div className="swap-container">
        <div className="swap-header">
          <ConnectWallet />
        </div>
        <div className="swap-box">
          <div className="swap-box-header">
            <span>Swap</span>
            <div className="slippage-container">
              Slippage: <span className="slippage-percentage">4%</span>{" "}
              <button>Edit</button>
            </div>
          </div>
          <div className="swap-input-container">
            <div className="swap-input">
              <label htmlFor="from-token">From</label>
              <select id="from-token">
                <option value="STX">STX</option>
                {/* Add other tokens as needed */}
              </select>
              <input type="number" placeholder="0.00" />
              <span>Balance: 0</span>
            </div>
            <div className="swap-input">
              <label htmlFor="to-token">To</label>
              <select id="to-token">
                <option value="VELAR">VELAR</option>
                {/* Add other tokens as needed */}
              </select>
              <input type="number" placeholder="0.00" />
              <span>Balance: 0</span>
            </div>
          </div>
          <button className="swap-button">Swap</button>
          <div className="rate-info">1 VELAR ≈ 0.0733670000 STX</div>
        </div>
      </div>
    </>
  );
};

export default Swap;
