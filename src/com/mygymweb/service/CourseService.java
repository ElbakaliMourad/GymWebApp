package com.mygymweb.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import javax.persistence.Query;

import com.mygymweb.dao.CourseDAO;
import com.mygymweb.entities.Course;
import com.mygymweb.entities.Member;

public class CourseService implements CourseDAO {

	@Override
	public List<Course> getAllClasses() {
		List<Course> itemsList = new ArrayList<>();		
		EntityManagerFactory entitymanagerfactory = Persistence.createEntityManagerFactory("mygymweb");
		EntityManager entitymanager = entitymanagerfactory.createEntityManager();
		
//		Query query = entitymanager.createQuery("SELECT e FROM Course e");
		Query query = entitymanager.createNamedQuery("queryCoursesAll");
		itemsList = query.getResultList();
		
		entitymanager.close();
		entitymanagerfactory.close();
		
		return itemsList;
	}

	@Override
	public boolean classInsert(Course course) {
		boolean result = true;
		
		EntityManagerFactory entitymanagerfactory = Persistence.createEntityManagerFactory("mygymweb");
		EntityManager entitymanager = entitymanagerfactory.createEntityManager();
		try {		
		entitymanager.getTransaction().begin();		
		entitymanager.persist(course);		
		entitymanager.getTransaction().commit();

		} catch(PersistenceException e) {
				e.getMessage();
				result = false;
		}
		finally {
			entitymanager.close();
			entitymanagerfactory.close();
		}		
		return result;
	}

	@Override
	public Course getClassById(int id) {
		Course foundClass = null;

		EntityManagerFactory entitymanagerfactory = Persistence.createEntityManagerFactory("mygymweb");
		EntityManager entitymanager = entitymanagerfactory.createEntityManager();
		try {
			foundClass = entitymanager.find(Course.class, id);

		} catch (PersistenceException e) {
			e.printStackTrace();
		} 
			entitymanager.close();
			entitymanagerfactory.close();

		return foundClass;
	}

	@Override
	public boolean updateClass(Course course) {
		
		boolean result = true;
		
		EntityManagerFactory entitymanagerfactory = Persistence.createEntityManagerFactory("mygymweb");
		EntityManager entitymanager = entitymanagerfactory.createEntityManager();
		try {		
		entitymanager.getTransaction().begin();	
		
		Course courseFound = entitymanager.find(Course.class, course.getId());				
		courseFound.setName(course.getName());
						
		entitymanager.getTransaction().commit();

		} catch(PersistenceException e) {
				e.printStackTrace();
				result = false;
		}
			entitymanager.close();
			entitymanagerfactory.close();	
		return result;
	}

	@Override
	public boolean removeClass(int id) {
		boolean result = true;
		
		EntityManagerFactory entitymanagerfactory = Persistence.createEntityManagerFactory("mygymweb");
		EntityManager entitymanager = entitymanagerfactory.createEntityManager();
		try {		
		entitymanager.getTransaction().begin();	
		
		Course foundClass = entitymanager.find(Course.class, id);
		entitymanager.remove(foundClass);	
		
		entitymanager.getTransaction().commit();

		} catch(PersistenceException e) {
				e.printStackTrace();
				result = false;
		}
		finally {
			entitymanager.close();
			entitymanagerfactory.close();
		}		
		return result;
	}

	public boolean classAdd(int id) {
		// TODO Auto-generated method stub
		return false;
	}
}
