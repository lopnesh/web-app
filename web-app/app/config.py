"""Flask app configuration."""
from os import environ, path

class Config:
    """Set Flask configuration from environment variables."""

    FLASK_APP = environ.get("FLASK_APP")
    FLASK_ENV = environ.get("FLASK_ENV")
    SECRET_KEY = "mysecretkey"
    AWS_DEFAULT_REGION = environ.get("AWS_DEFAULT_REGION")

    # Flask-SQLAlchemy
    DB_USER = environ.get("DB_USER")
    DB_PASS = environ.get("DB_PASS")
    DB_ENDPOINT = environ.get("DB_ENDPOINT")
    DB_NAME = environ.get("DB_NAME")
    SQLALCHEMY_DATABASE_URI = "mysql+pymysql://" + DB_USER + ":" + DB_PASS + "@" + DB_ENDPOINT + "/" + DB_NAME
    #SQLALCHEMY_DATABASE_URI = "mysql+pymysql://admin:Gfhjkm123@userdata.cisuykwqiuje.eu-central-1.rds.amazonaws.com:3306/userdata"
    SQLALCHEMY_ECHO = False
    SQLALCHEMY_TRACK_MODIFICATIONS = False

    # Flask-Assets
    LESS_BIN = environ.get("LESS_BIN")
    ASSETS_DEBUG = environ.get("ASSETS_DEBUG")
    LESS_RUN_IN_DEBUG = environ.get("LESS_RUN_IN_DEBUG")

    # Static Assets
    STATIC_FOLDER = "static"
    TEMPLATES_FOLDER = "templates"
    COMPRESSOR_DEBUG = environ.get("COMPRESSOR_DEBUG")
