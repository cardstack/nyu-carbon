from flask import Blueprint,  request, jsonify
import numpy as np
import website.models as models
from . import db
from .models import coolcat, dog, ape
auth = Blueprint('auth', __name__)

@auth.route('/api')
def index():
    
    result = db.session.query(coolcat).filter_by(token_id=10).first()
    return str(result.watt_per_tran)

@auth.route('/co2e', methods=['POST']) 
def postInput():
    catContract = "0x1a92f7381b9f03921564a437210bb9396471050c"
    dogContract = "0xf4ee95274741437636e748ddac70818b4ed7d043"
    apeContract = "0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d"
    insertValues = request.get_json()
    x1=insertValues["contract"]
    x2=insertValues["token"]
    input = np.array([x1, x2])

    if input[0] == catContract: 
        result = db.session.query(coolcat).filter_by(token_id=input[1]).first()
    elif input[0] == dogContract:
        result = db.session.query(dog).filter_by(token_id=input[1]).first()
    elif input[0] == apeContract:
        result = db.session.query(ape).filter_by(token_id=input[1]).first()
    
    if not result:
        return jsonify({'result': "Result not found"})
    else:
        return jsonify({'result': str(round(result.watt_per_tran,3))})

