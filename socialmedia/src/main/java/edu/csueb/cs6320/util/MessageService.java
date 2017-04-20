package edu.csueb.cs6320.util;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Service;

import edu.csueb.cs6320.bean.Message;
import edu.csueb.cs6320.bean.User;

@Service
public class MessageService {

	public List<Message> getSentMessages(String username) {
		EntityManager em = Persistence.createEntityManagerFactory("TestPU").createEntityManager();
		em.getTransaction().begin();
		
		String query = "Select m From Message m Where sender='" + username + "'";
		List<Message> messages = em.createQuery(query, Message.class).getResultList();
		em.getTransaction().commit();
		return messages;
	}
	
	public List<Message> getReceivedMessagesByEmail(String username) {
		EntityManager em = Persistence.createEntityManagerFactory("TestPU").createEntityManager();
		em.getTransaction().begin();
		
		String query = "Select m From Message m Where receiver='" + username + "'";
		List<Message> messages = em.createQuery(query, Message.class).getResultList();
		em.getTransaction().commit();
		return messages;
	}
	
	public List<Message> getReceivedMessagesByID(String userID) {
		EntityManager em = Persistence.createEntityManagerFactory("TestPU").createEntityManager();
		em.getTransaction().begin();
		
		String query = "Select m From Message m Where id='" + userID + "'";
		List<Message> messages = em.createQuery(query, Message.class).getResultList();
		em.getTransaction().commit();
		return messages;
	}
	
	public Message getMessage(String msgID) {
		EntityManager em = Persistence.createEntityManagerFactory("TestPU").createEntityManager();
		em.getTransaction().begin();
		
		String query = "Select m From Message m Where id='" + msgID + "'";
		Message message = em.createQuery(query, Message.class).getSingleResult();
		em.getTransaction().commit();
		return message;
	}

	public void delete(int userID) {
		EntityManager em = Persistence.createEntityManagerFactory("TestPU").createEntityManager();

		em.getTransaction().begin();	
		Query createQuery = em.createQuery("delete from Message where id =:id");
        createQuery.setParameter("id", userID);
        createQuery.executeUpdate();
        em.getTransaction().commit();
	}

	public void update(Message msg) {
		EntityManager em = Persistence.createEntityManagerFactory("TestPU").createEntityManager();

		em.getTransaction().begin();
		em.persist(msg);
		em.getTransaction().commit();
	}

	public void add(Message msg) {
		EntityManager em = Persistence.createEntityManagerFactory("TestPU").createEntityManager();
		em.getTransaction().begin();
		em.persist(msg);
		em.getTransaction().commit();
	}
}
