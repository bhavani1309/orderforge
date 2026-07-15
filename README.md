# OrderForge – Containerized Backend Stress Testing Framework

OrderForge is a full-stack order management application built using **Spring Boot** and **PostgreSQL**. The project is containerized with **Docker** and **Docker Compose**, enabling reproducible deployments across environments. To study backend performance under infrastructure stress, CPU-intensive workloads were simulated using **stress-ng**, and the application's response was analyzed.

---

## Features

- RESTful backend developed using Spring Boot
- PostgreSQL database integration
- Dockerized backend and frontend
- Multi-container deployment using Docker Compose
- Layered architecture (Controller, Service, Repository)
- Health check endpoint
- CPU stress simulation using stress-ng
- Performance analysis under system load

---

## Tech Stack

| Category | Technologies |
|----------|--------------|
| Frontend | HTML, CSS, JavaScript |
| Backend | Java, Spring Boot |
| Database | PostgreSQL |
| Containerization | Docker, Docker Compose |
| Performance Testing | stress-ng |
| Version Control | Git, GitHub |

---

## Project Structure

```
orderforge/
│
├── orderforge-ui/              
│
├── src/
│   ├── main/
│   │   ├── java/com/orderforge/
│   │   │   ├── controller/
│   │   │   ├── service/
│   │   │   ├── repository/
│   │   │   ├── entity/
│   │   │   ├── dto/
│   │   │   ├── config/
│   │   │   └── OrderforgeApplication.java
│   │   │
│   │   └── resources/
│   │
│   └── test/
│
├── Dockerfile
├── docker-compose.yml
├── pom.xml
├── orderforge_schema.sql
└── README.md
```

---

## Architecture

```
                    Frontend
                       │
                       ▼
             Spring Boot REST API
                       │
                       ▼
                PostgreSQL Database

             ┌─────────────────────┐
             │ Docker Compose      │
             │                     │
             │ Backend Container   │
             │ Database Container  │
             └─────────────────────┘

                       │
                       ▼
             stress-ng CPU Workload
                       │
                       ▼
          API Latency & Performance Analysis
```

---

## Problem Statement

Modern applications often experience performance degradation when infrastructure resources become constrained. The objective of this project was to understand how CPU-intensive workloads affect backend API performance and database responsiveness.

---

## Implementation

The application was developed as a Spring Boot REST service connected to a PostgreSQL database. The Docker and Docker Compose simplify deployment by containerizing the application components.

To evaluate system behavior under load, **stress-ng** was used to generate controlled CPU stress. API response times and backend behavior were observed before and during stress to study the effects of resource contention.

---

## Technical Challenge

One of the main challenges was identifying the reason behind increased API response times during CPU stress.

Instead of assuming the issue originated from the application, different scenarios were tested under varying CPU loads. By comparing application behavior under normal and stressed environments, it became easier to understand how limited CPU resources affected backend performance and response latency.

This project improved my understanding of backend systems, Docker-based deployments, and performance analysis under constrained environments.

---

## Getting Started

### Prerequisites

- Java 17+
- Docker
- Docker Compose
- PostgreSQL

---

### Clone Repository

```bash
git clone https://github.com/bhavani1309/orderforge.git
cd orderforge
```

---

### Build Backend

```bash
mvn clean install
```

---

### Run Using Docker Compose

```bash
docker-compose up --build
```

---

### Stop Containers

```bash
docker-compose down
```

---

## API

Example endpoints:

| Method | Endpoint | Description |
|---------|----------|-------------|
| GET | /health | Health Check |
| GET | /orders | Retrieve Orders |
| POST | /orders | Create Order |
| PUT | /orders/{id} | Update Order |
| DELETE | /orders/{id} | Delete Order |

> *Endpoints may vary depending on the implemented controllers.*

---

## Performance Testing

CPU stress was generated using **stress-ng** to simulate high system load.

Example:

```bash
stress-ng --cpu 4 --timeout 60s
```

During testing, the following observations were made:

- Increased API response time under CPU contention
- Higher request latency compared to normal execution
- Stable application behavior despite resource constraints

---

## Future Improvements

- Kubernetes deployment
- Prometheus metrics collection
- Grafana dashboards
- CI/CD pipeline using GitHub Actions
- Automated load testing using Apache JMeter
- Horizontal scaling of backend services

---

## Learning Outcomes

Through this project, I gained hands-on experience with:

- Spring Boot application development
- REST API design
- PostgreSQL integration
- Docker containerization
- Docker Compose
- Backend performance analysis
- CPU stress testing
- Debugging distributed applications

---

## Author

**Bhavani Thantanapalli**

---

## License

This project is intended for educational and learning purposes.
