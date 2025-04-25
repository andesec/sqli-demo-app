# sqli-sample-app
A java spring boot application demonstrating the SQL Injection vulnerability and how to fix it.

# Employee-Viewer – SQL Injection Lab (Spring Boot + SQLite)

A one-container demo that lets you:

* Bypass authentication with a classic **' OR 1=1 --** payload
* Switch to a **prepared-statement** fix and prove the attack fails
* Dump extra “sensitive” tables (`payroll`, `secrets`) with **sqlmap**

---

## 1 Run

```bash
docker compose up --build        # first build (~1 min)
# open http://localhost:8080