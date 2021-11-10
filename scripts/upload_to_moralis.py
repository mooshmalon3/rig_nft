import requests
import os
from pathlib import Path

moralis_BASE_URL = 'https://api.moralis.cloud/'
endpoint = 'pinning/pinFileToIPFS'
# Change this to upload a different file
filepath = './img/pug.png'
filename = filepath.split('/')[-1:][0]
headers = {'moralis_api_key': os.getenv('moralis_API_KEY'),
           'moralis_secret_api_key': os.getenv('moralis_API_SECRET')}


with Path(filepath).open("rb") as fp:
    image_binary = fp.read()
    response = requests.post(moralis_BASE_URL + endpoint,
                             files={"file": (filename, image_binary)},
                             headers=headers)
    print(response.json())