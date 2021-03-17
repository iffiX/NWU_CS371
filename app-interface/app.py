'''
To run on command line:
export FLASK_APP=app.py
export FLASK_ENV=development
flask run
'''
from flask_restful import Api
from flask import Flask, request, Response, render_template
from flask_cors import CORS

app = Flask(__name__)
CORS(app)
api = Api(app)


# connect your routes to your app:
@app.route('/')
def home_page():
    return render_template("home.html")

@app.route('/get-route')
def get_route():
    print("you")
    return

if __name__ == "__main__":
    print('running!')
    app.run(debug=True)