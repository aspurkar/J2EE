package com.aditya.controller;

import java.util.Map;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aditya.model.Student;
import com.aditya.service.StudentService;

@Controller
public class StudentController2 {
	@Autowired
	private StudentService studentService;
	@RequestMapping("/index1")
	public String setupForm(Map<String, Object> map){
		
		return "index";
	}
	@RequestMapping("/index2")
	public String setupForm1(Map<String, Object> map){
		
		Student student = new Student();
		map.put("student", student);
		map.put("studentList", studentService.getAllStudent());
		return "student";
	}
	@RequestMapping(value = "/loginServlet", method = RequestMethod.POST)
	public String setupForm(Map<String, Object> map,@RequestParam("username") String username, @RequestParam("userpass") String userpass){
		if(validate(username,userpass)){
			Student student = new Student();
			map.put("student", student);
			map.put("studentList", studentService.getAllStudent());
			return "student";
			
		}else{
			return "index";
		}
		
	}
	

	@RequestMapping(value = "/contact", method = RequestMethod.POST)
	public String setupForm2(Map<String, Object> map,@RequestParam("Email") String Email, @RequestParam("Subject") String Subject,@RequestParam("Message") String Message1){
		final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		  // Get a Properties object
		     Properties props = System.getProperties();
		     props.setProperty("mail.smtp.host", "smtp.gmail.com");
		     props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
		     props.setProperty("mail.smtp.socketFactory.fallback", "false");
		     props.setProperty("mail.smtp.port", "465");
		     props.setProperty("mail.smtp.socketFactory.port", "465");
		     props.put("mail.smtp.auth", "true");
		     props.put("mail.debug", "true");
		     props.put("mail.store.protocol", "pop3");
		     props.put("mail.transport.protocol", "smtp");
		     final String username = "projecthi420@gmail.com";//
		     final String password = "Tooeasy123456789";
		     try{
		     Session session = Session.getDefaultInstance(props, 
		                          new Authenticator(){
		                             protected PasswordAuthentication getPasswordAuthentication() {
		                                return new PasswordAuthentication(username, password);
		                             }});

		   // -- Create a new message --
		     Message msg = new MimeMessage(session);

		  // -- Set the FROM and TO fields --
		     msg.setFrom(new InternetAddress(username));
		     msg.setRecipients(Message.RecipientType.TO, 
		                      InternetAddress.parse(Email,false));
		     msg.setSubject(Subject);
		     msg.setText(Message1);
		     msg.setSentDate(new Date());
		     Transport.send(msg);
		     System.out.println("Message sent.");
		  }catch (MessagingException e){ System.out.println("Erreur d'envoi, cause: " + e);}
		     Student student = new Student();
				map.put("student", student);
				map.put("studentList", studentService.getAllStudent());
				return "student";
		
	}
	public static boolean validate(String name, String pass) {	
		System.out.println();
		if(name.equalsIgnoreCase("username")&&pass.equalsIgnoreCase("password")){
			return true;

		}else{
			return false;
		}
		
	}
}
