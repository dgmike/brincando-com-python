import io
from flask import Flask, escape, request

data = io.open('data', 'r').read()

app = Flask(__name__)

@app.route("/")
def root():
    name = request.args.get("name", "world")
    return f"Hello {escape(name)}!<br/>data:<pre>{escape(data)}</pre>"
