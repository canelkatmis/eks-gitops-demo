from flask import Flask

app = Flask(__name__)

@app.route('/')
def helloWorld():
    return 'Hello World!'

@app.route('/health')
def return_ok():
    return 'Ok!', 200

app.run(host='0.0.0.0', port= 800)
