from flask import Blueprint ,render_template

views = Blueprint('views', __name__)

@views.route('/')
def home():
    return render_template("QueryViewIV.html")

@views.route('/search-co2e')
def homeco2e():
    return render_template("QueryViewIII.html")
