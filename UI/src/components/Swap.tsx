import "./Swap.css";
import Airdrop from "./Airdrop";
import Pools from "./Airdrop";
import MobileApp from "./MobileApp";
import Navigation from "./Navigation";
import { useState, useEffect } from "react";
import background from "../img/kratosbgm.jpeg";
import { TokenModal } from "./TokenModal";
import ConnectWallet from "./ConnectWallet";

const Swap = () => {
  const [fromAmount, setFromAmount] = useState("");
  const [toAmount, setToAmount] = useState("");
  const [showTokenModal, setShowTokenModal] = useState(false);
  const [fromToken, setFromToken] = useState("KLPT");
  const [toToken, setToToken] = useState("sBTC");
  const [fromTokenModal, setFromTokenModal] = useState(false);
  const [toTokenModal, setToTokenModal] = useState(false);

  useEffect(() => {
    setToAmount(fromAmount);
  }, [fromAmount]);

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
              <h2 className="text-xl font-bold">Swap</h2>
              <div className="text-xs">
                <span className="font-semibold text-gray-400">
                  Slippage: 4%
                </span>
              </div>
            </div>
          </div>
          <div className="mb-5">
            <label
              htmlFor="from"
              className="block text-sm text-gray-300 mb-2 font-bold"
            >
              From
            </label>
            <div className="flex items-center border border-gray-600 rounded cursor-pointer">
              <div className="bg-blue-600 px-3 py-2 rounded-l text-white hover:bg-blue-400">
                <span
                  className="font-bold"
                  onClick={() => {
                    setShowTokenModal(true);
                    setFromTokenModal(true);
                  }}
                >
                  {fromToken}
                </span>
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
              htmlFor="to"
              className="block text-sm text-gray-300 mb-2 font-bold"
            >
              To
            </label>
            <div className="flex items-center border border-gray-600 rounded cursor-pointer">
              <div className="bg-red-600 px-3 py-2 rounded-l text-teal-50 hover:bg-red-400">
                <span
                  className="font-bold"
                  onClick={() => {
                    setShowTokenModal(true);
                    setToTokenModal(true);
                  }}
                >
                  {toToken}
                </span>
              </div>
              <input
                type="text"
                id="to"
                value={toAmount}
                placeholder="0.00"
                className="text-white bg-transparent flex-1 py-2 px-3 focus:outline-none font-bold"
              />
            </div>
          </div>
          {showTokenModal && fromTokenModal && (
            <TokenModal
              handler={setShowTokenModal}
              tokenHandler={setFromToken}
              tokenModalHandler={setFromTokenModal}
            />
          )}
          {showTokenModal && toTokenModal && (
            <TokenModal
              handler={setShowTokenModal}
              tokenHandler={setToToken}
              tokenModalHandler={setToTokenModal}
            />
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

export default Swap;
