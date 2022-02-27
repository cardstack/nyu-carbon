from flask import Flask
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
import os

db = SQLAlchemy()
db_user = os.environ.get('DB_USER')
db_pass = os.environ.get('DB_PASS')

def create_app():
    app =Flask(__name__)
    app.config['SECRET_KEY'] = 'nyu-carbon'
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://' + str(db_user) +':'+ str(db_pass) +'@nnsgluut5mye50or.cbetxkdyhwsb.us-east-1.rds.amazonaws.com/re4nl1r93wwgmzuc'
    db.init_app(app)
    CORS(app)

    from .views import views
    from .auth import auth

    app.register_blueprint(views, url_prefix='/')
    app.register_blueprint(auth, url_prefix='/')


    return app
    