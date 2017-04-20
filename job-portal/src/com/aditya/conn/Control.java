package com.aditya.conn;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.aditya.bo.ProjBO;
import com.aditya.vo.JobVO;
import com.aditya.vo.LoginVO;
import com.aditya.vo.RequestVO;


@Controller
@RequestMapping("/")
public class Control {

	@RequestMapping(value="/home.do")
	public String showHome(HttpServletRequest request, HttpServletResponse response ){
		
				
		ArrayList<JobVO> jobs = new ArrayList<JobVO>();
		jobs = ProjBO.getAllJob();
		
		request.getSession().setAttribute("jobs", jobs);
		return "home";
	}
	
	@RequestMapping(value="/logout.do")
	public String logOut(HttpServletRequest request, HttpServletResponse response ){
		request.getSession().setAttribute("login", "no");
		request.getSession().setAttribute("username",null);
		return "home";
	}
	
	@RequestMapping(value="/loginentry.do")
	public String showLogin(HttpServletRequest request, HttpServletResponse response ){
		request.getSession().setAttribute("login", "no");
		return "login";
	}
	
	@RequestMapping(value="/signup.do",method= RequestMethod.GET)
	public String signUp(HttpServletRequest request, HttpServletResponse response  ) throws Exception{
		
		LoginVO loginVO = new LoginVO();
		
		loginVO.setUsername(request.getParameter("username").trim());
		loginVO.setPassword(request.getParameter("password").trim());
		loginVO.setAddress(request.getParameter("address").trim());
		loginVO.setFname(request.getParameter("fname").trim());
		loginVO.setLname(request.getParameter("lname").trim());
		loginVO.setEmail(request.getParameter("email").trim());
		loginVO.setContact(request.getParameter("contact").trim());
		
	int x = ProjBO.signUpUser(loginVO);
		
	return "loginack";
	
	
	}
	
	@RequestMapping(value="/profile.do", method= RequestMethod.GET) //Manage profile
	public String updateProfile(HttpServletRequest request, HttpServletResponse response ){

		if(request.getSession().getAttribute("login").equals("no")){
			return "login";
		}	
		return "profile";
	}
	
	@RequestMapping(value="/processprofile.do", method= RequestMethod.GET) //Manage profile
	public String processProfile(HttpServletRequest request, HttpServletResponse response ){
	LoginVO loginVO = new LoginVO();
	

	if(request.getSession().getAttribute("login").equals("no")){
		return "login";
	}	
		
		loginVO.setUsername((String)request.getSession().getAttribute("username"));
		loginVO.setPassword(request.getParameter("password").trim());
		loginVO.setAddress(request.getParameter("address").trim());
		loginVO.setFname(request.getParameter("fname").trim());
		loginVO.setLname(request.getParameter("lname").trim());
		loginVO.setEmail(request.getParameter("email").trim());
		loginVO.setContact(request.getParameter("contact").trim());
		
	ProjBO.updateMe(loginVO);
		
		
		return "profileack";
	}
	
	@RequestMapping(value="/interest.do", method= RequestMethod.GET) //Look at the requests
	public String lookRequests(HttpServletRequest request, HttpServletResponse response ){
		
		

		if(request.getSession().getAttribute("login").equals("no")){
			return "login";
		}	
		ArrayList<RequestVO> interests = new ArrayList<RequestVO>();
		interests = ProjBO.getAllInterests((String)request.getSession().getAttribute("username"));
		
		request.getSession().setAttribute("interests", interests);
		
		return "interest";
	}
	
	@RequestMapping(value="/accInterest.do", method=RequestMethod.GET)
	public String acceptInterest(HttpServletRequest request, HttpServletResponse response) {
		

		if(request.getSession().getAttribute("login").equals("no")){
			return "login";
		}	
		
		int offerId=Integer.parseInt(request.getParameter("iid"));
		int status = ProjBO.acceptInterest(offerId);
		return "accinterest";
	}
	
	
	@RequestMapping(value="/sendinterest.do", method= RequestMethod.GET) 
	public String sendRequests(HttpServletRequest request, HttpServletResponse response ){

		if(request.getSession().getAttribute("login").equals("no")){
			return "login";
		}	
		RequestVO requestVO = new RequestVO();
		
		requestVO.setUsername((String)request.getSession().getAttribute("username"));
		requestVO.setId(request.getParameter("id"));
		requestVO.setStatus("PENDING");
		ProjBO.sendInterest(requestVO);
		return "interestack";
	}
	
	
	

	@RequestMapping(value="/delInterest.do", method= RequestMethod.GET) //Manage work requests
	public String delInterest(HttpServletRequest request, HttpServletResponse response ){

		if(request.getSession().getAttribute("login").equals("no")){
			return "login";
		}	
		int iid = Integer.parseInt(request.getParameter("submitNO"));
		
		ProjBO.delInterest(iid);
		
		
		return "requestdel";
	}
	
	@RequestMapping(value="/account.do",method= RequestMethod.GET)
	public String showAccount(HttpServletRequest request, HttpServletResponse response  ){

				
		LoginVO loginVO = new LoginVO();
		
		loginVO.setUsername(request.getParameter("username").trim());
		loginVO.setPassword(request.getParameter("password").trim());
		
		if(request.getParameter("username").trim().equals("")||request.getParameter("password").trim().equals(""))
		{
			return "loginagain";
		}
		
		
		int x = ProjBO.verifyUserName(loginVO);
		
		if(x==1) {
			request.getSession().setAttribute("username", request.getParameter("username").trim());
			request.getSession().setAttribute("login", "yes");
			ArrayList<JobVO> jobs = new ArrayList<JobVO>();
			String currentUser = (String)request.getSession().getAttribute("username");
		
			jobs = ProjBO.getAllJob();
			ArrayList<JobVO> myJobs = new ArrayList();
			ArrayList<JobVO> allJobs = new ArrayList();
			for (int i = 0; i < jobs.size(); i += 1) {
				if (jobs.get(i).getUsername().equals(currentUser) ) {
					myJobs.add(0, jobs.get(i));
				} else if (jobs.get(i).getContractor() != null && jobs.get(i).getContractor().equals(currentUser)) {
					myJobs.add(jobs.get(i));
				} else if (jobs.get(i).getStatus() == "NEW" || jobs.get(i).getStatus() == "PENDING") {
					allJobs.add(jobs.get(i));
				}
			}
			System.out.println(myJobs.toString());
			request.getSession().setAttribute("jobs", allJobs);
			request.getSession().setAttribute("myJobs", myJobs);
		
			return "account1";
		}
		return "loginagain";
	}
	
	@RequestMapping(value="/account1.do", method= RequestMethod.GET) //for posting the request
	public String account(HttpServletRequest request, HttpServletResponse response ){

		if(request.getSession().getAttribute("login").equals("no")){
			return "login";
		}	
		ArrayList<JobVO> jobs = new ArrayList<JobVO>();
		
		jobs = ProjBO.getAllJob();
		String currentUser = (String)request.getSession().getAttribute("username");
		
		ArrayList<JobVO> myJobs = new ArrayList();
		ArrayList<JobVO> allJobs = new ArrayList();
		for (int i = 0; i < jobs.size(); i += 1) {
			if (jobs.get(i).getUsername().equals(currentUser) ) {
				myJobs.add(0, jobs.get(i));
			} else if (jobs.get(i).getContractor() != null && jobs.get(i).getContractor().equals(currentUser)) {
				myJobs.add(jobs.get(i));
			} else if (jobs.get(i).getStatus().equals("NEW") || jobs.get(i).getStatus().equals("PENDING")) {
				allJobs.add(jobs.get(i));
			}
		}
		
		myJobs.addAll(ProjBO.getMyJobs(currentUser));
		System.out.println(myJobs.toString());
		System.out.println(allJobs.toString());
		request.getSession().setAttribute("jobs", allJobs);
		request.getSession().setAttribute("myJobs", myJobs);
		
		return "account1";
	}
	
	
	
	
	@RequestMapping(value="/post.do", method= RequestMethod.GET) //for posting the request
	public String postRequest(HttpServletRequest request, HttpServletResponse response ){

		if(request.getSession().getAttribute("login").equals("no")){
			return "login";
		}	
		return "post";
	}
	
	@RequestMapping(value="/processpost.do", method= RequestMethod.GET) //for posting the request
	public String post(HttpServletRequest request, HttpServletResponse response ){

		if(request.getSession().getAttribute("login").equals("no")){
			return "login";
		}	
		JobVO jobVO= new JobVO();
		
		jobVO.setDiscription(request.getParameter("disc").trim());
		jobVO.setHrs(request.getParameter("hrs").trim());
		jobVO.setLocation(request.getParameter("location").trim());
		jobVO.setNeg(request.getParameter("neg"));
		jobVO.setRate(request.getParameter("rate").trim());
		jobVO.setType(request.getParameter("type").trim());
		jobVO.setUsername((String)(request.getSession().getAttribute("username")));
		jobVO.setStatus("NEW");
		
		
		ProjBO.postJob(jobVO);
		
		
		
		return "postack";
	}
	
	
	@RequestMapping(value="/workrequest.do", method= RequestMethod.GET) //Manage work requests
	public String manageRequest(HttpServletRequest request, HttpServletResponse response ){

		if(request.getSession().getAttribute("login").equals("no")){
			return "login";
		}	
		return "manage";
	}
	
	
	
	
	
	@RequestMapping(value="/processmanage.do", method= RequestMethod.GET) //Manage work requests
	public String manage(HttpServletRequest request, HttpServletResponse response ){
	JobVO jobVO= new JobVO();
	

	if(request.getSession().getAttribute("login").equals("no")){
		return "login";
	}	
	jobVO.setId(Integer.parseInt(request.getParameter("id").trim()));
		jobVO.setDiscription(request.getParameter("disc").trim());
		jobVO.setHrs(request.getParameter("hrs").trim());
		jobVO.setLocation(request.getParameter("location").trim());
		jobVO.setNeg(request.getParameter("neg"));
		jobVO.setRate(request.getParameter("rate").trim());
		jobVO.setType(request.getParameter("type").trim());
		jobVO.setUsername((String)(request.getSession().getAttribute("username")));
		
		
		ProjBO.updateit(jobVO);
		
		return "manageack";
	}
	
	
}
