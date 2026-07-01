package com.iardo.config;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ContentfulConstants {
	private static final Properties props = new Properties();

	static {
		try (InputStream input = ContentfulConstants.class.getClassLoader()
				.getResourceAsStream("application.properties")) {
			if (input != null) {
				props.load(input);
			} else {
				throw new RuntimeException("application.properties not found on classpath");
			}
		} catch (IOException e) {
			throw new RuntimeException("Failed to load application.properties", e);
		}
	}

	public static final String BASE_URL = props.getProperty("contentful.baseUrl");
	public static final String ACCESS_TOKEN = props.getProperty("contentful.accessToken");
	public static final String CONTENT_TYPE = props.getProperty("contentful.contentType");
}