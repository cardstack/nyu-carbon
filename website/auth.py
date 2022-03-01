from flask import Blueprint,  request, jsonify
import numpy as np
import website.models as models
from . import db
from .models import coolcat
auth = Blueprint('auth', __name__)

@auth.route('/api')
def index():
    
    result = db.session.query(coolcat).filter_by(token_id=10).first()
    return str(result.watt_per_tran)

@auth.route('/co2e', methods=['POST']) 
def postInput():
    insertValues = request.get_json()
    x1=insertValues["contract"]
    x2=insertValues["token"]
    input = np.array([x1, x2])
    #print(input[1])
    result = db.session.query(coolcat).filter_by(token_id=input[1]).first()
    
    if not result:
        return jsonify({'result': "Result not found "})
    else:
        return jsonify({'result': "Result： "+ str(round(result.watt_per_tran,8))+ "   KG"})

