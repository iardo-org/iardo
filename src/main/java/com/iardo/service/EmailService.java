package com.iardo.service;

import java.util.Properties;

import javax.mail.*; //here
import javax.mail.internet.*; //here

import com.iardo.config.MailConfig;

public class EmailService {

    private Session getSession() { 

        Properties props = new Properties();

        props.put("mail.smtp.host",
                MailConfig.getHost());

        props.put("mail.smtp.port",
                MailConfig.getPort());

        props.put("mail.smtp.auth",
                "true");

        props.put("mail.smtp.starttls.enable",
                "true");

        return Session.getInstance(
                props,
                new Authenticator() { 

                    @Override
                    protected PasswordAuthentication 
                    getPasswordAuthentication() { 

                        return new PasswordAuthentication( 
                                MailConfig.getUsername(),
                                MailConfig.getPassword());
                    }
                });
    }

    public void sendAdminMail(
            String name,
            String email,
            String phone,
            String message)
            throws MessagingException { 

        String body =
                "New Contact Form Submission\n\n"
                + "Name: " + name + "\n"
                + "Email: " + email + "\n"
                + "Phone: " + phone + "\n\n"
                + "Message:\n"
                + message;

        sendEmail(
                MailConfig.getAdminEmail(),
                "New Contact Form Submission",
                body);
    }

    public void sendUserAcknowledgement(
            String name,
            String email)
            throws MessagingException { //here

        String body =
                "Hi " + name + ",\n\n"
                + "Thank you for contacting Iardo.\n\n"
                + "We have received your enquiry and our team "
                + "will get back to you shortly.\n\n"
                + "Regards,\n"
                + "Team Iardo";

        sendEmail( //here
                email,
                "Thank You For Contacting Iardo",
                body);
    }

    private void sendEmail(
            String to,
            String subject,
            String body)
            throws MessagingException { //here

        Message message = //here
                new MimeMessage(getSession()); //here

        message.setFrom(
                new InternetAddress( //here
                        MailConfig.getUsername()));

        message.setRecipients( 
                Message.RecipientType.TO, //here
                InternetAddress.parse(to)); // here

        message.setSubject(subject);

        message.setText(body);

        Transport.send(message); //here
    }
}