package com.mygymweb.dao;

import java.util.List;

import com.mygymweb.entities.Course;

public interface CourseDAO {
	
	List<Course> getAllClasses();

	boolean classInsert(Course course);

	boolean updateClass(Course course);

	Course getClassById(int id);

	boolean removeClass(int id);

}
