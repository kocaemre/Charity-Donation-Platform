# Charity Donation Platform

![License](https://img.shields.io/badge/License-GPL--3.0-blue)

## Overview

Charity Donation Platform is a decentralized Ethereum smart contract that facilitates donation collections for various charity foundations. Users can participate in the donation process by sending Ethereum to the smart contract and selecting the charity foundation they wish to support.

## Features

- Choose from three charity foundations: losev, mehmetcik, kizilay.
- Users with a balance greater than 0.1 ETH can cast two votes instead of one.
- Smart contract runs for 2 blocks, allowing donations to be collected within that time frame.
- The contract automatically sends the donations to the charity foundation with the most votes at the end of the 2-block period.

## Usage

1. Clone the repository to your local machine.
2. Ensure you have the required version of Solidity (>=0.8.1) installed.
3. Deploy the smart contract to your Ethereum network of choice.
4. Interact with the smart contract using the provided functions to send donations and select a charity foundation.
5. The contract will automatically finalize the donations at the end of the 2-block period.

## How to Contribute

We welcome contributions to improve and enhance the Charity Donation Platform. To contribute:

1. Fork the repository.
2. Create a new branch for your changes.
3. Commit your changes and push them to your forked repository.
4. Open a pull request with a detailed description of the changes you made.

## License

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for more details.
