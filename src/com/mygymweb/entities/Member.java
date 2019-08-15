package com.mygymweb.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;


@Entity
@Table
@NamedQueries ({
@NamedQuery (query = "SELECT e FROM Member e", name = "queryMembersAll"),
//@NamedQuery (query = "Select e.visits From Member e WHERE e.id = :pid", name = "queryVisitsHistory"),
@NamedQuery (query = "Select e.courses From Member e WHERE e.id = :pid", name = "queryMemberCourses")
})
public class Member {

	@Id
	@Column(name = "membershipid")
	private int id;

	@Basic
	@Column(name = "firstname")
	@Size(min = 2, max = 20, message = "First name length must be between {2} and {1}")
	private String fName;
	
	@Basic
	@Column(name = "lastname")
//	@Size(min = 2, max = 20, message = "First name length must be between {2} and {1}")
	private String lName;
	
	@Basic
	@Column(name = "email")
	private String email;
	
	@Basic
	@Column(name = "password")
	private String pass;
	
	@Basic
	@Column(name = "role")
	private String role = "Member";
	
	@OneToMany
	private List<Course> courses = new ArrayList<Course>();
	
	@OneToMany
	private List<Trainer> trainers = new ArrayList<Trainer>();
	
//	@OneToMany
//	private List<Visits> visits = new ArrayList<Visits>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}

	public List<Trainer> getTrainers() {
		return trainers;
	}

	public void setTrainers(List<Trainer> trainers) {
		this.trainers = trainers;
	}

	public Member(int id, String fName, String lName, String email, String pass, String role, List<Course> courses,
			List<Trainer> trainers) {
		super();
		this.id = id;
		this.fName = fName;
		this.lName = lName;
		this.email = email;
		this.pass = pass;
		this.role = role;
		this.courses = courses;
		this.trainers = trainers;
	}

	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return String.format("%-6s%-20s%-20s%-20s", id, fName + " " + lName, email, pass);
	}
}
