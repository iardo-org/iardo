package com.iardo.util;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class HttpUtil {

	private static final HttpClient client = HttpClient.newBuilder().version(HttpClient.Version.HTTP_2).build();

	private HttpUtil() {
	}

	public static String get(String url) throws IOException, InterruptedException {

		HttpRequest request = HttpRequest.newBuilder().uri(URI.create(url)).GET().build();

		HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

		if (response.statusCode() != 200) {
			throw new RuntimeException("HTTP Error : " + response.statusCode() + "\n" + response.body());
		}

		return response.body();
	}

}