/* employees (insert once) */
INSERT INTO employees(id,name,manager)
SELECT 1,'Bob','alice'
 WHERE (SELECT COUNT(*) FROM employees)=0;
INSERT INTO employees(id,name,manager) VALUES
 (2,'Charlie','alice'),
 (3,'David','alice'),
 (4,'Eve','alice'),
 (5,'Frank','alice'),
 (6,'Grace','alice'),
 (7,'Heidi','alice'),
 (8,'Ivan','alice'),
 (9,'Judy','alice'),
 (10,'Mallory','alice'),
 (11,'Nancy','bob'),
 (12,'Olivia','bob'),
 (13,'Peter','bob'),
 (14,'Quinn','bob'),
 (15,'Robert','bob'),
 (16,'Steve','carson'),
 (17,'Trudy','carson'),
 (18,'Ursula','carson'),
 (19,'Victor','carson'),
 (20,'Wendy','carson');

/* payroll (insert once) */
INSERT INTO payroll(id,emp_id,salary,bank_account)
SELECT 1,1,95000,'US12-ALICE-0001'
 WHERE (SELECT COUNT(*) FROM payroll)=0;
INSERT INTO payroll(id,emp_id,salary,bank_account) VALUES
 (2,2,88000,'US12-ALICE-0002'),
 (3,3,87000,'US12-ALICE-0003'),
 (4,4,86000,'US12-ALICE-0004'),
 (5,5,85000,'US12-ALICE-0005'),
 (6,6,84000,'US12-ALICE-0006'),
 (7,7,83000,'US12-ALICE-0007'),
 (8,8,82000,'US12-ALICE-0008'),
 (9,9,81000,'US12-ALICE-0009'),
 (10,10,80000,'US12-ALICE-0010'),
 (11,11,78000,'US12-BOB-0011'),
 (12,12,77000,'US12-BOB-0012'),
 (13,13,76000,'US12-BOB-0013'),
 (14,14,75000,'US12-BOB-0014'),
 (15,15,74000,'US12-BOB-0015'),
 (16,16,72000,'US12-CAR-0016'),
 (17,17,71000,'US12-CAR-0017'),
 (18,18,70000,'US12-CAR-0018'),
 (19,19,69000,'US12-CAR-0019'),
 (20,20,68000,'US12-CAR-0020');

/* secrets (insert once) */
INSERT INTO secrets(id,title,secret_data)
SELECT 1,'Master API key','XJ92-SECRET-KEY-ALPHA'
 WHERE (SELECT COUNT(*) FROM secrets)=0;
INSERT INTO secrets(id,title,secret_data) VALUES
 (2,'Prod DB creds','postgres://admin:supersecret@prod-db'),
 (3,'JWT signing key','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9…'),
 (4,'S3 backup bucket','s3://backup-bucket-2025'),
 (5,'Support VPN pw','SupPort!2025');