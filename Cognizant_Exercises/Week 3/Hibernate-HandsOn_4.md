# Hands-on 4 – Difference Between JPA, Hibernate and Spring Data JPA

## Objective

The objective of this hands-on is to understand the relationship and differences between JPA, Hibernate, and Spring Data JPA.

---

## Architecture

```
Application
      │
      ▼
Spring Data JPA
      │
      ▼
JPA Specification
      │
      ▼
Hibernate
      │
      ▼
MySQL Database
```

---

## Comparison

| Feature | JPA | Hibernate | Spring Data JPA |
|----------|-----|-----------|-----------------|
| Type | Specification | ORM Framework | Spring Module |
| Implementation | ❌ No | ✅ Yes | ❌ No |
| ORM Support | Defines Standard | Implements ORM | Uses Hibernate/JPA |
| Boilerplate Code | High | Medium | Very Low |
| CRUD Methods | No | Manual | Built-in Repository Methods |
| Query Generation | No | HQL | Automatic Query Methods |

---

## Relationship

### JPA

- Java Persistence API
- Standard Specification (JSR-338)
- Defines ORM rules
- Does not provide implementation

---

### Hibernate

- ORM Framework
- Implements JPA
- Maps Java Objects to Database Tables
- Provides SessionFactory and Session

---

### Spring Data JPA

- Built on top of JPA
- Uses Hibernate internally
- Eliminates boilerplate code
- Provides JpaRepository

---

## Example

### Hibernate

```java
Session session = factory.openSession();
Transaction tx = session.beginTransaction();

session.save(employee);

tx.commit();
session.close();
```

### Spring Data JPA

```java
@Repository
public interface EmployeeRepository
        extends JpaRepository<Employee, Integer> {
}
```

```java
@Service
public class EmployeeService {

    @Autowired
    EmployeeRepository repository;

    @Transactional
    public void addEmployee(Employee employee){
        repository.save(employee);
    }
}
```

---

## Advantages of Spring Data JPA

- Less Boilerplate Code
- Built-in CRUD Operations
- Automatic Query Generation
- Pagination & Sorting Support
- Transaction Management
- Easy Integration with Spring Boot

---

## Learning Outcome

After completing this hands-on, you will be able to:

- Differentiate between JPA, Hibernate, and Spring Data JPA.
- Understand how Hibernate implements JPA.
- Use Spring Data JPA repositories for database operations.
- Identify when to use each technology in enterprise applications.

---

## Author

**Aarushi Singh**