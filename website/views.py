from flask import Blueprint ,render_template

views = Blueprint('views', __name__)

@views.route('/')
def home():
    return render_template("QueryViewV.html")

@views.route('/about-us')
def aboutUs():
    return render_template("about_us.html")
