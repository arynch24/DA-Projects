from flask import Flask
from flask_mysqldb import MySQL

def get_db_connection():
    conn = mysql.connector.connect(
        host='localhost',
        user='root',
        password='1nc12ec049',
        database='registration_db'
    )
    return conn