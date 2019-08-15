package com.mygymweb.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import javax.persistence.Query;

import com.mygymweb.dao.MemberDAO;
import com.mygymweb.entities.Course;
import com.mygymweb.entities.Member;

public class MemberService implements MemberDAO {

	@Override
	public boolean registerMember(Member member) {
		boolean result = true;

		EntityManagerFactory entitymanagerfactory = Persistence.createEntityManagerFactory("mygymweb");
		EntityManager entitymanager = entitymanagerfactory.createEntityManager();
		try {
			entitymanager.getTransaction().begin();
			entitymanager.persist(member);
			entitymanager.getTransaction().commit();

		} catch (PersistenceException e) {
			e.getMessage();
			result = false;
		} finally {
			entitymanager.close();
			entitymanagerfactory.close();
		}
		return result;
	}

	@Override
	public Member validateMember(int id, String password) {
		Member foundMember = null;

		EntityManagerFactory entitymanagerfactory = Persistence.createEntityManagerFactory("mygymweb");
		EntityManager entitymanager = entitymanagerfactory.createEntityManager();
		try {
			foundMember = entitymanager.find(Member.class, id);
			if (foundMember == null) {
				return null;
			}
			String pass = foundMember.getPass();
			if (password.equals(pass)) {
				return foundMember;
			} else {
				System.out.println("\nUnmatched credentials!");
				return null;
			}
		} catch (PersistenceException e) {
			e.getMessage();
			return null;
		} finally {
			entitymanager.close();
			entitymanagerfactory.close();
		}
	}

	@Override
	public List<Course> getCourses(int id) {

		List<Course> courseList = new ArrayList<Course>();
		
		EntityManagerFactory entitymanagerfactory = Persistence.createEntityManagerFactory("mygymweb");
		EntityManager entitymanager = entitymanagerfactory.createEntityManager();
		
//		Query query = entitymanager.createQuery("Select e.courses From Member e WHERE e.id = :pid");
		Query query = entitymanager.createNamedQuery("queryMemberCourses");

		query.setParameter("pid", id);
		courseList = query.getResultList();
		
		entitymanager.close();
		entitymanagerfactory.close();

		return courseList;
	}

	@Override
	public Member getMemberById(int id) {
		Member foundMember = null;

		EntityManagerFactory entitymanagerfactory = Persistence.createEntityManagerFactory("mygymweb");
		EntityManager entitymanager = entitymanagerfactory.createEntityManager();
		try {
			foundMember = entitymanager.find(Member.class, id);

		} catch (PersistenceException e) {
			e.printStackTrace();
		}
		entitymanager.close();
		entitymanagerfactory.close();

		return foundMember;
	}

	@Override
	public boolean updateMemberProfile(Member member) {		
	boolean result = true;
		
	EntityManagerFactory entitymanagerfactory = Persistence.createEntityManagerFactory("mygymweb");
	EntityManager entitymanager = entitymanagerfactory.createEntityManager();
	try {
		entitymanager.getTransaction().begin();

		Member memberFound = entitymanager.find(Member.class, member.getId());
		memberFound.setfName(member.getfName());
		memberFound.setlName(member.getlName());
		memberFound.setEmail(member.getEmail());
		memberFound.setPass(member.getPass());
		memberFound.setRole(member.getRole());

		entitymanager.getTransaction().commit();

	} catch (PersistenceException e) {
		e.printStackTrace();
		result = false;
	}
	entitymanager.close();
	entitymanagerfactory.close();
	return result;
	}

	@Override
	public List<Member> getAllMembers() {
		EntityManagerFactory entitymanagerfactory = Persistence.createEntityManagerFactory("mygymweb");
		EntityManager entitymanager = entitymanagerfactory.createEntityManager();

//	Query query = entitymanager.createQuery("SELECT e FROM Member e");
		Query query = entitymanager.createNamedQuery("queryMembersAll");
		List<Member> membersList = new ArrayList<Member>();
		membersList = query.getResultList();

		entitymanager.close();
		entitymanagerfactory.close();

		return membersList;
	}
	
	@Override
	public boolean registerToClass(Member member, Course course) {
		boolean result = true;
		EntityManagerFactory entitymanagerfactory = Persistence.createEntityManagerFactory("jdbSpringMVC04");
		EntityManager entitymanager = entitymanagerfactory.createEntityManager();
		try {
			entitymanager.getTransaction().begin();
			Member foundMember = entitymanager.find(Member.class, member.getId());
			Course foundCourse = entitymanager.find(Course.class, course.getId());

			if (foundMember.getCourses().contains(foundCourse)) {
				System.out.println("Course Not added! \nYou already registered in this course.");
				return false;
			} else if (foundCourse != null) {
				foundMember.getCourses().add(foundCourse);
				System.out.println("Course added: " + foundCourse.getName());
			} else {
				System.out.println("Course Not added! \nCourse \"" + course.getId() + "\" Does not exist.");
				return false;
			}

			entitymanager.persist(foundMember);
			entitymanager.getTransaction().commit();

		} catch (PersistenceException e) {
			e.getMessage();
		} finally {
			entitymanager.close();
			entitymanagerfactory.close();
		}
		return result;
	}


//	public boolean deselectMemberClass(int id) {
//		EntityManagerFactory entitymanagerfactory = Persistence.createEntityManagerFactory("mygymweb");
//		EntityManager entitymanager = entitymanagerfactory.createEntityManager();
//
//		try {
//			entitymanager.getTransaction().begin();
//
//			Member memberFound = entitymanager.remove((Member.class, course););
//			memberFound.setfName(member.getfName());
//			memberFound.setlName(member.getlName());
//			memberFound.setEmail(member.getEmail());
//			memberFound.setPass(member.getPass());
//			memberFound.setRole(member.getRole());
//
//			entitymanager.getTransaction().commit();
//
//		} catch (PersistenceException e) {
//			e.printStackTrace();
//			result = false;
//		}
//		entitymanager.close();
//		entitymanagerfactory.close();
//		return result;
//	}
}
