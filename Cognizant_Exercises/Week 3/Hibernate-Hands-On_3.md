# Hands-on 3 – Hibernate Annotation Configuration

## Objective

The objective of this hands-on is to understand Hibernate configuration using Java annotations instead of XML mapping files.

---

## Technologies Used

- Java
- Hibernate ORM
- MySQL
- Maven
- Eclipse IDE

---

## Annotations Used

| Annotation | Purpose |
|------------|----------|
| @Entity | Marks a Java class as an Entity |
| @Table | Maps class to database table |
| @Id | Specifies Primary Key |
| @GeneratedValue | Auto generates primary key |
| @Column | Maps class field to table column |

---

## Entity Example

```java
@Entity
@Table(name="employee")
public class Employee {

    @Id
    @GeneratedValue
    private int id;

    @Column(name="name")
    private String name;
}
```

---

## Hibernate Configuration

The project uses **hibernate.cfg.xml** to configure:

- JDBC Driver
- Connection URL
- Username
- Password
- Dialect
- Entity Mapping

---

## Project Flow

```
Employee Object
        │
        ▼
Hibernate Annotations
        │
        ▼
Hibernate ORM
        │
        ▼
MySQL Database
```

---

## CRUD Operations

- Save Employee
- Fetch Employee
- Update Employee
- Delete Employee

---

## Advantages of Annotation Configuration

- Less XML
- Easy to maintain
- Better readability
- Faster development
- Annotation-based mapping

---

## Learning Outcome

After completing this hands-on, you will understand:

- Hibernate Annotation Mapping
- Entity Classes
- Hibernate Configuration
- CRUD Operations
- Annotation-based ORM

---

## Author

**Aarushi Singh**