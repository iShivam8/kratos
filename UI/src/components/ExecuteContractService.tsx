import { TransactionTypes, useConnect } from "@stacks/connect-react";
import {
  uintCV,
  intCV,
  bufferCV,
  stringAsciiCV,
  stringUtf8CV,
  standardPrincipalCV,
  trueCV,
} from "@stacks/transactions";

export const ExecuteContract = async () => {
  const { doContractCall } = useConnect();
  const functionArgs = [
    uintCV(1234),
    intCV(-234),
    bufferCV(Buffer.from("hello, world")),
    stringAsciiCV("hey-ascii"),
    stringUtf8CV("hey-utf8"),
    standardPrincipalCV("STB44HYPYAT2BB2QE513NSP81HTMYWBJP02HPGK6"),
    trueCV(),
  ];
  const options = {
    contractAddress: "ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM",
    contractName: "token-klpt",
    functionName: "mint",
    functionArgs,
    appDetails: {
      amt: "u10",
      name: "Kratos",
      icon: "",
    },
    txType: TransactionTypes.ContractCall,
    onFinish: (data: any) => {
      console.log("Stacks Transaction:", data.stacksTransaction);
      console.log("Transaction ID:", data.txId);
      console.log("Raw transaction:", data.txRaw);
    },
  };
  await doContractCall(options);
};
