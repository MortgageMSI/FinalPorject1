package com.mercury.functions;

import java.util.Date;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;

public class javaMail {
	private final static String host_user = "zhaner08@gmail.com";
	private final static String host_password = "Lll123456";
	private final static String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
	private final static Properties prop;
	private final static Session session;
	
	static{
		prop = System.getProperties();
		prop.setProperty("mail.smtp.host", "smtp.gmail.com");
		prop.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
		prop.setProperty("mail.smtp.socketFactory.fallback", "false");
		prop.setProperty("mail.smtp.port", "465");
		prop.setProperty("mail.smtp.socketFactory.port", "465");
		prop.put("mail.smtp.auth", "true");
		session = Session.getDefaultInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(host_user, host_password);
			}
		});
	}
	
	private String destination;
	private String username;
	private String lastname;
	private String firstname;
	
	private String subject="";
	private String content="";
	
	public javaMail(){}
	public javaMail(String firstname, String lastname, String destination, String username){
		this.destination = destination;
		this.username = username;
		this.firstname= firstname;
		this.lastname = lastname;
	}
	

	
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void sendWelcomeEmail(){
		subject = "Thank you for choosing MSI Mortgage Calculator";
		content = firstname+" "+ lastname+", welcome to MSI Mortgage Calculator!\n Please remember your username :" + username;
		sendEmail();
	}

	public void sendUsernameEmail(){
		subject = "Username retrieval from MSI Mortgage Calculator";
		content = firstname+" "+ lastname+", Your username :" + username;
		sendEmail();
	}
	
	public void sendPasswordEmail(String password){
		subject = "Your new password from MSI Mortgage Calculator";
		content = "Your temperoray password: "+password;
		sendEmail();
	}
	
	private void sendEmail(){
		try {
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(host_user));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(
					destination));
			msg.setSubject(subject);
			msg.setSentDate(new Date());

			Multipart multipart = new MimeMultipart();
			// content
			BodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart.setText(content);
			multipart.addBodyPart(messageBodyPart);
			
			msg.setContent(multipart);

			Transport.send(msg);
			System.out.println("Message sent successfully!");
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}
