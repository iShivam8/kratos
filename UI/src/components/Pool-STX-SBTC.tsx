import "./Swap.css";
import Airdrop from "./Airdrop";
import Pools from "./Airdrop";
import MobileApp from "./MobileApp";
import Navigation from "./Navigation";
import { useState } from "react";
import background from "../img/kratosbgm.jpeg";
import ConnectWallet from "./ConnectWallet";

const Pool2 = () => {
  const [fromAmount, setFromAmount] = useState("");
  const [toAmount, setToAmount] = useState("");
  const [isConfirmClicked, setConfirmClicked] = useState(false);

  return (
    <>
      <Navigation />
      <div
        className="min-h-screen bg-black flex items-center justify-center px-5 py-5"
        style={{
          backgroundImage: `url(${background})`,
          backgroundRepeat: "no-repeat",
          backgroundPosition: "center",
          backgroundSize: "cover",
        }}
      >
        <div className="max-w-md w-full bg-gray-700 rounded-xl p-5">
          <div className="text-white mb-5">
            <div className="flex justify-between items-center">
              <h2 className="text-xl font-bold">Add Liquidity</h2>
              <div className="text-xs">
                <span>Slippage: 4%</span>
                <button className="ml-2 bg-yellow-500 text-gray-800 text-xs py-1 px-2 rounded">
                  Edit
                </button>
              </div>
            </div>
          </div>
          <div className="mb-5">
            <label htmlFor="from" className="block text-sm text-gray-300 mb-2">
              From
            </label>
            <div className="flex items-center border border-gray-600 rounded">
              <div className="bg-blue-600 px-3 py-2 rounded-l text-white text-sm">
                STX
              </div>
              <input
                type="text"
                id="from"
                value={fromAmount}
                onChange={(e) => setFromAmount(e.target.value)}
                placeholder="0.00"
                className="text-white bg-transparent flex-1 py-2 px-3 focus:outline-none"
              />
            </div>
          </div>
          <div className="mb-5">
            <label htmlFor="to" className="block text-sm text-gray-300 mb-2">
              To
            </label>
            <div className="flex items-center border border-gray-600 rounded">
              <div className="bg-yellow-500 px-3 py-2 rounded-l text-gray-800 text-sm">
                sBTC
              </div>
              <input
                type="text"
                id="to"
                value={toAmount}
                onChange={(e) => setToAmount(e.target.value)}
                placeholder="0.00"
                className="text-white bg-transparent flex-1 py-2 px-3 focus:outline-none"
              />
            </div>
          </div>
          {isConfirmClicked ? (
            <button className="w-full bg-green-500 text-black font-bold py-3 rounded mb-3 hover:bg-yellow-600 transition-colors">
              Added ✓
            </button>
          ) : (
            <button
              className="w-full bg-green-500 text-black font-bold py-3 rounded mb-3 hover:bg-yellow-600 transition-colors"
              onClick={() => setConfirmClicked(true)}
            >
              Confirm
            </button>
          )}
          <ConnectWallet />
          <div className="text-gray-400 text-xs text-center">
            1 VELAR ≈ 0.0734580000 STX
          </div>
        </div>
      </div>
    </>
  );
};

export default Pool2;
