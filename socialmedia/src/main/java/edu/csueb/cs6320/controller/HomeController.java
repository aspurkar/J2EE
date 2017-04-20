package edu.csueb.cs6320.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.csueb.cs6320.bean.User;
import edu.csueb.cs6320.util.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/login", method=RequestMethod.POST)
	public String login(Model model, HttpServletRequest request){
		List<User> users = userService.getUsers();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		for (User u : users) {
			if (u.getEmail().equals(email) && u.getPassword().equals(password)) {
				request.getSession().setAttribute("user", u);
				return "dashboard";
			}
		}
		return "home";
	}
	
	@RequestMapping(value = "/register", method=RequestMethod.POST)
	public String register(Model model, HttpServletRequest request){
		User user = new User(request.getParameter("firstname"), request.getParameter("lastname"),
				request.getParameter("email"), "0", request.getParameter("password"));
		userService.add(user);
		
		request.getSession().setAttribute("user", user);;
		
		//model.addAttribute("user", user);
		return "dashboard";
	}
	
	@RequestMapping(value = "/admin/list")
	public String admin(Model model){  
		List<User> users = userService.getUsers();
		model.addAttribute("users", users);
		return "admin";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value="/admin/update", method=RequestMethod.POST)
	public String admin(Locale locale, Model model, HttpServletRequest request){
		String id = request.getParameter("id");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String email = request.getParameter("email");
		
		userService.update(id, firstName, lastName, email);
		
		List<User> users = userService.getUsers();
		model.addAttribute("users", users);
		
		return "admin";
	}
	
	@RequestMapping(value="/admin/delete", method=RequestMethod.POST)
	public String delete(Locale locale, Model model, HttpServletRequest request){
		String email = request.getParameter("email");
		int endIndex = email.indexOf("/");
		if (endIndex != -1) {
			email = email.substring(0, endIndex);
		}
		
		User user = userService.getUser(email);
		userService.delete(user);
		
		List<User> users = userService.getUsers();
		model.addAttribute("users", users);
		
		return "admin";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(Locale locale, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "home";
	}
	
	@RequestMapping(value="/dashboard", method=RequestMethod.GET) 
	public String dashboard(Locale locale, Model model) {
		return "dashboard";
	}
	
	@RequestMapping(value="/chat", method=RequestMethod.POST) 
	public String chat(Locale locale, Model model, HttpServletRequest request) {
		String email = request.getParameter("email");
		int endIndex = email.indexOf("/");
		if (-1 != endIndex) {
			email = email.substring(0, endIndex);
		}
		//User user = userService.getUser(email);
		model.addAttribute("email", email);
		
		
		return "chat";
	}
}
