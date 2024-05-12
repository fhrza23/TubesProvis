from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

app = FastAPI()

# class LoginRequest(BaseModel):
#     username: str
#     password: str

# users = {
#     "user1": "password1",
#     "user2": "password2"
# }

@app.get("/")
def read_root():
 return {"data" : "Hello World"}
# def login(m: LoginRequest):
#     # username = m.username
#     # password = m.password
    
#     if m.username in users and users[m.username] == m.password:
#         return {"login berhasil"}  
#     else:
#         raise HTTPException(status_code=401, detail="Nama pengguna atau kata sandi salah")