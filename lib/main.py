from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import sqlite3
from fastapi.middleware.cors import CORSMiddleware
from datetime import datetime
from typing import List

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Atur sesuai dengan kebutuhan Anda
    allow_credentials=True,
    allow_methods=["POST", "OPTIONS"],  # Izinkan metode POST dan OPTIONS
    allow_headers=["*"],
)

# Model untuk data pengguna
class User(BaseModel):
    nik: str
    password: str
    
    class Config:
        orm_mode = True
        validate_assignment = True

# Model untuk data dokter
class Dokter(BaseModel):
    id_dokter: int
    nama_dokter: str
    spesialis: str
    hari_praktek: str
    jam_praktek: str
    rating: float
    alumni: str
    pengalaman: str
    nomor_str: int
    foto_dokter: str
    
    class Config:
        orm_mode = True
        validate_assignment = True
        
# Model untuk data notifikasi
class Notifikasi(BaseModel):
    id_notif: int
    tipe_notif: int
    title: str
    subtitle: str
    time: datetime
    id_news: int
    content: str

    class Config:
        orm_mode = True
        validate_assignment = True

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

@app.post('/api/login')
def login(user: User):
    try:
        # Proses autentikasi di sini
        conn = connect_db()
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM users WHERE nik = ? AND password = ?', (user.nik, user.password))
        print(user.dict())  # Cetak entitas untuk memeriksa formatnya
        result = cursor.fetchone()
        conn.close()

        if result:
            return {'message': 'Login successful'}
        else:
            raise HTTPException(status_code=401, detail="Invalid credentials")
    except Exception as e:
        print(f"Error processing login request: {e}")
        raise HTTPException(status_code=500, detail="Internal server error")

# Endpoint untuk mendapatkan semua data dokter
@app.get('/api/dokter')
def get_all_dokter():
    conn = connect_db()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM dokter')
    dokter = cursor.fetchall()
    conn.close()
    return dokter

# Endpoint untuk mendapatkan detail dokter berdasarkan ID
@app.get('/api/dokter/{id_dokter}')
def get_dokter(id_dokter: int):
    conn = connect_db()
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM dokter WHERE id_dokter = ?', (id_dokter,))
    dokter = cursor.fetchone()
    conn.close()
    
    if dokter:
        return dokter
    else:
        raise HTTPException(status_code=404, detail="Doctor not found")
    
    
# Endpoint untuk membuat notifikasi baru
@app.post('/api/notifikasi', status_code=201)
def create_notifikasi(notifikasi: Notifikasi):
    conn = connect_db()
    cursor = conn.cursor()
    cursor.execute('INSERT INTO notifikasi (tipe_notif, title, subtitle, time, id_news, content) VALUES (?, ?, ?, ?, ?, ?)',
                   (notifikasi.tipe_notif, notifikasi.title, notifikasi.subtitle, notifikasi.time.isoformat(), notifikasi.id_news, notifikasi.content))
    conn.commit()
    conn.close()
    return {'message': 'Notifikasi created successfully'}

# Endpoint untuk mendapatkan detail notifikasi berdasarkan ID
@app.get('/api/notifikasi', response_model=List[Notifikasi])
def get_all_notifikasi():
    conn = connect_db()
    if not conn:
        raise HTTPException(status_code=500, detail="Failed to connect to the database")
    cursor = conn.cursor()
    try:
        cursor.execute('SELECT * FROM notifikasi')
        rows = cursor.fetchall()
        if not rows:
            raise HTTPException(status_code=404, detail="No notifikasi found")
        
        notifikasi_list = []
        for row in rows:
            notifikasi = Notifikasi(
                id_notif=row[0],
                tipe_notif=row[1],
                title=row[2],
                subtitle=row[3],
                time=datetime.fromisoformat(row[4]),  # Pastikan format waktu sesuai
                id_news=row[5],
                content=row[6]
            )
            notifikasi_list.append(notifikasi)
    except Exception as e:
        conn.close()
        print(f"Error fetching notifikasi: {e}")
        raise HTTPException(status_code=500, detail="Failed to fetch notifikasi")
    conn.close()
    return notifikasi_list

# Endpoint untuk mengupdate notifikasi berdasarkan ID
@app.put('/api/notifikasi/{id_notif}', response_model=Notifikasi)
def update_notifikasi(id_notif: int, notifikasi: Notifikasi):
    conn = connect_db()
    cursor = conn.cursor()
    cursor.execute('UPDATE notifikasi SET tipe_notif = ?, title = ?, subtitle = ?, time = ?, id_news = ?, content = ? WHERE id_notif = ?',
                   (notifikasi.tipe_notif, notifikasi.title, notifikasi.subtitle, notifikasi.time.isoformat(), notifikasi.id_news, notifikasi.content, id_notif))
    conn.commit()
    conn.close()
    return notifikasi

# Endpoint untuk menghapus notifikasi berdasarkan ID
@app.delete('/api/notifikasi/{id_notif}', status_code=204)
def delete_notifikasi(id_notif: int):
    conn = connect_db()
    cursor = conn.cursor()
    cursor.execute('DELETE FROM notifikasi WHERE id_notif = ?', (id_notif,))
    conn.commit()
    conn.close()
    return {'message': 'Notifikasi deleted successfully'}