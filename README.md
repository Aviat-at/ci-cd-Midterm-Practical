# Flask + MySQL Dockerized Application

This project is a **Flask API** connected to a **MySQL database**, fully containerized using **Docker Compose**. It includes the **Employees database** as sample data.

## 🚀 Features
- Flask API with MySQL database
- MySQL database preloaded with the Employees dataset
- Runs inside **Docker containers** using `docker-compose`
- Automatically initializes the database on first run
- Health check to ensure MySQL starts before Flask

## 📦 Project Structure
```
app_1/
│── app/                     # Flask App
│   ├── app.py               # Flask application file
│   ├── requirements.txt      # Python dependencies
│   ├── Dockerfile            # Flask Docker configuration
│── db/                       # Database-related files
│   ├── init.sql              # Initial SQL setup
│── test_db/                   # Employees database dump
│   ├── employees.sql         # Main dataset for MySQL
│── init-script.sh            # MySQL initialization script
│── docker-compose.yml        # Docker Compose configuration
│── README.md                 # Project documentation
│── LICENSE                   # MIT License
```

## 🛠️ **Installation & Setup**
### 1️⃣ Clone this repository
```sh
git clone https://github.com/your-username/your-repo.git
cd your-repo
```

### 2️⃣ Build and Run the Containers
```sh
docker-compose up --build
```
This will:
- Start **MySQL**
- Load the **Employees database**
- Start **Flask API**

### 3️⃣ Verify the Setup
✅ Check running containers:
```sh
docker ps
```

✅ Connect to MySQL:
```sh
docker exec -it mysql-db mysql -u root -p -e "USE employees; SHOW TABLES;"
```

✅ Test API:
```sh
curl http://localhost:5000/employees
```
or visit [http://localhost:5000/employees](http://localhost:5000/employees) in your browser.

## 🛠 **Development**
If you need to modify the Flask API:
1. Edit `app/app.py`
2. Rebuild:
   ```sh
   docker-compose down
   docker-compose up --build
   ```

## 📝 **API Endpoints**
| Endpoint         | Method | Description |
|-----------------|--------|-------------|
| `/`             | GET    | Check if Flask is running |
| `/employees`    | GET    | Fetch employee data |

## 🔥 **Troubleshooting**
### ❌ MySQL is stuck in a loop
Run:
```sh
docker logs mysql-db
```
If needed, reset everything:
```sh
docker-compose down -v
docker-compose up --build
```

### ❌ API is not working
Check logs:
```sh
docker logs flask-app
```

## 📝 **License**
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

### **🔗 Contributing**
Feel free to submit **issues** and **pull requests**. Contributions are welcome! 🎉
