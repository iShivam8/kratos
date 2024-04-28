import React from "react";
import { AppConfig, showConnect, UserSession } from "@stacks/connect";

const appConfig = new AppConfig(["store_write", "publish_data"]);

export const userSession = new UserSession({ appConfig });

function authenticate() {
  showConnect({
    appDetails: {
      name: "Stacks React Starter",
      icon: window.location.origin + "/logo512.png",
    },
    redirectTo: "/",
    onFinish: () => {
      window.location.reload();
    },
    userSession,
  });
}

function disconnect() {
  userSession.signUserOut("/");
}

const ConnectWallet = () => {
  if (userSession.isUserSignedIn()) {
    return (
      <div>
        <button
          className="w-full bg-red-500 text-black font-bold py-3 rounded mb-5 hover:bg-yellow-600 transition-colors"
          onClick={disconnect}
        >
          Disconnect Wallet
        </button>
        <div className="max-w-md mx-auto text-white mb-3">
          {" "}
          {/* Set the max-width and auto-margin for centering */}
          <p className="break-words text-sm">
            MainNet: {userSession.loadUserData().profile.stxAddress.mainnet}
          </p>
          <br />
          <p className="break-words text-sm">
            TestNet: {userSession.loadUserData().profile.stxAddress.testnet}
          </p>
        </div>
      </div>
    );
  }

  return (
    <button
      className="w-full bg-red-500 text-black font-bold py-3 rounded mb-3 hover:bg-yellow-600 transition-colors"
      onClick={authenticate}
    >
      Connect Wallet
    </button>
  );
};

export default ConnectWallet;
