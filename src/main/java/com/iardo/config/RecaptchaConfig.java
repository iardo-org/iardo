package com.iardo.config;

import java.io.InputStream;
import java.util.Properties;

public class RecaptchaConfig {
	private static final Properties properties = new Properties();

	static {
		try (InputStream input = RecaptchaConfig.class.getClassLoader().getResourceAsStream("application.properties")) {
			properties.load(input);
		} catch (Exception e) {
			throw new RuntimeException("Unable to load application.properties", e);
		}
	}

	public static String getSecretKey() {
		return properties.getProperty("recaptcha.secretKey");
	}
}