package com.iardo.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.iardo.config.RecaptchaConfig;
import com.iardo.service.EmailService;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final EmailService emailService = new EmailService();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String message = request.getParameter("message");
		String recaptchaToken = request.getParameter("g-recaptcha-response");
		String honeypot = request.getParameter("company_name");

		// Honeypot check — bots often fill hidden fields
		if (honeypot != null && !honeypot.isBlank()) {
			response.sendRedirect(request.getContextPath() + "/contact-us/?success=true");
			return; // silently "succeed" so bots don't learn they were caught
		}

		if (name == null || name.isBlank() || email == null || email.isBlank()) {
			response.sendRedirect(request.getContextPath() + "/contact-us/?error=true");
			return;
		}

		if (recaptchaToken == null || recaptchaToken.isBlank() || !verifyRecaptcha(recaptchaToken)) {
			response.sendRedirect(request.getContextPath() + "/contact-us/?error=true");
			return;
		}

		try {
			emailService.sendAdminMail(name, email, phone, message);
			emailService.sendUserAcknowledgement(name, email);
			response.sendRedirect(request.getContextPath() + "/contact-us/?success=true");
		} catch (MessagingException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/contact-us/?error=true");
		}
	}

	private boolean verifyRecaptcha(String token) {
		try {
			String secret = RecaptchaConfig.getSecretKey();
			String params = "secret=" + secret + "&response=" + token;

			URL url = new URL("https://www.google.com/recaptcha/api/siteverify");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			try (OutputStream os = conn.getOutputStream()) {
				os.write(params.getBytes(StandardCharsets.UTF_8));
			}

			StringBuilder responseText = new StringBuilder();
			try (BufferedReader br = new BufferedReader(
					new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
				String line;
				while ((line = br.readLine()) != null) {
					responseText.append(line);
				}
			}

			JSONObject json = new JSONObject(responseText.toString());
			boolean success = json.optBoolean("success", false);
			double score = json.optDouble("score", 0.0);

			// 0.5 is a reasonable threshold; lower = more lenient, higher = stricter
			return success && score >= 0.5;

		} catch (Exception e) {
			e.printStackTrace();
			return false; // fail closed — if verification errors out, treat as failed
		}
	}
}