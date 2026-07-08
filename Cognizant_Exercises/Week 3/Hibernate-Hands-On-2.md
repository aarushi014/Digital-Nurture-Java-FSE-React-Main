# Hands-on 2 – Hibernate XML Configuration

## Objective

The objective of this hands-on is to understand how Hibernate performs Object Relational Mapping (ORM) using XML configuration files and executes CRUD operations with Hibernate APIs.

---

## Technologies Used

- Java
- Hibernate ORM
- MySQL
- Maven
- Eclipse IDE

---

## Project Structure

```
src
├── main
│   ├── java
│   │   ├── model
│   │   ├── dao
│   │   └── App.java
│   └── resources
│       ├── hibernate.cfg.xml
│       └── Employee.hbm.xml
```

---

## Hibernate Architecture

```
Application
      │
      ▼
 SessionFactory
      │
      ▼
   Session
      │
      ▼
 Transaction
      │
      ▼
   MySQL Database
```

---

## Hibernate Components

### SessionFactory
- Created once during application startup.
- Reads `hibernate.cfg.xml`.
- Creates Session objects.

### Session
- Represents connection with the database.
- Used for CRUD operations.

### Transaction
- Ensures data consistency.
- Supports Commit and Rollback.

---

## Operations Performed

- Create Employee
- Read Employee
- Update Employee
- Delete Employee

---

## Hibernate Methods Used

| Method | Description |
|---------|-------------|
| openSession() | Opens database session |
| beginTransaction() | Starts transaction |
| save() | Inserts record |
| get() | Fetches record |
| createQuery().list() | Retrieves all records |
| delete() | Deletes record |
| commit() | Saves transaction |
| rollback() | Reverts transaction |

---

## XML Configuration Files

### hibernate.cfg.xml

Contains:

- Database URL
- Username
- Password
- Driver
- Hibernate Dialect
- Mapping File

### Employee.hbm.xml

Contains mapping between Java class and database table.

---

## Learning Outcome

After completing this hands-on, you will understand:

- Hibernate XML configuration
- Object Relational Mapping
- SessionFactory lifecycle
- CRUD operations using Hibernate
- Transaction management

---

## Author

**Aarushi Singh**