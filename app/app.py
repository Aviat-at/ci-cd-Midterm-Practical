from flask import Flask, jsonify
import mysql.connector

app = Flask(__name__)

# Database Configuration
db_config = {
    "host": "mysql-db",  # Container name in docker-compose
    "user": "root",
    "password": "rootpassword",
    "database": "employees"
}

def get_db_connection():
    return mysql.connector.connect(**db_config)

@app.route('/')
def home():
    return "Flask App Running!"

@app.route('/employees')
def get_employees():
    try:
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT emp_no, first_name, last_name, gender, hire_date FROM employees LIMIT 10")
        employees = cursor.fetchall()
        cursor.close()
        conn.close()
        return jsonify(employees)
    except Exception as e:
        return jsonify({"error": str(e)})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
