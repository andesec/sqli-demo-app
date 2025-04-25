# SQLi Demo App (Gradle + Spring Boot)
A java spring boot application demonstrating the SQL Injection vulnerability and how to fix it.

Simple one-container lab to demonstrate SQL Injection and its fix.

## Run locally (gradle wrapper)

```bash
./gradlew bootRun            # Hot-reload dev mode
```

## Build + run in Docker
```bash
docker compose up --build
open http://localhost:8080
```

## Toggle vulnerable / fixed
Edit EmployeeController.java:
```java
// return repo.findInsecure(...);      // ✗ bypassable
// return repo.findSecure(...);        // ✓ protected
```