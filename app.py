from flask import Flask
app = Flask(__name__)

@app.route('/')
def index():
   return 'Main Page: This app is running in docker on AWS EKS.'
   
@app.route('/hello')
def hello_world():
   return "Hello, World! This is another page!"

if __name__ == "__main__":
   app.run(host='0.0.0.0', port=5000)