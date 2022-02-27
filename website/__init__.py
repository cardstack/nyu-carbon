from flask import Flask
from flask_cors import CORS
from os import path
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()
DB_NAME = "database.db"

def create_app():
    app =Flask(__name__)
    app.config['SECRET_KEY'] = 'nyu-carbon'
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://f61oe34ieryulbh6:oqj8v5d5y37ituc4@nnsgluut5mye50or.cbetxkdyhwsb.us-east-1.rds.amazonaws.com/re4nl1r93wwgmzuc'
    db.init_app(app)
    CORS(app)

    from .views import views
    from .auth import auth

    app.register_blueprint(views, url_prefix='/')
    app.register_blueprint(auth, url_prefix='/')


    return app
    