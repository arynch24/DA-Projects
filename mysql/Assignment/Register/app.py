from flask import Flask, render_template, request, redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:ArynCh@1286@localhost3306/registration_db'
db = SQLAlchemy(app)

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    student_name = db.Column(db.String(255), nullable=False)
    father_name = db.Column(db.String(255), nullable=False)
    mother_name = db.Column(db.String(255), nullable=False)
    phone_number = db.Column(db.String(15), nullable=False)
    email = db.Column(db.String(255), nullable=False)
    date_of_birth = db.Column(db.Date, nullable=False)
    address = db.Column(db.String(255), nullable=False)
    blood_group = db.Column(db.String(10), nullable=False)
    department = db.Column(db.String(50), nullable=False)
    course = db.Column(db.String(50), nullable=False)
    password = db.Column(db.String(255), nullable=False)

@app.route('/', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        student_name = request.form['student_name']
        father_name = request.form['father_name']
        mother_name = request.form['mother_name']
        phone_number = request.form['phone_number']
        email = request.form['email']
        date_of_birth = datetime.strptime(request.form['date_of_birth'], '%Y-%m-%d').date()
        address = request.form['address']
        blood_group = request.form['blood_group']
        department = request.form['department']
        course = request.form['course']
        password = request.form['password']
        
        new_user = User(student_name=student_name, father_name=father_name, mother_name=mother_name,
                        phone_number=phone_number, email=email, date_of_birth=date_of_birth,
                        address=address, blood_group=blood_group, department=department,
                        course=course, password=password)
        db.session.add(new_user)
        db.session.commit()
        return redirect('/')
    return render_template('register.html')

if __name__ == '__main__':
    app.run(debug=True)
