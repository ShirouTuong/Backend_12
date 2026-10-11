# User Management

Java 17 MVC web application for Tomcat 10.1 using Jakarta Servlet/JSP, JSTL, JDBC, and MySQL Connector/J.

The app expects the existing `demo.users` table with `id`, `name`, `email`, and `country` columns. It does not create a database or change the schema. Edit `JDBC_URL`, `JDBC_USER`, and `JDBC_PASSWORD` in `UserDAO` for your MySQL connection.

## Build and deploy

From this project directory, build the WAR:

```powershell
mvn clean package
```

The artifact is `target/user-management.war`. Copy it to the Tomcat 10.1 `webapps` directory and start Tomcat. Open `http://localhost:8080/user-management/`; the user list is at `/user-management/users`.