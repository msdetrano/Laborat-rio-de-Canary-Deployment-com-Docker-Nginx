from flask import Flask
import os

app = Flask(__name__)
VERSION = os.getenv("APP_VERSION", "v1")

@app.route('/')
def hello():
    return f"✨ Versão da App: {VERSION}\n"

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)