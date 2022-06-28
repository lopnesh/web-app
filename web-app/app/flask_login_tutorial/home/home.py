from flask import Blueprint
from flask import current_app as app
from flask import render_template ,redirect, request
from flask_login import login_required
import boto3

dynamodb = boto3.resource('dynamodb',)

from boto3.dynamodb.conditions import Key, Attr

# Blueprint Configuration
home_bp = Blueprint(
    "home_bp", __name__, template_folder="templates", static_folder="static"
)


@home_bp.route("/", methods=["GET", "POST"])
@login_required
def home():
    table = dynamodb.Table('Images')

    response = table.scan()
    data = response['Items']

    return render_template(
        "index.jinja2",
        title="Flask Blueprint Demo",
        template="home-template",
        data = data,
    )


@home_bp.route("/add-image", methods=["GET", "POST"])
def add_image():
    if request.method == 'POST':
        image = request.form['image_url']
        format = request.form['format']

        table = dynamodb.Table('Images')

        table.put_item(
            Item={
        'image': image,
        'format': format
            }
        )
        return redirect("/home")
    return redirect("/home")