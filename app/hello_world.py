from flask import Flask

app = Flask(__name__)

@app.route('/')
def helloWorld():
    return 'Hello World!'

@app.route('/alive')
def alive():
    return 'Ok!', 200

 @app.route('/ready')
def ready():
    return 'Ok!', 200

app.run(host='0.0.0.0', port= 800)
