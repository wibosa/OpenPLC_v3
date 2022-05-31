#!/bin/bash
#cd webserver
#python3 webserver.py

if [ ! -d webserver ]
then
	#mkdir webserver
        echo dir exist
	exit
fi
cd webserver
python3 -m venv venv
. venv/bin/activate
#pip install --upgrade pip
#pip install Flask
#pip install flask_login
#pip install sqlite3
#pip install pyserial
#pip install pymodbus

cat << HERE > minmimalapp.py
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"
HERE
export FLASK_ENV=development
#reloader file watch
export FLASK_RUN_EXTRA_FILES=webserver.py
export FLASK_APP=webserver
flask run

