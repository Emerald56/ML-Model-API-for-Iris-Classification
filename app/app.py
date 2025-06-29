from flask import Flask, request, jsonify
import joblib
import numpy as np 
import os  #Ensure the app can find the model.pkl despite the current working directory

# Load the trained model
model = joblib.load("model.pkl")
# create Flask app
app = Flask(__name__)
@app.route("/")
def home():
    return "ML Model is ready"
@app.route("/predict", methods=['POST'])
def predict():
    data = request.get_json()
    
    # this is used to convert the input data to numpy array
    features = np.array(data["features"]).reshape(1, -1)

    # this feature makes prediction using the model
    prediction = model.predict(features)

    # this feature returns the prediction as a JSON response
    return jsonify({"prediction": int(prediction[0])})
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
