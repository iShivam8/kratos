import { useConnect } from "@stacks/connect-react";
import {
  uintCV,
  intCV,
  bufferCV,
  stringAsciiCV,
  stringUtf8CV,
  standardPrincipalCV,
  trueCV,
} from "@stacks/transactions";

const ContractService = () => {
  const { doContractCall } = useConnect();

  const onClick = async () => {
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
      contractAddress: "ST22T6ZS7HVWEMZHHFK77H4GTNDTWNPQAX8WZAKHJ",
      contractName: "my-contract",
      functionName: "my-func",
      functionArgs,
      appDetails: {
        name: "My App",
        icon: window.location.origin + "/my-app-logo.svg",
      },
      onFinish: (data: any) => {
        console.log("Stacks Transaction:", data.stacksTransaction);
        console.log("Transaction ID:", data.txId);
        console.log("Raw transaction:", data.txRaw);
      },
    };
    await doContractCall(options);
  };

  return <span onClick={onClick}>Call my contract</span>;
};

export default ContractService;
