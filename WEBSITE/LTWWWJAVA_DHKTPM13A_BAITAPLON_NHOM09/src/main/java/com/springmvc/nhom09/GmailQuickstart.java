package com.springmvc.nhom09;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.List;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.Base64;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.gmail.Gmail;
import com.google.api.services.gmail.GmailScopes;
import com.google.api.services.gmail.model.Label;
import com.google.api.services.gmail.model.ListLabelsResponse;
import com.google.api.services.gmail.model.Message;

public class GmailQuickstart {
    private String APPLICATION_NAME = "Gmail API Java Quickstart";
    private JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
    private String TOKENS_DIRECTORY_PATH = "tokens";
    private Gmail service;
    private String user;
    private  List<String> SCOPES = Collections.singletonList(GmailScopes.GMAIL_SEND);
    private  String CREDENTIALS_FILE_PATH = "/credentials.json";

    private Credential getCredentials(final NetHttpTransport HTTP_TRANSPORT) throws IOException {
        InputStream in = GmailQuickstart.class.getResourceAsStream(CREDENTIALS_FILE_PATH);
        if (in == null) {
            throw new FileNotFoundException("Resource not found: " + CREDENTIALS_FILE_PATH);
        }
        GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));

        GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
                HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, SCOPES)
                .setDataStoreFactory(new FileDataStoreFactory(new java.io.File(TOKENS_DIRECTORY_PATH)))
                .setAccessType("offline")
                .build();
        LocalServerReceiver receiver = new LocalServerReceiver.Builder().setPort(8888).build();
        return new AuthorizationCodeInstalledApp(flow, receiver).authorize("user");
    }

    public static void main(String ar[]) throws GeneralSecurityException, IOException, MessagingException {
    	GmailQuickstart dd = new GmailQuickstart();
    	dd.send("doankimdinh333@gmail.com", "asdf", "asdf");
    	// phải đăng nhập lần đầu dể láy access token
    }
    
    public GmailQuickstart() throws GeneralSecurityException, IOException {
    	final NetHttpTransport HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
        service = new Gmail.Builder(HTTP_TRANSPORT, JSON_FACTORY, getCredentials(HTTP_TRANSPORT))
                .setApplicationName(APPLICATION_NAME)
                .build();

        user = "me";
    }
    
    public void send(String to, String subject, String bodyText) throws MessagingException, IOException {
    	MimeMessage email = createEmail(to,"doankimdinh113@gmail.com",subject,bodyText);
        sendMessage(service, user, email);
    }
    
    public  MimeMessage createEmail(String to,
            String from,
            String subject,
            String bodyText)
	throws MessagingException {
	Properties props = new Properties();
	Session session = Session.getDefaultInstance(props, null);
	
	MimeMessage email = new MimeMessage(session);
	
	email.setFrom(new InternetAddress(from));
	email.addRecipient(javax.mail.Message.RecipientType.TO,
	new InternetAddress(to));
	email.setSubject(subject);
	email.setText(bodyText);
	return email;
	}
    
    public Message createMessageWithEmail(MimeMessage emailContent)
            throws MessagingException, IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        emailContent.writeTo(buffer);
        byte[] bytes = buffer.toByteArray();
        String encodedEmail = Base64.encodeBase64URLSafeString(bytes);
        Message message = new Message();
        message.setRaw(encodedEmail);
        return message;
    }
    
    public Message sendMessage(Gmail service,
            String userId,
            MimeMessage emailContent)
	throws MessagingException, IOException {
	Message message = createMessageWithEmail(emailContent);
	message = service.users().messages().send(userId, message).execute();
	
	System.out.println("Message id: " + message.getId());
	System.out.println(message.toPrettyString());
	return message;
	}
}