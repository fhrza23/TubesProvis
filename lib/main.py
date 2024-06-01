from fastapi import FastAPI, HTTPException, Depends
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List, Optional
from jose import JWTError, jwt
from passlib.context import CryptContext
import sqlite3
from datetime import datetime, timedelta

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Atur sesuai dengan kebutuhan Anda
    allow_credentials=True,
    allow_methods=["POST", "OPTIONS", "GET"],  # Izinkan metode POST, OPTIONS, dan GET
    allow_headers=["*"],
)

SECRET_KEY = "kelompok_tujuh"
ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 90

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

class Token(BaseModel):
    access_token: str
    token_type: str

class TokenData(BaseModel):
    nik: Optional[str] = None
    
# Model untuk data pengguna
class RegisterUser(BaseModel):
    nik: str
    nama: str
    no_hp: str
    password: str
    tgl_lahir: str

    class Config:
        orm_mode = True
        validate_assignment = True

# Model untuk login pengguna
class LoginUser(BaseModel):
    nik: str
    password: str
    
    class Config:
        orm_mode = True
        validate_assignment = True
        
# Model untuk memeriksa NIK
class CheckNIK(BaseModel):
    nik: str

    class Config:
        orm_mode = True
        validate_assignment = True

# Model untuk memverifikasi OTP
class VerifyOTP(BaseModel):
    no_hp: str
    otp: int

# Model untuk mengirim OTP
class SendOTP(BaseModel):
    no_hp: str

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

# Model untuk data artikel
class Artikel(BaseModel):
    judul: str
    tanggal: str
    isi: str
    foto: str

    class Config:
        orm_mode = True
        validate_assignment = True
        
class Payment(BaseModel):
    id_payment: int
    amount: int
    ewallet: str
    
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

def create_access_token(data: dict, expires_delta: Optional[timedelta] = None):
    to_encode = data.copy()
    if expires_delta:
        expire = datetime.utcnow() + expires_delta
    else:
        expire = datetime.utcnow() + timedelta(minutes=15)
    to_encode.update({"exp": expire})
    encoded_jwt = jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)
    return encoded_jwt

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="/api/login")

def get_current_user(token: str = Depends(oauth2_scheme)):
    credentials_exception = HTTPException(
        status_code=401,
        detail="Could not validate credentials",
        headers={"WWW-Authenticate": "Bearer"},
    )
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        nik: str = payload.get("sub")
        if nik is None:
            raise credentials_exception
        token_data = TokenData(nik=nik)
    except JWTError:
        raise credentials_exception
    conn = connect_db()
    if not conn:
        raise HTTPException(status_code=500, detail="Failed to connect to database")
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM users WHERE nik = ?', (token_data.nik,))
    user = cursor.fetchone()
    conn.close()
    if user is None:
        raise credentials_exception
    return user

# Endpoint untuk membuat pengguna baru
@app.post('/api/users', status_code=201)
def create_user(user: RegisterUser):
    conn = connect_db()
    cursor = conn.cursor()
    cursor.execute('INSERT INTO users (nik, nama, no_hp, password, tgl_lahir) VALUES (?, ?, ?, ?, ?)',
                   (user.nik, user.nama, user.no_hp, user.password, user.tgl_lahir))
    conn.commit()
    conn.close()
    return {'message': 'User created successfully'}

# Endpoint untuk mendapatkan semua pengguna
@app.get('/api/users')
def get_all_users():
    conn = connect_db()
    if not conn:
        raise HTTPException(status_code=500, detail="Failed to connect to database")
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM users')
    users = cursor.fetchall()
    conn.close()
    return users

# Endpoint untuk mendapatkan detail pengguna berdasarkan ID
@app.get('/api/users/{user_id}')
def get_user(user_id: int, current_user: RegisterUser = Depends(get_current_user)):
    conn = connect_db()
    if not conn:
        raise HTTPException(status_code=500, detail="Failed to connect to database")
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM users WHERE id = ?', (user_id,))
    user = cursor.fetchone()
    conn.close()
    if user:
        return user
    else:
        raise HTTPException(status_code=404, detail="User not found")

# Endpoint untuk login
@app.post('/api/login', response_model=Token)
def login(user: LoginUser):
    conn = connect_db()
    if not conn:
        raise HTTPException(status_code=500, detail="Failed to connect to database")
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM users WHERE nik = ? AND password = ?', (user.nik, user.password))
    result = cursor.fetchone()
    conn.close()

    if result:
        access_token_expires = timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
        access_token = create_access_token(
            data={"sub": user.nik}, expires_delta=access_token_expires
        )
        return {"access_token": access_token, "token_type": "bearer"}
    else:
        raise HTTPException(status_code=401, detail="Invalid credentials")

# Endpoint untuk memeriksa apakah NIK sudah digunakan
@app.post('/api/check_nik')
def check_nik(nik: CheckNIK, current_user: RegisterUser = Depends(get_current_user)):
    if not nik.nik:
        raise HTTPException(status_code=400, detail="NIK cannot be null or empty")
    conn = connect_db()
    if not conn:
        raise HTTPException(status_code=500, detail="Failed to connect to database")
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM users WHERE nik = ?', (nik.nik,))
    user = cursor.fetchone()
    conn.close()
    if user:
        raise HTTPException(status_code=400, detail="NIK already used")
    else:
        return {'message': 'NIK is available'}
    
# Endpoint untuk memverifikasi OTP
def verify_otp(data: VerifyOTP, current_user: RegisterUser = Depends(get_current_user)):
    conn = connect_db()
    if not conn:
        raise HTTPException(status_code=500, detail="Failed to connect to database")

    cursor = conn.cursor()
    cursor.execute('SELECT otp FROM otp_store WHERE no_hp = ? ORDER BY id DESC LIMIT 1', (data.no_hp,))
    stored_otp = cursor.fetchone()
    conn.close()

    if stored_otp and stored_otp[0] == data.otp:
        return {'message': 'OTP verified successfully'}
    else:
        raise HTTPException(status_code=400, detail="Invalid OTP")

# Endpoint untuk mendapatkan semua data dokter
@app.get('/api/dokter')
def get_all_dokter(current_user: RegisterUser = Depends(get_current_user)):
    conn = connect_db()
    if not conn:
        raise HTTPException(status_code=500, detail="Failed to connect to database")
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM dokter')
    dokter = cursor.fetchall()
    conn.close()
    return dokter

# Endpoint untuk mendapatkan detail dokter berdasarkan ID
@app.get('/api/dokter/{id_dokter}')
def get_dokter(id_dokter: int, current_user: RegisterUser = Depends(get_current_user)):
    conn = connect_db()
    if not conn:
        raise HTTPException(status_code=500, detail="Failed to connect to database")
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM dokter WHERE id_dokter = ?', (id_dokter,))
    dokter = cursor.fetchone()
    conn.close()
    
    if dokter:
        return dokter
    else:
        raise HTTPException(status_code=404, detail="Doctor not found")
    
# GET endpoint untuk mendapatkan daftar dokter berdasarkan spesialis
@app.get('/api/doctors/{spesialis}', response_model=List[str])
async def get_doctors_by_spesialis(spesialis: str, current_user: RegisterUser = Depends(get_current_user)):
    conn = connect_db()
    if not conn:
        raise HTTPException(status_code=500, detail="Failed to connect to database")
    cursor = conn.cursor()
    cursor.execute('SELECT name FROM doctors WHERE spesialis = ?', (spesialis,))
    doctors = cursor.fetchall()
    conn.close()
    return [doctor[0] for doctor in doctors]

# Endpoint untuk mengirim OTP
@app.post('/api/send_otp')
def send_otp(data: SendOTP):
    conn = connect_db()
    if not conn:
        raise HTTPException(status_code=500, detail="Failed to connect to database")
    
    # Generate OTP
    otp = randint(100000, 999999)
    no_hp = data.no_hp

    # Save OTP in the database (you might want to create an OTP table or field)
    cursor = conn.cursor()
    cursor.execute('INSERT INTO otp_store (no_hp, otp) VALUES (?, ?)', (no_hp, otp))
    conn.commit()
    conn.close()

    # Here you should send the OTP to the user's phone number
    # For the purpose of this example, we'll print it to the console
    print(f'Sending OTP {otp} to phone number {no_hp}')

    return {'message': 'OTP sent successfully'}
    
    
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
def get_all_notifikasi(current_user: RegisterUser = Depends(get_current_user)):
    conn = connect_db()
    if not conn:
        raise HTTPException(status_code=500, detail="Failed to connect to the database")
    cursor = conn.cursor()
    try:
        cursor.execute('SELECT * FROM notifikasi ORDER BY time DESC')
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

# Endpoint untuk mendapatkan semua artikel
@app.get('/api/artikel')
def get_all_artikel():
    conn = connect_db()
    if not conn:
        raise HTTPException(status_code=500, detail="Failed to connect to database")
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM artikel')
    artikel = cursor.fetchall()
    conn.close()
    return artikel

# Endpoint untuk mendapatkan detail artikel berdasarkan ID
@app.get('/api/artikel/{artikel_id}')
def get_artikel(artikel_id: int):
    conn = connect_db()
    if not conn:
        raise HTTPException(status_code=500, detail="Failed to connect to database")
    cursor = conn.cursor()
    cursor.execute('SELECT * FROM artikel WHERE id_artikel = ?', (artikel_id,))
    artikel = cursor.fetchone()
    conn.close()
    if artikel:
        return artikel
    else:
        raise HTTPException(status_code=404, detail="Artikel not found")
    
# Endpoint untuk mendapatkan daftar spesialis
@app.get('/api/spesialis')
def get_spesialis():
    conn = connect_db()
    cursor = conn.cursor()
    cursor.execute('SELECT DISTINCT spesialis FROM dokter')
    spesialis_list = cursor.fetchall()
    conn.close()
    return [spesialis[0] for spesialis in spesialis_list]


@app.post('/api/payments', status_code=201)
def create_payment(payment: Payment):
    try:
        conn = connect_db()
        cursor = conn.cursor()
        cursor.execute('INSERT INTO payment (id_payment, amount, ewallet) VALUES (?, ?, ?)', 
                       (payment.id_payment, payment.amount, payment.ewallet))
        conn.commit()
        conn.close()
        return {'message': 'Payment created successfully'}
    except Exception as e:
        print(f"Error creating payment: {e}")
        raise HTTPException(status_code=500, detail="Internal server error occurred")

@app.get('/api/payments', response_model=List[Payment])
def get_payments():
    conn = connect_db()
    if not conn:
        raise HTTPException(status_code=500, detail="Failed to connect to database")
    cursor = conn.cursor()
    try:
        cursor.execute('SELECT id_payment, amount, ewallet FROM payment')
        payments = cursor.fetchall()
    except sqlite3.Error as e:
        print(f"Error fetching payments: {e}")
        raise HTTPException(status_code=400, detail=f"Error fetching payments: {e}")
    finally:
        conn.close()
    return [Payment(id_payment=row[0], amount=row[1], ewallet=row[2]) for row in payments]
# 0--------------------------------------------------------------------------
# from fastapi import FastAPI, HTTPException, Depends
# from pydantic import BaseModel
# import mysql.connector
# from fastapi.middleware.cors import CORSMiddleware
# from random import randint
# from datetime import datetime
# from typing import List

# app = FastAPI()

# app.add_middleware(
#     CORSMiddleware,
#     allow_origins=["*"],
#     allow_credentials=True,
#     allow_methods=["POST", "OPTIONS", "GET"],
#     allow_headers=["*"],
# )

# # Model untuk data pengguna
# class RegisterUser(BaseModel):
#     nik: str
#     nama: str
#     no_hp: str
#     password: str
#     tgl_lahir: str

#     class Config:
#         orm_mode = True
#         validate_assignment = True

# # Model untuk login pengguna
# class LoginUser(BaseModel):
#     nik: str
#     password: str
    
#     class Config:
#         orm_mode = True
#         validate_assignment = True
        
# # Model untuk memeriksa NIK
# class CheckNIK(BaseModel):
#     nik: str

#     class Config:
#         orm_mode = True
#         validate_assignment = True

# # Model untuk memverifikasi OTP
# class VerifyOTP(BaseModel):
#     no_hp: str
#     otp: int

# class VerifyOTPRequest(BaseModel):
#     no_hp: str
#     otp: int

# # Model untuk mengirim OTP
# class SendOTP(BaseModel):
#     no_hp: str

# # Model untuk data dokter
# class Dokter(BaseModel):
#     id_dokter: int
#     nama_dokter: str
#     spesialis: str
#     hari_praktek: str
#     jam_praktek: str
#     rating: float
#     alumni: str
#     pengalaman: str
#     nomor_str: int
#     foto_dokter: str
    
#     class Config:
#         orm_mode = True
#         validate_assignment = True
        
# # Model untuk data notifikasi
# class Notifikasi(BaseModel):
#     id_notif: int
#     tipe_notif: int
#     title: str
#     subtitle: str
#     time: datetime
#     id_news: int
#     content: str

#     class Config:
#         orm_mode = True
#         validate_assignment = True

# # Model untuk data artikel
# class Artikel(BaseModel):
#     judul: str
#     tanggal: str
#     isi: str
#     foto: str

#     class Config:
#         orm_mode = True
#         validate_assignment = True
        
# class Payment(BaseModel):
#     id_payment: int
#     amount: int
#     ewallet: str
    
#     class Config:
#         orm_mode = True
#         validate_assignment = True

# # Fungsi untuk menghubungkan ke database MySQL
# def connect_db():
#     try:
#         conn = mysql.connector.connect(
#             host='localhost',
#             user='root',
#             password='',
#             database='db_provis'
#         )
#         return conn
#     except mysql.connector.Error as err:
#         print(f"Error: {err}")
#         return None

# # Endpoint untuk membuat pengguna baru
# @app.post('/api/users', status_code=201)
# def create_user(user: RegisterUser):
#     conn = connect_db()
#     cursor = conn.cursor()
#     cursor.execute('INSERT INTO users (nik, nama, no_hp, password, tgl_lahir) VALUES (%s, %s, %s, %s, %s)',
#                    (user.nik, user.nama, user.no_hp, user.password, user.tgl_lahir))
#     conn.commit()
#     conn.close()
#     return {'message': 'User created successfully'}

# # Endpoint untuk mendapatkan semua pengguna
# @app.get('/api/users')
# def get_all_users():
#     conn = connect_db()
#     if not conn:
#         raise HTTPException(status_code=500, detail="Failed to connect to database")
#     cursor = conn.cursor()
#     cursor.execute('SELECT * FROM users')
#     users = cursor.fetchall()
#     conn.close()
#     return users

# # Endpoint untuk mendapatkan detail pengguna berdasarkan ID
# @app.get('/api/users/{user_id}')
# def get_user(user_id: int):
#     conn = connect_db()
#     if not conn:
#         raise HTTPException(status_code=500, detail="Failed to connect to database")
#     cursor = conn.cursor()
#     cursor.execute('SELECT * FROM users WHERE id = %s', (user_id,))
#     user = cursor.fetchone()
#     conn.close()
#     if user:
#         return user
#     else:
#         raise HTTPException(status_code=404, detail="User not found")

# # Endpoint untuk login
# @app.post('/api/login')
# def login(user: LoginUser):
#     try:
#         # Proses autentikasi di sini
#         conn = connect_db()
#         if not conn:
#             raise HTTPException(status_code=500, detail="Failed to connect to database")
#         cursor = conn.cursor()
#         cursor.execute('SELECT * FROM users WHERE nik = %s AND password = %s', (user.nik, user.password))
#         print(user.dict())  # Cetak entitas untuk memeriksa formatnya
#         result = cursor.fetchone()
#         conn.close()

#         if result:
#             return {'message': 'Login successful'}
#         else:
#             raise HTTPException(status_code=401, detail="Invalid credentials")
#     except Exception as e:
#         print(f"Error processing login request: {e}")
#         raise HTTPException(status_code=500, detail="Internal server error")
    
# # Endpoint untuk memeriksa apakah NIK sudah digunakan
# @app.post('/api/check_nik')
# def check_nik(nik: CheckNIK):
#     if not nik.nik:
#         raise HTTPException(status_code=400, detail="NIK cannot be null or empty")
#     conn = connect_db()
#     if not conn:
#         raise HTTPException(status_code=500, detail="Failed to connect to database")
#     cursor = conn.cursor()
#     cursor.execute('SELECT * FROM users WHERE nik = %s', (nik.nik,))
#     user = cursor.fetchone()
#     conn.close()
#     if user:
#         raise HTTPException(status_code=400, detail="NIK already used")
#     else:
#         return {'message': 'NIK is available'}
    
# # Endpoint untuk memverifikasi OTP
# @app.post('/api/verify_otp')
# async def verify_otp(data: VerifyOTP):
#     conn = connect_db()
#     if not conn:
#         raise HTTPException(status_code=500, detail="Failed to connect to database")

#     cursor = conn.cursor()
#     cursor.execute('SELECT otp FROM otp_store WHERE no_hp = %s ORDER BY id DESC LIMIT 1', (data.no_hp,))
#     stored_otp = cursor.fetchone()
#     conn.close()

#     if stored_otp and stored_otp[0] == data.otp:
#         return {'message': 'OTP verified successfully'}
#     else:
#         raise HTTPException(status_code=400, detail="Invalid OTP")

# # Endpoint untuk mendapatkan semua data dokter
# @app.get('/api/dokter')
# def get_all_dokter():
#     conn = connect_db()
#     if not conn:
#         raise HTTPException(status_code=500, detail="Failed to connect to database")
#     cursor = conn.cursor()
#     cursor.execute('SELECT * FROM dokter')
#     dokter = cursor.fetchall()
#     conn.close()
#     return dokter

# # Endpoint untuk mendapatkan detail dokter berdasarkan ID
# @app.get('/api/dokter/{id_dokter}')
# def get_dokter(id_dokter: int):
#     conn = connect_db()
#     if not conn:
#         raise HTTPException(status_code=500, detail="Failed to connect to database")
#     cursor = conn.cursor()
#     cursor.execute('SELECT * FROM dokter WHERE id_dokter = %s', (id_dokter,))
#     dokter = cursor.fetchone()
#     conn.close()
    
#     if dokter:
#         return dokter
#     else:
#         raise HTTPException(status_code=404, detail="Doctor not found")
    
# # GET endpoint untuk mendapatkan daftar dokter berdasarkan spesialis
# @app.get('/api/doctors/{spesialis}', response_model=List[str])
# async def get_doctors_by_spesialis(spesialis: str):
#     conn = connect_db()
#     if not conn:
#         raise HTTPException(status_code=500, detail="Failed to connect to database")
#     cursor = conn.cursor()
#     cursor.execute('SELECT name FROM doctors WHERE spesialis = %s', (spesialis,))
#     doctors = cursor.fetchall()
#     conn.close()
#     return [doctor[0] for doctor in doctors]

# # Endpoint untuk mengirim OTP
# @app.post('/api/send_otp')
# def send_otp(data: SendOTP):
#     conn = connect_db()
#     if not conn:
#         raise HTTPException(status_code=500, detail="Failed to connect to database")
    
#     # Generate OTP
#     otp = randint(100000, 999999)
#     no_hp = data.no_hp

#     # Save OTP in the database (you might want to create an OTP table or field)
#     cursor = conn.cursor()
#     cursor.execute('INSERT INTO otp_store (no_hp, otp) VALUES (%s, %s)', (no_hp, otp))
#     conn.commit()
#     conn.close()

#     # Here you should send the OTP to the user's phone number
#     # For the purpose of this example, we'll print it to the console
#     print(f'Sending OTP {otp} to phone number {no_hp}')

#     return {'message': 'OTP sent successfully'}
    
    
# # Endpoint untuk membuat notifikasi baru
# @app.post('/api/notifikasi', status_code=201)
# def create_notifikasi(notifikasi: Notifikasi):
#     conn = connect_db()
#     cursor = conn.cursor()
#     cursor.execute('INSERT INTO notifikasi (tipe_notif, title, subtitle, time, id_news, content) VALUES (%s, %s, %s, %s, %s, %s)',
#                    (notifikasi.tipe_notif, notifikasi.title, notifikasi.subtitle, notifikasi.time.isoformat(), notifikasi.id_news, notifikasi.content))
#     conn.commit()
#     conn.close()
#     return {'message': 'Notifikasi created successfully'}

# # Endpoint untuk mendapatkan detail notifikasi berdasarkan ID
# @app.get('/api/notifikasi', response_model=List[Notifikasi])
# def get_all_notifikasi():
#     conn = connect_db()
#     if not conn:
#         raise HTTPException(status_code=500, detail="Failed to connect to the database")
#     cursor = conn.cursor()
#     try:
#         cursor.execute('SELECT * FROM notifikasi ORDER BY time DESC')
#         rows = cursor.fetchall()
#         if not rows:
#             raise HTTPException(status_code=404, detail="No notifikasi found")
        
#         notifikasi_list = []
#         for row in rows:
#             notifikasi = Notifikasi(
#                 id_notif=row[0],
#                 tipe_notif=row[1],
#                 title=row[2],
#                 subtitle=row[3],
#                 time=datetime.fromisoformat(row[4]),
#                 id_news=row[5],
#                 content=row[6]
#             )
#             notifikasi_list.append(notifikasi)
#     except Exception as e:
#         conn.close()
#         print(f"Error fetching notifikasi: {e}")
#         raise HTTPException(status_code=500, detail="Failed to fetch notifikasi")
#     conn.close()
#     return notifikasi_list

# # Endpoint untuk mengupdate notifikasi berdasarkan ID
# @app.put('/api/notifikasi/{id_notif}', response_model=Notifikasi)
# def update_notifikasi(id_notif: int, notifikasi: Notifikasi):
#     conn = connect_db()
#     cursor = conn.cursor()
#     cursor.execute('UPDATE notifikasi SET tipe_notif = %s, title = %s, subtitle = %s, time = %s, id_news = %s, content = %s WHERE id_notif = %s',
#                    (notifikasi.tipe_notif, notifikasi.title, notifikasi.subtitle, notifikasi.time.isoformat(), notifikasi.id_news, notifikasi.content, id_notif))
#     conn.commit()
#     conn.close()
#     return notifikasi

# # Endpoint untuk menghapus notifikasi berdasarkan ID
# @app.delete('/api/notifikasi/{id_notif}', status_code=204)
# def delete_notifikasi(id_notif: int):
#     conn = connect_db()
#     cursor = conn.cursor()
#     cursor.execute('DELETE FROM notifikasi WHERE id_notif = %s', (id_notif,))
#     conn.commit()
#     conn.close()
#     return {'message': 'Notifikasi deleted successfully'}

# # Endpoint untuk mendapatkan semua artikel
# @app.get('/api/artikel')
# def get_all_artikel():
#     conn = connect_db()
#     if not conn:
#         raise HTTPException(status_code=500, detail="Failed to connect to database")
#     cursor = conn.cursor()
#     cursor.execute('SELECT * FROM artikel')
#     artikel = cursor.fetchall()
#     conn.close()
#     return artikel

# # Endpoint untuk mendapatkan detail artikel berdasarkan ID
# @app.get('/api/artikel/{artikel_id}')
# def get_artikel(artikel_id: int):
#     conn = connect_db()
#     if not conn:
#         raise HTTPException(status_code=500, detail="Failed to connect to database")
#     cursor = conn.cursor()
#     cursor.execute('SELECT * FROM artikel WHERE id_artikel = %s', (artikel_id,))
#     artikel = cursor.fetchone()
#     conn.close()
#     if artikel:
#         return artikel
#     else:
#         raise HTTPException(status_code=404, detail="Artikel not found")
    
# # Endpoint untuk mendapatkan daftar spesialis
# @app.get('/api/spesialis')
# def get_spesialis():
#     conn = connect_db()
#     cursor = conn.cursor()
#     cursor.execute('SELECT DISTINCT spesialis FROM dokter')
#     spesialis_list = cursor.fetchall()
#     conn.close()
#     return [spesialis[0] for spesialis in spesialis_list]


# @app.post('/api/payments', status_code=201)
# def create_payment(payment: Payment):
#     try:
#         conn = connect_db()
#         cursor = conn.cursor()
#         cursor.execute('INSERT INTO payment (id_payment, amount, ewallet) VALUES (%s, %s, %s)', 
#                        (payment.id_payment, payment.amount, payment.ewallet))
#         conn.commit()
#         conn.close()
#         return {'message': 'Payment created successfully'}
#     except Exception as e:
#         print(f"Error creating payment: {e}")
#         raise HTTPException(status_code=500, detail="Internal server error occurred")

# @app.get('/api/payments', response_model=List[Payment])
# def get_payments():
#     conn = connect_db()
#     if not conn:
#         raise HTTPException(status_code=500, detail="Failed to connect to database")
#     cursor = conn.cursor()
#     try:
#         cursor.execute('SELECT id_payment, amount, ewallet FROM payment')
#         payments = cursor.fetchall()
#     except mysql.connector.Error as e:
#         print(f"Error fetching payments: {e}")
#         raise HTTPException(status_code=400, detail=f"Error fetching payments: {e}")
#     finally:
#         conn.close()
#     return [Payment(id_payment=row[0], amount=row[1], ewallet=row[2]) for row in payments]
