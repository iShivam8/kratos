import React from "react";

function Pools() {
  return (
    <div className="flex flex-col items-center justify-center w-screen min-h-screen bg-gray-900 py-10 overflow-auto">
      <h1 className="text-3xl text-gray-400 font-medium">Pools</h1>
      <div className="flex flex-col mt-6">
        <div className="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
          <div className="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8">
            <div className="shadow overflow-hidden sm:rounded-lg">
              <table className="min-w-full text-sm text-gray-400">
                <thead className="bg-gray-800 text-xs uppercase font-medium">
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
                <tbody className="bg-gray-800 ">
                  <tr className="bg-black bg-opacity-20 hover:bg-gray-300 hover:text-gray-900">
                    <td className="pl-4">1</td>
                    <td className="px-6 py-4 whitespace-nowrap ">
                      KLPT -- sBTC
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap ">$800.906K</td>
                    <td className="px-6 py-4 whitespace-nowrap ">$21.543K</td>
                    <td className="px-6 py-4 whitespace-nowrap ">$$48.636K</td>
                    <td className="px-6 py-4 whitespace-nowrap ">--</td>
                  </tr>
                  <tr className="hover:bg-gray-300 hover:text-gray-900 bg-black bg-opacity-20">
                    <td className="px-6 py-4 whitespace-nowrap ">2</td>
                    <td className="px-6 py-4 whitespace-nowrap ">
                      KLPT -- stSTX
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap ">254.906K</td>
                    <td className="px-6 py-4 whitespace-nowrap ">$31.543K</td>
                    <td className="px-6 py-4 whitespace-nowrap ">$$42.636K</td>
                    <td className="px-6 py-4 whitespace-nowrap ">--</td>
                  </tr>
                  <tr className="hover:bg-gray-300 hover:text-gray-900 bg-black bg-opacity-20">
                    <td className="px-6 py-4 whitespace-nowrap ">3</td>
                    <td className="px-6 py-4 whitespace-nowrap ">
                      BTC -- sBTC
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap ">$341.906K</td>
                    <td className="px-6 py-4 whitespace-nowrap ">$28.543K</td>
                    <td className="px-6 py-4 whitespace-nowrap ">$$76.636K</td>
                    <td className="px-6 py-4 whitespace-nowrap ">--</td>
                  </tr>
                  <tr className="hover:bg-gray-300 hover:text-gray-900 bg-black bg-opacity-20">
                    <td className="px-6 py-4 whitespace-nowrap ">3</td>
                    <td className="px-6 py-4 whitespace-nowrap ">
                      STX -- sBTC
                    </td>
                    <td className="px-6 py-4 whitespace-nowrap ">$646.906K</td>
                    <td className="px-6 py-4 whitespace-nowrap ">$11.543K</td>
                    <td className="px-6 py-4 whitespace-nowrap ">$$98.636K</td>
                    <td className="px-6 py-4 whitespace-nowrap ">--</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default Pools;
