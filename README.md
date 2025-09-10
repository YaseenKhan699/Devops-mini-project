# Devops-mini-project-Day-2
# 🚀 To-Do App (Dockerized)

## Project Overview
This is a simple To-Do web app containerized with Docker.  
The image is hosted on **Docker Hub**:  
👉 [yaseenkhan699/todo-app](https://hub.docker.com/r/yaseenkhan699/todo-app)

---

## Steps I Practiced
1. Built Docker image locally  
2. Tagged and pushed it to Docker Hub  
3. Pulled the image back from Docker Hub  
4. Ran the app locally → accessible on `http://localhost:3000`

---

## Screenshots
### 1. Build & Push to Docker Hub
![Build & Push](./screenshots/build-push.png)
<img width="1280" height="1024" alt="Screenshot 2025-09-09 at 1 55 49 PM" src="https://github.com/user-attachments/assets/1567f13f-3256-4904-b40e-2aeb361d2714" />


### 2. Docker Hub Repository
![Docker Hub Repo](./screenshots/dockerhub.png)
<img width="1280" height="1024" alt="Screenshot 2025-09-09 at 1 59 07 PM" src="https://github.com/user-attachments/assets/da4a06cf-a4da-4feb-befc-8cb56007ef48" />

### 3. Running App from Pulled Image
![App Running](./screenshots/app-running.png)
<img width="1280" height="1024" alt="Screenshot 2025-09-09 at 2 04 03 PM" src="https://github.com/user-attachments/assets/e35e688e-16db-4b55-9b44-409a54ce392e" />

---

## Run the App Yourself
```bash
docker pull yaseenkhan699/todo-app:latest
docker run -p 3000:3000 yaseenkhan699/todo-app:latest

---


Day 3 – Multi-Container Setup with Docker Compose (Todo-App + MySQL)

On Day 3, I extended my todo-app by replacing the SQLite database with MySQL and running both services together using Docker Compose.

🔹 Steps I Followed

1. Created a docker-compose.yml file:

version: '3.8'

services:
  todo-app:
    build: .
    ports:
      - "3000:3000"
    environment:
      - DB_HOST=db
      - DB_USER=root
      - DB_PASSWORD=example
      - DB_NAME=tododb
    depends_on:
      - db

  db:
    image: mysql:8.0
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: example
      MYSQL_DATABASE: tododb
    volumes:
      - db_data:/var/lib/mysql

volumes:
  db_data:


2. Started both containers:

docker-compose up -d


3. Verified connectivity by entering the MySQL container:

docker exec -it project-db-1 mysql -u root -p


4. Checked tables and inserted data:

SHOW TABLES;
SELECT * FROM todo_items;


Screenshot – MySQL Query Output
<img width="1280" height="1024" alt="Screenshot 2025-09-10 at 2 18 30 PM" src="https://github.com/user-attachments/assets/f2990140-1c5d-4129-88ad-dcc0b1a786b7" />

5. Tested persistence:
Tasks stayed even after restarting containers (thanks to volumes).


