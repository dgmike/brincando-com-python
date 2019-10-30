from flask import Flask, escape, request

app = Flask(__name__)

@app.route("/")
def root():
    name = request.args.get("name", "world")
    return f"Hello {escape(name)}!"
