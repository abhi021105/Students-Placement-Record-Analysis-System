# 🎓 Student Placement Database System

A relational database system built with MySQL to manage and track student placement records, including department details, company information, and placement outcomes.

---

## 📁 Database Overview

**Database Name:** `StudentPlacement`

This system tracks:
- Academic departments and their students
- Companies participating in campus placements
- Placement records linking students to companies and job roles

---

## 🗂️ Schema

### Tables

| Table | Description |
|---|---|
| `Department` | Stores academic department details |
| `Student` | Stores student academic and personal info |
| `Company` | Stores participating company details |
| `Placement` | Stores placement outcomes (student ↔ company) |

### Entity Relationship

```
Department ──< Student >── Placement >── Company
```

- One **Department** has many **Students**
- One **Student** has one **Placement**
- One **Company** has many **Placements**

---

## 📋 Table Definitions

### Department
| Column | Type | Constraint |
|---|---|---|
| Department_ID | INT | PRIMARY KEY |
| Department_Name | VARCHAR(50) | NOT NULL |

### Student
| Column | Type | Constraint |
|---|---|---|
| Student_ID | INT | PRIMARY KEY |
| Student_Name | VARCHAR(50) | NOT NULL |
| Department_ID | INT | FOREIGN KEY → Department |
| Course | VARCHAR(50) | |
| Year_Of_Study | INT | |
| CGPA | DECIMAL(3,2) | |

### Company
| Column | Type | Constraint |
|---|---|---|
| Company_ID | INT | PRIMARY KEY |
| Company_Name | VARCHAR(50) | NOT NULL |
| Industry_Type | VARCHAR(50) | |
| Location | VARCHAR(50) | |

### Placement
| Column | Type | Constraint |
|---|---|---|
| Placement_ID | INT | PRIMARY KEY |
| Student_ID | INT | FOREIGN KEY → Student |
| Company_ID | INT | FOREIGN KEY → Company |
| Job_Role | VARCHAR(50) | |
| Salary_Package | DECIMAL(10,2) | |
| Placement_Date | DATE | |

---

## 📦 Sample Data

### Departments (5 Records)
| ID | Name |
|---|---|
| 1 | Computer Science |
| 2 | Information Technology |
| 3 | Electronics |
| 4 | Mechanical |
| 5 | Civil |

### Students (5 Records)
| ID | Name | Department | CGPA |
|---|---|---|---|
| 101 | Rahul Sharma | Computer Science | 8.20 |
| 102 | Anita Verma | Information Technology | 8.70 |
| 103 | Suresh Kumar | Electronics | 7.80 |
| 104 | Neha Singh | Computer Science | 9.10 |
| 105 | Amit Patel | Information Technology | 8.00 |

### Companies (5 Records)
| ID | Name | Industry | Location |
|---|---|---|---|
| 201 | TCS | IT Services | Bangalore |
| 202 | Infosys | IT Services | Pune |
| 203 | Wipro | IT Services | Hyderabad |
| 204 | Accenture | Consulting | Mumbai |
| 205 | Cognizant | IT Services | Chennai |

### Placements (5 Records)
| Student | Company | Role | Package (₹) | Date |
|---|---|---|---|---|
| Rahul Sharma | TCS | Software Engineer | 4,50,000 | 2024-01-10 |
| Anita Verma | Infosys | System Analyst | 5,00,000 | 2024-01-15 |
| Suresh Kumar | Wipro | Programmer Analyst | 4,20,000 | 2024-01-20 |
| Neha Singh | Accenture | Associate Developer | 6,00,000 | 2024-01-25 |
| Amit Patel | Cognizant | Junior Engineer | 4,80,000 | 2024-01-30 |

---

## 🔍 Queries Included

### Basic Retrieval
Fetches all placed students with their company, job role, and salary using `JOIN` across all three tables.

### Aggregation with GROUP BY
Counts the number of students per department.

### Filtering with HAVING
Lists departments that have more than one student enrolled.

### Subquery
Retrieves names of students whose salary package exceeds ₹4,50,000.

---

## 👁️ View

**`Placement_View`** — A virtual table combining student names, company names, job roles, and salary packages for quick reporting without writing repeated JOIN queries.

```sql
SELECT * FROM Placement_View;
```

---

## 🚀 How to Run

1. Open your MySQL client (MySQL Workbench, CLI, etc.)
2. Run the full SQL script in order:
   - Create database & tables
   - Insert sample data
   - Execute queries
   - Create the view
3. Query the `Placement_View` for a consolidated report

```sql
USE StudentPlacement;
SELECT * FROM Placement_View;
```

---

## 🛠️ Tech Stack

- **Database:** MySQL
- **Concepts Used:** DDL, DML, JOINs, Subqueries, GROUP BY, HAVING, Views, Foreign Keys
