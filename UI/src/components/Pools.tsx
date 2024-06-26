import React from "react";
import { useNavigate } from "react-router-dom";
import Navigation from "./Navigation";
import localImage from "../img/pools.png"; // Make sure to provide the correct path

function Pools() {
  let navigate = useNavigate();
  const routeChange = (id: any) => {
    let path = `/${id}`;
    navigate(path);
  };
  return (
    <>
      <Navigation />
      <div className="flex flex-col items-center justify-center w-screen h-screen bg-gray-900 py-10 overflow-auto">
        <img
          src={localImage}
          alt="Description of local image"
          width="1200"
          height="1000"
          className="rounded-lg mt-20 mx-2 relative"
        />
        <div className="flex flex-col items-center w-screen h-screen bg-gray-900 pt-20 overflow-auto">
          <div className="flex flex-col mt-6 w-full lg:w-4/5 xl:w-3/4">
            <div className="overflow-x-auto sm:-mx-6 lg:-mx-8">
              <div className="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
                <div className="shadow overflow-hidden sm:rounded-lg">
                  <table className="min-w-full w-full text-lg text-gray-400">
                    <thead className="bg-gray-800 text-sm lg:text-lg uppercase font-semibold">
                      <tr>
                        <th
                          scope="col"
                          className="px-6 py-3 text-left tracking-wider"
                        >
                          #
                        </th>
                        <th
                          scope="col"
                          className="px-6 py-3 text-left tracking-wider"
                        >
                          Name
                        </th>
                        <th
                          scope="col"
                          className="px-6 py-3 text-left tracking-wider"
                        >
                          TVL
                        </th>
                        <th
                          scope="col"
                          className="px-6 py-3 text-left tracking-wider"
                        >
                          Volume (24h)
                        </th>
                        <th
                          scope="col"
                          className="px-6 py-3 text-left tracking-wider"
                        >
                          Fees (24h)
                        </th>
                        <th
                          scope="col"
                          className="px-6 py-3 text-left tracking-wider"
                        >
                          APR
                        </th>
                      </tr>
                    </thead>
                    <tbody className="bg-gray-800">
                      <tr
                        onClick={() => routeChange(1)}
                        className="bg-black bg-opacity-20 hover:bg-gray-700 hover:text-white cursor-pointer"
                      >
                        <td className="px-6 py-4 whitespace-nowrap">1</td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          BTC -- sBTC
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          $341.906K
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          $28.543K
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          $76.636K
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">--</td>
                      </tr>
                      <tr
                        onClick={() => routeChange(2)}
                        className="bg-black bg-opacity-20 hover:bg-gray-700 hover:text-white cursor-pointer"
                      >
                        <td className="px-6 py-4 whitespace-nowrap">2</td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          STX -- sBTC
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          $646.906K
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          $11.543K
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          $98.636K
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">--</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
}

export default Pools;
