package edu.csueb.cs6320.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Message {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String sender;
	private String receiver;
	private String message;
	private String title;
	
	public Message() {
		
	}
	
	public Message(int id, String sender, String receiver, String title, String message) {
		this.id = id;
		this.sender = sender;
		this.receiver = receiver;
		this.message = message;
		this.title = title;
	}
	
	public Message(String sender, String receiver, String title, String message) {
		this.sender = sender;
		this.receiver = receiver;
		this.message = message;
		this.title = title;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getSender() {
		return sender;
	}
	
	public void setSender(String sender) {
		this.sender = sender;
	}
	
	public String getReceiver() {
		return receiver;
	}
	
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	
	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
}
