package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

    private static Connection conn;

    public static Connection getConn() {
        try {
            if (conn == null) {

                String host = System.getenv("DB_HOST");
                String port = System.getenv("DB_PORT");
                String db   = System.getenv("DB_NAME");
                String user = System.getenv("DB_USER");
                String pass = System.getenv("DB_PASSWORD");

                String url = "jdbc:mysql://" + host + ":" + port + "/" + db
                        + "?useSSL=true&allowPublicKeyRetrieval=true";

                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, pass);

                System.out.println("✅ DATABASE CONNECTED");
            }
        } catch (Exception e) {
            System.out.println("❌ DATABASE CONNECTION FAILED");
            e.printStackTrace();
        }
        return conn;
    }
}
