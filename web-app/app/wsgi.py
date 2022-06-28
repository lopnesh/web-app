"""Application entry point."""
from flask_login_tutorial import create_app

app = create_app()

if __name__ == "__main__":
    app.run()
