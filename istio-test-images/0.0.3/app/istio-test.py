import json
import os
import time

from flask import Flask

import tempfile
import logging

logger = logging.getLogger('waitress')
logger.setLevel(logging.INFO)

app = Flask(__name__)

@app.route('/probe', methods=['GET'])
def probe():
    return "Probe OK"

@app.route('/get_data', methods=['GET'])
def get():
    with open('config.json') as json_file:
        data = json.load(json_file)
        time.sleep(data.get("return_delay_ms")/1000)
    return "Version: " + os.environ['VERSION'] + " pod: " + os.environ['POD_NAME'], data.get("return_code")

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
