from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')  # если у вас есть такой шаблон

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)  # слушает на всех IP адресах и порту 80
