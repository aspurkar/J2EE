package com.aditya.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Student {
	@Id
	@Column
	@GeneratedValue(strategy=GenerationType.AUTO) //for autonumber
	private int studentId;
	@Column
	private String firstname;
	@Column
	private String lastname;
	@Column
	private int yearLevel;
	@Column
	private int fee_detail;
	@Column
	private String displine;
	@Column
	private String gpa;
	@Column
	private String gym;
	@Column
	private String library;
	@Column
	private String parking;
	@Column
	private String datastructure;
	@Column
	private String distributed;
	@Column
	private String networking;
	@Column
	private String softwareweb;
	@Column
	private String hadoop;
	@Column
	private String feeduedate;
	@Column
	private String receipt;
	
			
	
	public Student(){}
	
	public Student(int studentId, String firstname, String lastname,
			int yearLevel,int fee_detail,String displine,String gpa,String gym,String library,String parking,String datastructure
			,String distributed, String networking,String softwareweb,String hadoop,String feeduedate,String receipt) {
		super();
		
		this.studentId = studentId;
		this.firstname = firstname;
		this.lastname = lastname;
		this.yearLevel = yearLevel;
		this.fee_detail=fee_detail;
		this.displine=displine;
		this.gpa=gpa;
		this.gym=gym;
		this.library=library;
		this.parking=parking;
		this.datastructure=datastructure;
		this.distributed=distributed;
		this.softwareweb=softwareweb;
		this.hadoop=hadoop;
		this.feeduedate=feeduedate;
		this.receipt=receipt;
		
		
		
		
		
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public int getYearLevel() {
		return yearLevel;
	}
	public void setYearLevel(int yearLevel) {
		this.yearLevel = yearLevel;
	}
	public int getfee_detail() {
		return fee_detail;
	}
	public void setfee_detail(int fee_detail) {
		this.fee_detail = fee_detail;
	}
	public void setdispline(String displine) {
		this.displine = displine;
	}
	public String getdispline() {
		return displine;
	}
	
	
	public void setgpa(String gpa) {
		this.gpa = gpa;
	}
	public String getgpa() {
		return gpa;
	}
	public void setgym(String gym) {
		this.gym = gym;
	}
	public String getgym() {
		return gym;
	}
	public void setlibrary(String library) {
		this.library = library;
	}
	public String getlibrary() {
		return library;
	}
	public void setparking(String parking) {
		this.parking = parking;
	}
	public String getparking() {
		return parking;
	}
	
	public void setdatastructure(String datastructure) {
		this.datastructure = datastructure;
	}
	public String getdatastructure() {
		return datastructure;
	}
	public void setdistributed(String distributed) {
		this.distributed = distributed;
	}
	public String getdistributed() {
		return distributed;
	}
	public void setnetworking(String networking) {
		this.networking = networking;
	}
	public String getnetworking() {
		return networking;
	}
	public void setsoftwareweb(String softwareweb) {
		this.softwareweb = softwareweb;
	}
	public String getsoftwareweb() {
		return softwareweb;
	}
	public void setHadoop(String hadoop) {
		this.hadoop = hadoop;
	}
	public String gethadoop() {
		return hadoop;
	}
	public void setfeeduedate(String feeduedate) {
		this.feeduedate = feeduedate;
	}
	public String getfeeduedate() {
		return feeduedate;
	}
	
	public void setreceipt(String receipt) {
		this.receipt = receipt;
	}
	public String getreceipt() {
		return receipt;
	}
}
