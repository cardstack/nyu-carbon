from flask import Blueprint,  request, jsonify
import numpy as np
import website.models as models
auth = Blueprint('auth', __name__)

@auth.route('/api')
def index():
    return 'hello'

@auth.route('/co2e', methods=['POST'])
def postInput():
    insertValues = request.get_json()
    x1=insertValues["contract"]
    x2=insertValues["token"]
    input = np.array([x1, x2])
    print(input)
    result = models.predict(input)
    print(input)
    
    return jsonify({'result': str(result)})

