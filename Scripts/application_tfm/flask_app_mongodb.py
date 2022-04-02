#from app import mongo
#from bson.json_util import dumps
#from bson.objectid import ObjectId
from flask import jsonify, request, Flask

app = Flask(__name__)

@app.route('/select-test-tfm', methods=['GET'])
def test_tfm_conn():
	return "Todo OK"

@app.route('/select-test', methods=['GET'])
def add_user():
	_json = request.json
	_name = _json['name']
	_email = _json['email']
	_password = _json['pwd']
	# validate the received values
	if _name and _email and _password and request.method == 'POST':
		# save details
		id = mongo.db.user.insert({'name': _name, 'email': _email})
		resp = jsonify('User added successfully!')
		resp.status_code = 200
		return resp
	else:
		return not_found()

@app.errorhandler(404)
def not_found(error=None):
    message = {
        'status': 404,
        'message': 'Not Found: ' + request.url,
    }
    resp = jsonify(message)
    resp.status_code = 404

    return resp

if __name__ == "__main__":
    app.run()