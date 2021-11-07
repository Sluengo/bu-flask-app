from flask import Flask
app = Flask(__name__)
@app.route('/')
def hello_world():
   return "Hello, World! This app is running in a docker container hosted on an AWS EKS Cluster"
if __name__ == "__main__":
   app.run(host='0.0.0.0', port=5000)