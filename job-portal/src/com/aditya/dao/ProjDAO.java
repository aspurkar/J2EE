package com.aditya.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.aditya.vo.JobVO;
import com.aditya.vo.LoginVO;
import com.aditya.vo.RequestVO;


@Repository
public class ProjDAO {
	
	public static Connection getConnection() throws Exception{
		Connection dbConn = null;
    try{
    //step1:
    Class.forName("com.mysql.jdbc.Driver");
	//step2
    String url = "jdbc:mysql://localhost:3306/test";
	//step3
	dbConn = DriverManager.getConnection(url, "root", null);
	}
     catch (SQLException sqle) {
	   sqle.printStackTrace();
	   throw sqle;
	}
         catch(Exception e) {
	   e.printStackTrace();
	   throw e;
	}
return dbConn;
}
	


	public static String getPassword(String username) throws SQLException, Exception{

	    Connection dbConn = null;
	    PreparedStatement pStmt = null;
            ResultSet rs = null;
            String password="";
            
       try{
		dbConn = getConnection();
		
		pStmt = dbConn.prepareStatement("SELECT password FROM users WHERE username = ?");
		pStmt.setString(1, username);
   		rs = pStmt.executeQuery();
   		
   		
		if (rs.next()) {
			System.out.println(rs.getString(1));
			password = rs.getString(1);
   		}
       }catch(SQLException sqe){
    	   //log the error
    	   sqe.printStackTrace();
    	   //throw the exception
    	   throw sqe;
       } finally{
    	   rs.close();
    	   pStmt.close();
    	   dbConn.close();
       }

		return password;
	}


	public static void postJob(JobVO jobVO) throws Exception{
		
		 Connection dbConn = null;
		    PreparedStatement pStmt = null;
		    int rowsInserted = 0;

		     try{
			dbConn = getConnection();
			pStmt = dbConn.prepareStatement("INSERT INTO jobs(username,type,discription,rate,neg,hrs,location,status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
			pStmt.setString(1, jobVO.getUsername());
			pStmt.setString(2, jobVO.getType());
			pStmt.setString(3, jobVO.getDiscription());
			pStmt.setString(4, jobVO.getRate());
			pStmt.setString(5, jobVO.getNeg());
			pStmt.setString(6, jobVO.getHrs());
			pStmt.setString(7, jobVO.getLocation());
			pStmt.setString(8, jobVO.getStatus());
			
			System.out.println("I am in DAO");
	   		rowsInserted = pStmt.executeUpdate();
	   		
			if (rowsInserted != 1) {
				throw new Exception("Error in inserting the row");

	   		}
		     }catch (SQLException sqle) {
			     System.out.println(sqle.getErrorCode());
			     System.out.println(sqle.getMessage());
			   sqle.printStackTrace();
			   throw sqle;
			}
	             catch(Exception e) {
			   e.printStackTrace();
			   throw e;
			}
		     finally {
			pStmt.close();
			dbConn.close();
		     }
			

		
		
	}
	
	
public static void signUp(LoginVO loginVO) throws Exception{
	 Connection dbConn = null;
	    PreparedStatement pStmt = null;
	    int rowsInserted = 0;

	     try{
		dbConn = getConnection();
		pStmt = dbConn.prepareStatement("INSERT INTO users VALUES (?, ?, ?, ?, ?, ?, ?)");
		pStmt.setString(1, loginVO.getUsername());
		pStmt.setString(2, loginVO.getPassword());
		pStmt.setString(3, loginVO.getFname());
		pStmt.setString(4, loginVO.getLname());
		pStmt.setString(5, loginVO.getAddress());
		pStmt.setString(6, loginVO.getEmail());
		pStmt.setString(7, loginVO.getContact());
		System.out.println("I am in DAO");
  		rowsInserted = pStmt.executeUpdate();
  		
		if (rowsInserted != 1) {
			throw new Exception("Error in inserting the row");

  		}
	     }catch (SQLException sqle) {
		     System.out.println(sqle.getErrorCode());
		     System.out.println(sqle.getMessage());
		   sqle.printStackTrace();
		   throw sqle;
		}
            catch(Exception e) {
		   e.printStackTrace();
		   throw e;
		}
	     finally {
		pStmt.close();
		dbConn.close();
	     }
		
}
	
	

public static ArrayList<JobVO> getAllJobs() throws Exception{
	
	ArrayList<JobVO> jobs = new ArrayList<JobVO>();
    Connection dbConn = null;
    PreparedStatement pStmt = null;
        ResultSet rs = null;
      
     try{

	dbConn = getConnection();
	pStmt = dbConn.prepareStatement("SELECT * FROM jobs;");
	rs = pStmt.executeQuery();
	while (rs.next()) {
		 JobVO jobVO = new JobVO();
		jobVO.setId(Integer.parseInt(rs.getString(1)));
		jobVO.setUsername(rs.getString(2));
		jobVO.setType(rs.getString(3));
		jobVO.setDiscription(rs.getString(4));
		jobVO.setRate(rs.getString(5));
		jobVO.setNeg(rs.getString(6));
		jobVO.setHrs(rs.getString(7));
		jobVO.setLocation(rs.getString(8));
		jobVO.setStatus(rs.getString(9));
		jobVO.setContractor(rs.getString(10));
		
		
		jobs.add(jobVO);
		}
     }catch (SQLException sqle) {
	   sqle.printStackTrace();
	   throw sqle;
	}catch(Exception e) {
	   e.printStackTrace();
	   throw e;
	}
     finally {
	rs.close();
	pStmt.close();
	dbConn.close();
    }
	return jobs;
}

public static ArrayList<JobVO> getMyJobs(String username) throws Exception{
	ArrayList<JobVO> jobs = new ArrayList<JobVO>();
    Connection dbConn = null;
    PreparedStatement pStmt = null;
    ResultSet rs = null;
      
     try{

	dbConn = getConnection();
	pStmt = dbConn.prepareStatement("SELECT j.id, j.username, j.type, j.discription, j.rate, j.neg, j.hrs, j.location, j.status, j.contractor_name FROM interest i INNER JOIN jobs j ON j.id = i.job_id where i.username=?;");
	pStmt.setString(1, username);
	rs = pStmt.executeQuery();
	while (rs.next()) {
		 JobVO jobVO = new JobVO();
		jobVO.setId(Integer.parseInt(rs.getString(1)));
		jobVO.setUsername(rs.getString(2));
		jobVO.setType(rs.getString(3));
		jobVO.setDiscription(rs.getString(4));
		jobVO.setRate(rs.getString(5));
		jobVO.setNeg(rs.getString(6));
		jobVO.setHrs(rs.getString(7));
		jobVO.setLocation(rs.getString(8));
		jobVO.setStatus(rs.getString(9));
		jobVO.setContractor(rs.getString(10));
		
		
		jobs.add(jobVO);
		}
     }catch (SQLException sqle) {
	   sqle.printStackTrace();
	   throw sqle;
	}catch(Exception e) {
	   e.printStackTrace();
	   throw e;
	}
     finally {
		rs.close();
		pStmt.close();
		dbConn.close();
    }
	return jobs;
}


public static void updateJob(JobVO jobVO) throws Exception{
	
	 Connection dbConn = null;
	    PreparedStatement pStmt = null;
	    int rowsInserted = 0;

	     try{
		dbConn = getConnection();
		pStmt = dbConn.prepareStatement("UPDATE jobs SET username=?,type=?,discription=?,rate=?,neg=?,hrs=?,location=? WHERE id=?");
		pStmt.setString(1, jobVO.getUsername());
		pStmt.setString(2, jobVO.getType());
		pStmt.setString(3, jobVO.getDiscription());
		pStmt.setString(4, jobVO.getRate());
		pStmt.setString(5, jobVO.getNeg());
		pStmt.setString(6, jobVO.getHrs());
		pStmt.setString(7, jobVO.getLocation());
		pStmt.setInt(8, jobVO.getId());
		
		System.out.println("I am in DAO");
  		rowsInserted = pStmt.executeUpdate();
  		
		if (rowsInserted != 1) {
			throw new Exception("Error in inserting the row");

  		}
	     }catch (SQLException sqle) {
		     System.out.println(sqle.getErrorCode());
		     System.out.println(sqle.getMessage());
		   sqle.printStackTrace();
		   throw sqle;
		}
            catch(Exception e) {
		   e.printStackTrace();
		   throw e;
		}
	     finally {
		pStmt.close();
		dbConn.close();
	     }

}

public static void updateProfile(LoginVO loginVO) throws Exception{
	
	 Connection dbConn = null;
	    PreparedStatement pStmt = null;
	    int rowsInserted = 0;

	     try{
		dbConn = getConnection();
		pStmt = dbConn.prepareStatement("UPDATE users SET password = ?, fname =  ?, lname=  ?, address=  ?, email = ?, contact = ? WHERE username= ?;");
		pStmt.setString(7, loginVO.getUsername());
		pStmt.setString(1, loginVO.getPassword());
		pStmt.setString(2, loginVO.getFname());
		pStmt.setString(3, loginVO.getLname());
		pStmt.setString(4, loginVO.getAddress());
		pStmt.setString(5, loginVO.getEmail());
		pStmt.setString(6, loginVO.getContact());
		System.out.println("I am in DAO");
		rowsInserted = pStmt.executeUpdate();
		
		if (rowsInserted != 1) {
			throw new Exception("Error in inserting the row");

		}
	     }catch (SQLException sqle) {
		     System.out.println(sqle.getErrorCode());
		     System.out.println(sqle.getMessage());
		   sqle.printStackTrace();
		   throw sqle;
		}
         catch(Exception e) {
		   e.printStackTrace();
		   throw e;
		}
	     finally {
		pStmt.close();
		dbConn.close();
	     }
	
}


public static ArrayList<RequestVO> getAllInterest(String username) throws Exception{
	
	ArrayList<RequestVO> requests = new ArrayList<RequestVO>();
    Connection dbConn = null;
    PreparedStatement pStmt = null;
        ResultSet rs = null;
      
     try{

	dbConn = getConnection();
	pStmt = dbConn.prepareStatement("SELECT interest.iid,interest.username, interest.job_id, u.fname, u.lname, u.contact, u.email,u.address FROM users INNER JOIN jobs on jobs.username = users.username INNER JOIN interest on jobs.id = interest.job_id INNER JOIN users u ON u.username = interest.username WHERE users.username=? AND jobs.status='PENDING' ");
	pStmt.setString(1, username);
	System.out.println(pStmt.toString());
	rs = pStmt.executeQuery();
	while (rs.next()) {
		 RequestVO requestVO = new RequestVO();
		requestVO.setIid(rs.getInt(1));
		requestVO.setUsername(rs.getString(2));
		requestVO.setId(rs.getString(3));
		requestVO.setFname(rs.getString(4));
		requestVO.setLname(rs.getString(5));
		requestVO.setContact(rs.getString(6));
		requestVO.setEmail(rs.getString(7));
		requestVO.setAddress(rs.getString(8));
		
		requests.add(requestVO);
		}
     }catch (SQLException sqle) {
	   sqle.printStackTrace();
	   throw sqle;
	}catch(Exception e) {
	   e.printStackTrace();
	   throw e;
	}
     finally {
	rs.close();
	pStmt.close();
	dbConn.close();
    }
	return requests;
}


public static void showInterest(RequestVO requestVO) throws Exception{
	 Connection dbConn = null;
	    PreparedStatement pStmt = null;
	    PreparedStatement jStmt = null;
	    int rowsInserted = 0;

	     try{
		dbConn = getConnection();
		pStmt = dbConn.prepareStatement("INSERT INTO interest(username,job_id) VALUES (?, ?);");
		pStmt.setString(1, requestVO.getUsername());
		pStmt.setString(2, requestVO.getId());
	
		rowsInserted = pStmt.executeUpdate();
		
		jStmt = dbConn.prepareStatement("UPDATE jobs"
									 + " SET status=? "
									 + " WHERE id=?;");
		jStmt.setString(1, "PENDING");
		jStmt.setString(2, requestVO.getId());
		
		jStmt.executeUpdate();	
		
		if (rowsInserted != 1) {
			throw new Exception("Error in inserting the row");

		}
	     }catch (SQLException sqle) {
		     System.out.println(sqle.getErrorCode());
		     System.out.println(sqle.getMessage());
		   sqle.printStackTrace();
		   throw sqle;
		}
         catch(Exception e) {
		   e.printStackTrace();
		   throw e;
		}
	     finally {
		pStmt.close();
		dbConn.close();
	     }
		
}



public static void deleteInterest(int iid) throws Exception{
    Connection dbConn = null;
    PreparedStatement pStmt = null;
    int rowsDeleted = 0;

     try{
	dbConn = getConnection();
	pStmt = dbConn.prepareStatement("DELETE FROM interest WHERE iid = ?");
	pStmt.setInt(1, iid);
	
		rowsDeleted = pStmt.executeUpdate();

	if (rowsDeleted != 1) {
		throw new Exception("Error in delete the row");

		}
     }catch (SQLException sqle) {
	   sqle.printStackTrace();
	   throw sqle;
	}
         catch(Exception e) {
	   e.printStackTrace();
	   throw e;
	}
     finally {
	pStmt.close();
	dbConn.close();
     }
	return;
	
}

	public static void deletePost(String id) throws Exception{
	 Connection dbConn = null;
	    PreparedStatement pStmt = null;
	    int rowsDeleted = 0;

	     try{
		dbConn = getConnection();
		pStmt = dbConn.prepareStatement("DELETE FROM jobs WHERE id = ?");
		pStmt.setString(1, id);
		
			rowsDeleted = pStmt.executeUpdate();

		if (rowsDeleted != 1) {
			throw new Exception("Error in delete the row");

			}
	     }catch (SQLException sqle) {
		   sqle.printStackTrace();
		   throw sqle;
		}
	         catch(Exception e) {
		   e.printStackTrace();
		   throw e;
		}
	     finally {
		pStmt.close();
		dbConn.close();
	     }
		return;
	
	}
	
	public static void acceptJob(int offerId) throws Exception {
		Connection dbConn = null;
		PreparedStatement stmt = null;
		
		try {
			dbConn = getConnection();
			
			stmt = dbConn.prepareStatement("SELECT username, job_id from interest WHERE iid=?;");
			stmt.setInt(1, offerId);
			ResultSet rs = stmt.executeQuery();
			String username = null;
			int jobId = 0;
			while(rs.next()) {
				username = rs.getString(1);
				jobId = rs.getInt(2);
			}
			
			if (username != null) {
			
				stmt = dbConn.prepareStatement(
						"UPDATE jobs SET status=?, contractor_name=? WHERE id=?;");
				stmt.setString(1, "ACTIVE");
				stmt.setString(2, username);
				stmt.setInt(3, jobId);
				
				stmt.executeUpdate();
				
				stmt = dbConn.prepareStatement("DELETE FROM interest where job_id = ?;");
				stmt.setInt(1, jobId);
				stmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			stmt.close();
			dbConn.close();
		}
	}


}






	


