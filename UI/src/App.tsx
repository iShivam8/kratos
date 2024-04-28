import React from "react";
import Swap from "./components/Swap";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Pools from "./components/Pools";

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/">
          <Route index element={<Swap />} />
          <Route path="pools" element={<Pools />} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
}

export default App;
