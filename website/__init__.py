from flask import Flask
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
import os

db = SQLAlchemy()
db_url = os.environ.get('DB_URL')
jawsDB_url = os.environ["JAWSDB_URL"]

def create_app():
    app =Flask(__name__)
    app.config['SECRET_KEY'] = 'nyu-carbon'
    #app.config['SQLALCHEMY_DATABASE_URI'] = db_url
    app.config['SQLALCHEMY_DATABASE_URI']= jawsDB_url
    db.init_app(app)
    CORS(app)

    from .views import views
    from .auth import auth

    app.register_blueprint(views, url_prefix='/')
    app.register_blueprint(auth, url_prefix='/')


    return app
    