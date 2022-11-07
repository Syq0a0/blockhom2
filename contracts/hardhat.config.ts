import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  // Solidity compiler version
  solidity: "0.8.9",
  networks: {
    ganache: {
      // Change the url according to your ganache configuration
      url: 'http://localhost:8545',
      // Change these accounts private keys according to your ganache configuration.
      accounts: [
        '754a8d94e2c357ca4d1015451b8ba6ea9db5d393fc9af2073218c7fd1bf38cac',
        'f1371a6f6d7eb5af73eef6740a2cff3f4c0d4ce6b43dc47fc65f483bb5f47af4',
        '9e8e4f4c2f6d5289c479e26c120a8e0c97e2d0ab825ca8000eafb2839fb1d618',
        'f14bf652832bb6d323400c5926f3bf5a812ad61f98fe457cd7f89debfd489ccf',
      ]
    },
  },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts"
  },
};

export default config;
