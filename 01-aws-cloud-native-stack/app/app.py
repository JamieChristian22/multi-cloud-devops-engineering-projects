from flask import Flask, jsonify, render_template
import os, socket

app = Flask(__name__)

@app.get('/')
def index():
    return render_template('index.html', environment=os.getenv('APP_ENV','development'), hostname=socket.gethostname())

@app.get('/health')
def health():
    return jsonify(status='healthy', service='aws-cloud-native-stack'), 200

@app.get('/api/info')
def info():
    return jsonify(application='AWS Cloud-Native Stack', environment=os.getenv('APP_ENV','development'), platform='Amazon ECS Fargate', infrastructure='Terraform', hostname=socket.gethostname(), status='running')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int(os.getenv('PORT','8080')))
