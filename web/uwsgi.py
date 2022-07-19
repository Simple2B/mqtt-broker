import subprocess
from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()


class SignUpModel(BaseModel):
    login: str
    password: str


@app.post("/user")
def set_user(signup_data: SignUpModel):
    subprocess.call(["mqtt-set-user", signup_data.login, signup_data.password])
    return {"success": True}


@app.delete("/user/{login}")
def remove_user(login: str):
    subprocess.call(["mqtt-remove-user", login])
    return {"success": True}

