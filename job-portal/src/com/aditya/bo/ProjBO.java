package com.aditya.bo;

import java.sql.SQLException;
import java.util.ArrayList;

import com.aditya.dao.ProjDAO;
import com.aditya.vo.JobVO;
import com.aditya.vo.LoginVO;
import com.aditya.vo.RequestVO;

public class ProjBO {
	
	
	public static int verifyUserName(LoginVO loginVO){
		
		try {
			String password = ProjDAO.getPassword(loginVO.getUsername().trim());
			
			if(password.trim().equals(loginVO.getPassword().trim())){
				return 1;
			}else return 0;
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return -1;
	}
	
	public static int acceptInterest(int offerId) {
		try {
			ProjDAO.acceptJob(offerId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		
		return 1;
	}
	
	public static int signUpUser(LoginVO loginVO) throws Exception{
		
		ProjDAO.signUp(loginVO);
		
		
		return 1;
	}
	
	public static int postJob(JobVO jobVO)
	{
		try {
			ProjDAO.postJob(jobVO);
			return 1;
		} catch (Exception e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}
	
	
	public static ArrayList<JobVO> getAllJob(){
		
		ArrayList<JobVO> j = new ArrayList<JobVO>();
		
		try {
			j = ProjDAO.getAllJobs();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return j;
		
	}
	
	public static ArrayList<JobVO> getMyJobs(String username) {
		ArrayList<JobVO> j = new ArrayList<JobVO>();
		try {
			j = ProjDAO.getMyJobs(username);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return j;
	}
	

	public static int updateit(JobVO jobVO){
		
		try {
			ProjDAO.updateJob(jobVO);
			return 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}

	public static int updateMe(LoginVO loginVO){
		
		try {
			ProjDAO.updateProfile(loginVO);
			return 1;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}
	
	public static int sendInterest(RequestVO requestVO){
		
		try {
		
			ProjDAO.showInterest(requestVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 1;
	}
		

	
	public static ArrayList<RequestVO> getAllInterests(String username){
		
		ArrayList<RequestVO> interests = new ArrayList<RequestVO>();
		try {
			interests = ProjDAO.getAllInterest(username);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return interests;
	} 
	
	
	public static void delInterest(int iid){
		
		try {
			ProjDAO.deleteInterest(iid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
public static void delPost(String id){
		
		try {
			ProjDAO.deletePost(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
}




