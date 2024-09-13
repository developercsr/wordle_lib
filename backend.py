from flask import Flask
from flask_cors import CORS
myapp=Flask(__name__)
CORS(myapp)
@myapp.route("/wordoftheday")
def word_of_the_day():
    return {"word_of_day":"नमस्ते"}
if __name__=="__main__":
    myapp.run(debug=True,port=5555)