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

---

Devops-mini-project-Day-4
🚀 To-Do App (CI/CD with GitHub Actions & Docker)
Project Overview

This project extends the To-Do app with CI/CD automation using GitHub Actions.
The pipeline builds the Docker image, runs integration tests with MySQL, and pushes the image to Docker Hub:
👉 yaseenkhan699/todo-app

Steps I Practiced

Created .github/workflows/docker-ci.yml for CI/CD

Added GitHub Secrets: DOCKER_USERNAME & DOCKER_PASSWORD

Built and pushed Docker image automatically on every push to master

Ran integration tests inside CI:

Started MySQL container

Connected app container to MySQL using Docker network

Verified app container started and logs showed successful DB connection

Fixed issues:

Initial workflow failed due to missing secrets → added both secrets correctly

App container couldn’t connect via localhost → used Docker network for CI containers

Verified workflow success → image built, tested, and pushed to Docker Hub

Confirmed local container runs correctly on port 3000

Screenshots
1. Workflow File
/Users/applemacbookm1/Desktop/Screenshot 2025-09-11 at 4.00.30 PM.png

2. GitHub Actions Build & Test Success


/Users/applemacbookm1/Desktop/Screenshot 2025-09-11 at 4.00.46 PM.pngess

3. Docker Hub Image


/Users/applemacbookm1/Desktop/Screenshot 2025-09-11 at 4.01.05 PM.png


