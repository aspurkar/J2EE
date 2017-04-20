package com.aditya.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;



@Component
public class JobVO implements Serializable {
	
	@Override
	public String toString() {
		return "JobVO [id=" + id + ", username=" + username + ", type=" + type
				+ ", discription=" + discription + ", rate=" + rate + ", neg="
				+ neg + ", hrs=" + hrs + ", location=" + location + ", status="
				+ status + ", contractor=" + contractor + "]";
	}
	public int id;
	public String username;
	public String type;
	public String discription;
	public String rate;
	public String neg;
	public String hrs;
	public String location;
	public String status;
	public String contractor;
	
	public JobVO(String username, String type, String discription, String rate,
			String neg, String hrs, String location, String status, String contractor) {
		super();
		this.username = username;
		this.type = type;
		this.discription = discription;
		this.rate = rate;
		this.neg = neg;
		this.hrs = hrs;
		this.location = location;
		this.status = status;
		this.contractor = contractor;
	}
	public JobVO() {
		super();
	}
	
	public int getId(){
		return id;
	}
	
	public void setId(int id){
		this.id=id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public String getNeg() {
		return neg;
	}
	public void setNeg(String neg) {
		this.neg = neg;
	}
	public String getHrs() {
		return hrs;
	}
	public void setHrs(String hrs) {
		this.hrs = hrs;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getContractor() {
		return contractor;
	}
	public void setContractor(String contractor) {
		this.contractor = contractor;
	}
	
	
	
	
}
