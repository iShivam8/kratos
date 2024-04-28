import "./Swap.css";
import Pools from "./Airdrop";
import Navigation from "./Navigation";
import { useEffect, useState } from "react";
import background from "../img/kratosbgm.jpeg";
import ConnectWallet from "./ConnectWallet";
import { ExecuteContract } from "./ExecuteContractService";

const Airdrop = () => {
  const [fromAmount, setFromAmount] = useState("");
  const [toAmount, setToAmount] = useState("");
  const [fromToken, setFromToken] = useState("BTC");
  const [toToken, setToToken] = useState("sBTC");
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
              <h1 className="text-xl font-bold">Coming Soon ...</h1>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default Airdrop;
