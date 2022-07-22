import subprocess
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()


class SignUpModel(BaseModel):
    login: str
    password: str


@app.post("/user")
def set_user(signup_data: SignUpModel):
    err = subprocess.call(["mqtt-set-user", signup_data.login, signup_data.password])
    return {"error": err}


@app.delete("/user/{login}")
def remove_user(login: str):
    err = subprocess.call(["mqtt-remove-user", login])
    return {"success": err}

