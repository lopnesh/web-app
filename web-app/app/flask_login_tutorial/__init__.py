"""Initialize app."""
from flask import Flask
from flask_login import LoginManager
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()
login_manager = LoginManager()


def create_app():
    """Construct the core app object."""
    app = Flask(__name__, instance_relative_config=False)
    app.config.from_object("config.Config")

    # Initialize Plugins
    db.init_app(app)
    login_manager.init_app(app)

    with app.app_context():
        from . import auth, routes
        from .assets import compile_static_assets
        from .home import home

        # Register Blueprints
        app.register_blueprint(routes.main_bp)
        app.register_blueprint(auth.auth_bp)
        app.register_blueprint(home.home_bp, url_prefix='/home')

        # Create Database Models
        db.create_all()

        # Compile static assets
        if app.config["FLASK_ENV"] == "development":
            compile_static_assets(app)

        return app
