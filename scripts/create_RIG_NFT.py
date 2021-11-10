from brownie import MyRig, accounts, network, config
from scripts.helpful_scripts import OPENSEA_FORMAT

sample_token_uri = "https://zbr5v49mayrz.usemoralis.com/{id}.json"


def main():
    dev = accounts.add(config["wallets"]["from_key"])
    print(network.show_active())
    my_rig = MyRig[len(MyRig) - 1]
    token_id = my_rig.tokenCounter()
    transaction = my_rig.createCollectible(sample_token_uri, {"from": dev})
    transaction.wait(1)
    print(
        "Awesome! You can view your NFT at {}".format(
            OPENSEA_FORMAT.format(my_rig.address, token_id)
        )
    )
    print('Please give up to 20 minutes, and hit the "refresh metadata" button')