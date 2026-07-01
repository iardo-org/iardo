package com.iardo.config;

import java.io.InputStream;
import java.util.Properties;

public class MailConfig {

    private static final Properties properties = new Properties();

    static {
        try (InputStream input =
                MailConfig.class.getClassLoader()
                        .getResourceAsStream("application.properties")) {

            properties.load(input);

        } catch (Exception e) {
            throw new RuntimeException(
                    "Unable to load application.properties",
                    e);
        }
    }

    public static String getHost() {
        return properties.getProperty("mail.host");
    }

    public static String getPort() {
        return properties.getProperty("mail.port");
    }

    public static String getUsername() {
        return properties.getProperty("mail.username");
    }

    public static String getPassword() {
        return properties.getProperty("mail.password");
    }

    public static String getAdminEmail() {
        return properties.getProperty("admin.email");
    }
}