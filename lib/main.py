# from flask import Flask, jsonify, request
# import sqlite3

# app = Flask(__name__)

# # Fungsi untuk menghubungkan ke database SQLite
# def connect_db():
#     return sqlite3.connect('db_provis.db')

# # Endpoint untuk membuat pengguna baru
# @app.route('/api/users', methods=['POST'])
# def create_user():
#     data = request.json
#     if 'nik' not in data or 'nama' not in data or 'password' not in data or 'no_hp' not in data:
#         return jsonify({'error': 'Data is incomplete'}), 400

#     conn = connect_db()
#     cursor = conn.cursor()
#     cursor.execute('INSERT INTO users (nik, nama, password, no_hp) VALUES (?, ?, ?, ?)',
#                    (data['nik'], data['nama'], data['password'], data['no_hp']))
#     conn.commit()
#     conn.close()
#     return jsonify({'message': 'User created successfully'}), 201

# # Endpoint untuk mendapatkan semua pengguna
# @app.route('/api/users', methods=['GET'])
# def get_all_users():
#     conn = connect_db()
#     cursor = conn.cursor()
#     cursor.execute('SELECT * FROM users')
#     users = cursor.fetchall()
#     conn.close()
#     return jsonify(users)

# # Endpoint untuk mendapatkan detail pengguna berdasarkan ID
# @app.route('/api/users/<int:user_id>', methods=['GET'])
# def get_user(user_id):
#     conn = connect_db()
#     cursor = conn.cursor()
#     cursor.execute('SELECT * FROM users WHERE id = ?', (user_id,))
#     user = cursor.fetchone()
#     conn.close()
#     if user:
#         return jsonify(user)
#     else:
#         return jsonify({'error': 'User not found'}), 404

# if __name__ == '__main__':
#     app.run(debug=True)
# -----------------------------------------------
# from typing import Union
# from fastapi import FastAPI

# app = FastAPI()

# @app.get("/")
# def read_root():
#  return {"Hello": "World"}
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import sqlite3

app = FastAPI()

# Model untuk data pengguna
class User(BaseModel):
    nik: str
    nama: str
    password: str
    no_hp: str

# Fungsi untuk menghubungkan ke database SQLite
def connect_db():
    try:
        conn = sqlite3.connect('db_provis.db')
        return conn
    except Exception as e:
        print("Error connecting to database:", e)
        return None

# Endpoint untuk membuat pengguna baru
@app.post('/api/users', status_code=201)
def create_user(user: User):
    conn = connect_db()
    cursor = conn.cursor()
    cursor.execute('INSERT INTO users (nik, nama, password, no_hp) VALUES (?, ?, ?, ?)',
                   (user.nik, user.nama, user.password, user.no_hp))
    conn.commit()
    conn.close()
    return {'message': 'User created successfully'}

# Endpoint untuk mendapatkan semua pengguna
@app.get('/api/users')
def get_all_users():
    conn = connect_db()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM users')
    users = cursor.fetchall()
    conn.close()
    return users

# Endpoint untuk mendapatkan detail pengguna berdasarkan ID
@app.get('/api/users/{user_id}')
def get_user(user_id: int):
    conn = connect_db()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM users WHERE id = ?', (user_id,))
    user = cursor.fetchone()
    conn.close()
    if user:
        return user
    else:
        raise HTTPException(status_code=404, detail="User not found")

