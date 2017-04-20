package edu.csueb.cs6320.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.csueb.cs6320.bean.Message;
import edu.csueb.cs6320.bean.User;
import edu.csueb.cs6320.util.MessageService;

@Controller
@SessionAttributes("user")
public class MessageController {

	@Autowired
	private MessageService messageService;

	@RequestMapping(value = "/send", method = RequestMethod.POST)
	public String register(Model model, HttpServletRequest request) {
		String sender = request.getParameter("sender");
		String receiver = request.getParameter("receiver");
		String title = request.getParameter("title");
		String message = request.getParameter("message");
		
		
		
		int endIndex = sender.indexOf("/");
		sender = sender.substring(0, endIndex);
		System.out.println("sender: " + sender);

		messageService.add(new Message(sender, receiver, title, message));
		
		List<Message> msg = messageService.getReceivedMessagesByEmail(sender);
		model.addAttribute("messages", msg);

		return "inbox";
	}

	@RequestMapping(value = "/inbox")
	public String inbox(Model model, HttpServletRequest request) {
		String sender = request.getParameter("sender");

		List<Message> msg = messageService.getReceivedMessagesByEmail(sender);
		model.addAttribute("messages", msg);
		
		return "inbox";
	}
	
	@RequestMapping(value = "/delete")
	public String delete(Model model, HttpServletRequest request) {
		String msgID = request.getParameter("msgID");
		int endIndex = msgID.indexOf("/");
		if (-1 != endIndex) {
			msgID = msgID.substring(0, endIndex);
		}
		
		System.out.println("le msgID: " + msgID);
		messageService.delete(Integer.parseInt(msgID));
		
		String email = request.getParameter("userEmail");
		endIndex = email.indexOf("/");
		if (-1 != endIndex) {
			email = email.substring(0, endIndex);
		}
		
		List<Message> msg = messageService.getReceivedMessagesByEmail(email);
		model.addAttribute("messages", msg);
		
		return "inbox";
	}
	
	@RequestMapping(value = "/view")
	public String view(Model model, HttpServletRequest request) {
		String msgID = request.getParameter("msgID");
		int endIndex = msgID.indexOf("/");
		if (-1 != endIndex) {
			msgID = msgID.substring(0, endIndex);
		}
		
		Message msg = messageService.getMessage(msgID);
		model.addAttribute("message", msg);
		
		return "messageView";
	}
}
