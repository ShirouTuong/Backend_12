package com.codexy.usermanagement.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectionUtil {
    private static final String DEFAULT_DB_URL = "jdbc:mysql://localhost:3306/user_management?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String DEFAULT_DB_USER = "root";
    private static final String DEFAULT_DB_PASSWORD = "";

    private static String getEnvOrDefault(String key, String defaultValue) {
        String value = System.getenv(key);
        return value == null || value.trim().isEmpty() ? defaultValue : value;
    }

    public static Connection getConnection() throws SQLException {
        String dbUrl = getEnvOrDefault("DB_URL", DEFAULT_DB_URL);
        String dbUser = getEnvOrDefault("DB_USER", DEFAULT_DB_USER);
        String dbPassword = getEnvOrDefault("DB_PASSWORD", DEFAULT_DB_PASSWORD);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found.", e);
        }
        return DriverManager.getConnection(dbUrl, dbUser, dbPassword);
    }
}
