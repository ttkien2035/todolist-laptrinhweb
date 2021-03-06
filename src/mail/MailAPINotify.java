package mail;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class MailAPINotify {
	public static String Send(String to,String description,String name) {
        // Recipient's email ID needs to be mentioned.

        // Sender's email ID needs to be mentioned
        String from = "TimeLive";
        final String username = "timelive.circleqm@gmail.com";//change accordingly
        final String password = "timelive@qm";//change accordingly

        // Assuming you are sending email through relay.jangosmtp.net
        String host = "smtp.gmail.com";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        
        String code = RandomString.getRandomString(8);
        // Get the Session object.
        Session session = Session.getInstance(props,
           new javax.mail.Authenticator() {
              protected PasswordAuthentication getPasswordAuthentication() {
                 return new PasswordAuthentication(username, password);
             }
           });

        try {
             // Create a default MimeMessage object.
             MimeMessage message = new MimeMessage(session);

             // Set From: header field of the header.
             message.setFrom(new InternetAddress(from));

             // Set To: header field of the header.
             message.setRecipients(Message.RecipientType.TO,
                 InternetAddress.parse(to));

             // Set Subject: header field
             message.setSubject("TodoApp : Deadline Pending","UTF-8");

             // Now set the actual message
             message.setText("Hello "+name+"! \nYou have a pending deadline. Remember to handle it. \nInfo Task: " + description, "UTF-8");

             // Send message
             Transport.send(message);

            System.out.println("Sent message successfully....");
            System.out.println(to);

        } catch (MessagingException e) {
            return e.toString();
        }
      return code;
   }

}
