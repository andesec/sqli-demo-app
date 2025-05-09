CREATE TABLE IF NOT EXISTS employees(
  id      INTEGER PRIMARY KEY,
  name    TEXT NOT NULL,
  manager TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS payroll(
  id INTEGER PRIMARY KEY,
  emp_id INTEGER UNIQUE,
  salary INTEGER NOT NULL,
  bank_account TEXT NOT NULL,
  FOREIGN KEY(emp_id) REFERENCES employees(id)
);

CREATE TABLE IF NOT EXISTS secrets(
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  secret_data TEXT NOT NULL
);