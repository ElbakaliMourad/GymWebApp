package com.mygymweb.dao;

import java.util.List;

import com.mygymweb.entities.Course;
import com.mygymweb.entities.Member;

public interface MemberDAO {

	boolean registerMember(Member member);

	Member validateMember(int id, String password);

	List<Course> getCourses(int id);

	Member getMemberById(int id);

	boolean updateMemberProfile(Member member);

	List<Member> getAllMembers();

	boolean registerToClass(Member member, Course course);

}
