import os
from brownie import Motherboard, accounts, network, config


def main():
    dev = accounts.add(config["wallets"]["from_key"])
    print(network.show_active())
    publish_source = True if os.getenv("ETHERSCAN_TOKEN") else False
    Motherboard.deploy({"from": dev}, publish_source=publish_source)