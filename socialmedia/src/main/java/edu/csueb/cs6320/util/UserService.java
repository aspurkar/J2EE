/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.csueb.cs6320.util;

import edu.csueb.cs6320.bean.User;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Service;


@Service
public class UserService {
    //@PersistenceContext
    //EntityManager em;
    
    public List<User> getUsers(){
    	EntityManager em = Persistence.createEntityManagerFactory("TestPU").createEntityManager();
    	em.getTransaction().begin();
        List<User> users = em.createQuery("Select u From User u",User.class).getResultList();
        em.getTransaction().commit();
        return users;
    }
    
    public User getUser(String email){
    	EntityManager em = Persistence.createEntityManagerFactory("TestPU").createEntityManager();
    	em.getTransaction().begin();
    	String query = "Select u From User u where email='" + email + "'";
        User user = em.createQuery(query, User.class).getSingleResult();
        em.getTransaction().commit();
        return user;
    }
    
    
    
    public void delete(User user){
    	EntityManager em = Persistence.createEntityManagerFactory("TestPU").createEntityManager();

        em.getTransaction().begin();
        Query createQuery = em.createQuery("delete from User where id =:id");
        createQuery.setParameter("id", user.getId());
        createQuery.executeUpdate();
        em.getTransaction().commit();
    }
    
    public void update(String id, String firstName, String lastName, String email){
    	EntityManager em = Persistence.createEntityManagerFactory("TestPU").createEntityManager();
    	em.getTransaction().begin();
    	System.out.println("firstname: " + firstName + "lastName: " + lastName + "email: " + email + "id: " + id);
    	Query createQuery = em.createQuery("UPDATE User SET firstName =:firstName, lastName =:lastName,"
    			+ "email =:email where id =:id");
    	createQuery.setParameter("firstName", firstName);
    	createQuery.setParameter("lastName", lastName);
    	createQuery.setParameter("email", email);
    	createQuery.setParameter("id", Integer.parseInt(id));
    	
        createQuery.executeUpdate();
        em.getTransaction().commit();
    }
    
    public void add(User user) {
    	EntityManager em = Persistence.createEntityManagerFactory("TestPU").createEntityManager();
        em.getTransaction().begin();
        em.persist(user);
        em.getTransaction().commit();
    }
}

