import { useState } from "react";

export const TokenModal = (props) => {
  const tokens = [
    { name: "Kratos LPT", symbol: "KLPT", logo: "klpt_logo.png" },
    { name: "Bitcoin", symbol: "BTC", logo: "btc_logo.webp" },
    {
      name: "Stacks Bitcoin",
      symbol: "sBTC",
      logo: "sbtc_logo.jpg",
    },
    { name: "Stacks", symbol: "STX", logo: "stx_logo.png" },
  ];
  const [close, setClose] = useState(false);
  return (
    <div
      className={
        !close
          ? "popup-box animate__animated animate__zoomIn animate__faster"
          : "popup-box animate__animated animate__zoomOut"
      }
    >
      <div className="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center">
        <div className="bg-gray-800 text-white max-w-md w-full rounded-lg p-5">
          <div className="flex justify-between items-center mb-4">
            <h3 className="text-xl">Select a Token</h3>
            <span
              className="text-2xl font-bold cursor-pointer"
              onClick={() => {
                setClose(true);
                props.handler(false);
                props.tokenModalHandler(false);
              }}
            >
              ×
            </span>
          </div>
          <div className="overflow-y-hidden max-h-70">
            {tokens.map((token, index) => (
              <div
                className="flex flex-row cursor-pointer items-center border-b border-gray-700 hover:bg-slate-600 hover:rounded-md"
                onClick={() => {
                  props.tokenHandler(token.symbol);
                  props.handler(false);
                  props.tokenModalHandler(false);
                }}
              >
                <img
                  className="rounded-full w-10 m-2"
                  src={token.logo}
                  alt="logo"
                />

                <div key={index} className="flex flex-col ml-20">
                  <span className="font-semibold">{token.name}</span>
                  <span className="text-gray-400 text-sm font-semibold">
                    {token.symbol}
                  </span>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
};
