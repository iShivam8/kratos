import React from "react";
import Swap from "./components/Swap";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Pools from "./components/Pools";
import Pool1 from "./components/Pool-BTC-SBTC";
import Pool2 from "./components/Pool-STX-SBTC";
import Governance from "./components/Governance";
import Airdrop from "./components/Airdrop";

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/">
          <Route path="" index element={<Swap />} />
          <Route path="swap" element={<Swap />} />
          <Route path="pools" element={<Pools />} />
          <Route path="1" element={<Pool1 />} />
          <Route path="2" element={<Pool2 />} />
          <Route path="governance" element={<Governance />} />
          <Route path="airdrop" element={<Airdrop />} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
}

export default App;
