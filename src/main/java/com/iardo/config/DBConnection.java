package com.iardo.config;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnection {

	private static final Properties props = new Properties();

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("MySQL Driver not found", e);
		}

		try (InputStream input = DBConnection.class.getClassLoader().getResourceAsStream("application.properties")) {
			if (input != null) {
				props.load(input);
			} else {
				throw new RuntimeException("application.properties not found on classpath");
			}
		} catch (IOException e) {
			throw new RuntimeException("Failed to load application.properties", e);
		}
	}

	public static Connection getConnection() throws SQLException {
		return DriverManager.getConnection(props.getProperty("db.url"), props.getProperty("db.username"),
				props.getProperty("db.password"));
	}
}