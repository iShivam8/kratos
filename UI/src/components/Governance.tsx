import "./Swap.css";
import Airdrop from "./Airdrop";
import Pools from "./Airdrop";
import MobileApp from "./MobileApp";
import Navigation from "./Navigation";
import { useEffect, useState } from "react";
import background from "../img/kratosbgm.jpeg";
import ConnectWallet from "./ConnectWallet";
import { ExecuteContract } from "./ExecuteContractService";

const Governance = () => {
  const [fromAmount, setFromAmount] = useState("");
  const [toAmount, setToAmount] = useState("");
  const [fromToken, setFromToken] = useState("KLPT");
  const [toToken, setToToken] = useState("GKRT");
  const [isConfirmClicked, setConfirmClicked] = useState(false);

  useEffect(() => {
    setTimeout(() => {
      setConfirmClicked(false);
    }, 10000);
  }, [isConfirmClicked]);

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
                <span className="font-semibold text-gray-400">
                  Slippage: 4%
                </span>
              </div>
            </div>
          </div>
          <div className="mb-5">
            <label
              htmlFor="token1"
              className="block text-sm text-gray-300 mb-2 font-bold"
            >
              Token 1
            </label>
            <div className="flex items-center border border-gray-600 rounded cursor-pointer">
              <div className="bg-blue-600 px-3 py-2 rounded-l text-white hover:bg-blue-400">
                <span className="font-bold">{fromToken}</span>
              </div>
              <input
                type="text"
                id="from"
                value={fromAmount}
                onChange={(e) => setFromAmount(e.target.value)}
                placeholder="0.00"
                className="text-white bg-transparent flex-1 py-2 px-3 focus:outline-none font-bold"
              />
            </div>
          </div>
          <div className="mb-5">
            <label
              htmlFor="token2"
              className="block text-sm text-gray-300 mb-2 font-bold"
            >
              Token 2
            </label>
            <div className="flex items-center border border-gray-600 rounded cursor-pointer">
              <div className="bg-red-600 px-3 py-2 rounded-l text-teal-50 hover:bg-red-400">
                <span className="font-bold">{toToken}</span>
              </div>
              <input
                type="text"
                id="to"
                value={toAmount}
                onChange={(e) => setToAmount(e.target.value)}
                placeholder="0.00"
                className="text-white bg-transparent flex-1 py-2 px-3 focus:outline-none font-bold"
              />
            </div>
          </div>
          {isConfirmClicked ? (
            <button
              onClick={() => setConfirmClicked(false)}
              className="w-full justify-items-center bg-gradient-to-br from-blue-600 to-blue-800 text-teal-50 font-bold py-3 rounded mb-3 hover:bg-red-400 transition-colors"
            >
              Added ✓
            </button>
          ) : (
            <button
              className="w-full bg-gradient-to-br from-red-600 to-red-800 text-teal-50 font-bold py-3 rounded mb-3 hover:bg-red-400 transition-colors"
              onClick={() => setConfirmClicked(true)}
            >
              Confirm
              {/* <span onClick={ExecuteContract}>Confirm</span> */}
            </button>
          )}
          <ConnectWallet />
          <div className="text-gray-400 text-sm font-bold text-end">
            1 KLPT ≈ 0.0734580000 STX
          </div>
        </div>
      </div>
    </>
  );
};

export default Governance;
