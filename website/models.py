from . import db

class coolcat(db.Model):
    token_id = db.Column(db.Integer, primary_key = True)
    accumulative_gas_fee= db.Column(db.String(10))
    watt_per_tran = db.Column(db.Float(10))

class dog(db.Model):
    token_id = db.Column(db.Integer, primary_key = True)
    accumulative_gas_fee= db.Column(db.String(10))
    watt_per_token = db.Column(db.Float(10))

class ape(db.Model):
    token_id = db.Column(db.Integer, primary_key = True)
    accumulative_gas_fee= db.Column(db.String(10))
    watt_per_token = db.Column(db.Float(10))


def predict(input):
    pred1 = int(input[0]) 
    pred2 = int(input[1])
    return (pred1 + pred2)*100