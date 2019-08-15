package com.mygymweb.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mygymweb.entities.Course;
import com.mygymweb.entities.Member;
import com.mygymweb.entities.Trainer;
import com.mygymweb.service.CourseService;
import com.mygymweb.service.MemberService;
import com.mygymweb.service.TrainerService;

@Controller
@SessionAttributes("sUser")
public class IndexController {

	@RequestMapping("member")
	public Member setMember() {
		return new Member();
	}

	@RequestMapping("logout")
	public String logOut() {
		return ("logout");
	}

	@RequestMapping(value = { "/", "/index" })
	public ModelAndView showIndex() {
		return new ModelAndView("index");
	}

	@RequestMapping("/about")
	public ModelAndView showAbout() {
		return new ModelAndView("about");
	}

	@RequestMapping("/contactUs")
	public ModelAndView showContactUs() {
		return new ModelAndView("contactUs");
	}

	@RequestMapping("/signUp")
	public ModelAndView signUp() {
		ModelAndView mav = new ModelAndView("memberSignUp");
		mav.addObject("userkey", new Member());
		return mav;
	}

	// To register new members
	@RequestMapping("/addMember")
	public ModelAndView insertMember(@ModelAttribute("userkey") Member member) {

		ModelAndView mav = new ModelAndView();

		MemberService memberService = new MemberService();
		boolean result = memberService.registerMember(member);

		String registrationMessage = result ? "Member Registered!"
				: "Membership id does not exist in our databse, or this member account already exists!";

		mav.addObject("registrationMessage", registrationMessage);
		mav.setViewName("memberLogIn");
		return mav;
	}

	@RequestMapping("/logIn") // this is the url from the page link
	public ModelAndView getMyFormGET() {
		return new ModelAndView("memberLogIn"); // This is the file name of the view
	}

	// To login
	@RequestMapping(value = "/myform", method = RequestMethod.POST)
	public ModelAndView getMyForm(@RequestParam("id") int id, @RequestParam("password") String password) {

		ModelAndView mav = new ModelAndView();

		MemberService memberService = new MemberService();
		Member foundMember = new Member();
		foundMember = memberService.validateMember(id, password);

		// In case login information are not correct.
		if (foundMember == null) {
			mav = new ModelAndView("memberLogIn");
			String message = "Unmatched Credentials, Please try again!";

			mav.addObject("viewMessage", message);
			mav.setViewName("memberLogIn");
		}

		// If successfully loged in.
		else {
			List<Course> courseList = foundMember.getCourses();

			mav = new ModelAndView("memberProfile");

			mav.addObject("id", id);
			mav.addObject("fName", foundMember.getfName());
			mav.addObject("lName", foundMember.getlName());
			mav.addObject("email", foundMember.getEmail());
			mav.addObject("password", password);
			mav.addObject("courseList", courseList);
			mav.addObject("role", foundMember.getRole());

			// If a regular member, send them to the Member Profile
			if (foundMember.getRole().equals("Member")) {
				// If the member is not registered to any class, show them a message.
				if (courseList.isEmpty()) {
					String courseMessage = "You have no courses!";
					mav.addObject("courseMessage", courseMessage);
				}
			}

			// if an admin logs in, send them to the Admin Profile
			else if (foundMember.getRole().equals("Admin")) {
				courseList.isEmpty();
				mav.addObject("courseList", courseList);
				mav.setViewName("adminProfile");
			}
		}
		return mav;
	}

	// handels request for updating specefic profile (by member id).
	@RequestMapping("/updateProfile/{urlId}")
	public ModelAndView updateProfile(@PathVariable("urlId") int Id) {
		MemberService memberService = new MemberService();
		Member foundMember = memberService.getMemberById(Id);
		ModelAndView mav = new ModelAndView("editProfile");
		mav.addObject("member", foundMember);

		return mav;
	}

	@RequestMapping("/saveProfile")
	public ModelAndView saveProfile(@ModelAttribute Member member) {

		MemberService memberService = new MemberService();
		boolean result = memberService.updateMemberProfile(member);

		List<Member> memberList = memberService.getAllMembers();

		String message = result ? "Member Updated: Id# " + member.getId() : "Member not updated";

		ModelAndView mav = new ModelAndView("memberProfile");
		mav.addObject("id", member.getId());
		mav.addObject("fName", member.getfName());
		mav.addObject("lName", member.getlName());
		mav.addObject("email", member.getEmail());
		mav.addObject("pass", member.getPass());
		mav.addObject("role", member.getRole());
		mav.addObject("messageResult", message);
		mav.addObject("memberList", memberList);

		return mav;
	}

	@RequestMapping("/showAllClasses")
	public ModelAndView showAllClasses() {

		CourseService courseService = new CourseService();
		List<Course> courseList = courseService.getAllClasses();

		ModelAndView mav = new ModelAndView("allClasses");

		mav.addObject("courseList", courseList);

		return mav;
	}

	@RequestMapping("/showAllMembers")
	public ModelAndView showAllMembers() {

		MemberService memberService = new MemberService();
		List<Member> memberList = memberService.getAllMembers();

		ModelAndView mav = new ModelAndView("allMembers");

		mav.addObject("memberList", memberList);
		mav.setViewName("allMembers");

		return mav;
	}

	@RequestMapping("/showAllTrainers")
	public ModelAndView showAllTrainers() {

		TrainerService trainerService = new TrainerService();
		List<Trainer> trainerList = trainerService.getAllTrainers();

		ModelAndView mav = new ModelAndView("allTrainers");

		mav.addObject("trainerList", trainerList);
		mav.setViewName("allTrainers");

		return mav;
	}

	@RequestMapping("/classesAvailable")
	public ModelAndView registerToClass(@ModelAttribute Member member, Course course) {

		CourseService courseService = new CourseService();
		List<Course> courseList = courseService.getAllClasses();

		ModelAndView mav = new ModelAndView("membersClasses");

		mav.addObject("courseList", courseList);

		return mav;
	}

	//Handles request for create new class page.
	@RequestMapping("/createClass")
	public ModelAndView createClass() {
		return new ModelAndView("createNewClass");
	}

	// after getting the variables from the From @ createNewClass, 
	// the new course get inserted to the databse, then it redirects to the showAllClasses handler 
	@RequestMapping("/addClass")
	public ModelAndView insertClass(@ModelAttribute Course course) {
		ModelAndView mav = new ModelAndView();
		
		CourseService classService = new CourseService();
		boolean result = classService.classInsert(course); // uses the classInsert methode in the CourseService class, to persist the data to the tables.
		
		String message = result?"Class created":"Try again, Not saved";
		
		mav.addObject("messageResult", message);
		
		mav.addObject("id", course.getId());
		mav.addObject("name", course.getName());
		mav.setViewName("redirect:/showAllClasses");
		
		return mav;
	}
	
	// handles adding a course to the member courses list.
	@RequestMapping("/addClass/{urlId}")
	public ModelAndView addClass(@PathVariable("urlId") int Id) {
		ModelAndView mav = new ModelAndView();
		
		CourseService classService = new CourseService();
		boolean result = classService.classAdd(Id); // uses the classAdd methode in the CourseService class, to persist the data to the member courses list.
		
		String message = result?"Class added":"Try again, Not added";
		
		mav.addObject("messageResult", message);
		
		mav.addObject("id", Id);
		mav.setViewName("redirect:/showAllClasses");
		
		return mav;
	}
	 
	//Handles request to updat the specified class(by id number) and then takes the user to the edit class page
	@RequestMapping("/updateClasses/{urlId}")
	public ModelAndView updateClass(@PathVariable("urlId") int Id) {

		CourseService courseService = new CourseService();
		Course foundCourse = courseService.getClassById(Id);

		ModelAndView mav = new ModelAndView("editClass");
		mav.addObject("course", foundCourse);
		mav.setViewName("editClass");

		return mav;
	}

	//Handles request to save the updated class and return the the all classes page
	@RequestMapping("/saveClass")
	public ModelAndView saveClass(@ModelAttribute Course course) {

		CourseService courseService = new CourseService();
		boolean result = courseService.updateClass(course); // uses the updateClass methode in the CourseService class

		List<Course> courseList = courseService.getAllClasses();

		String message = result ? "Class Updated: Id# " + course.getId() : "Class not updated";

		ModelAndView mav = new ModelAndView("allClasses");

		mav.addObject("courseMessage", message);
		mav.addObject("courseList", courseList);

		return mav;
	}

	//Handles request to remove a selected Course by admin
	@RequestMapping("/removeClass/{id}")
	public ModelAndView deleteClass(@PathVariable int id) {

		CourseService courseService = new CourseService();
		boolean result = courseService.removeClass(id);

		String message = result ? "Class Removed: " + id : "Class not deleted yet: " + id;

		List<Course> courseList = courseService.getAllClasses();

		ModelAndView mav = new ModelAndView("allClasses");
		mav.addObject("messageResult", message);
		mav.addObject("courseList", courseList);

		return mav;
	}
	
	
//	//Handles request to remove a course from member list
//	@RequestMapping("/deselectClass/{id}")
//	public ModelAndView deselectClass(@PathVariable int id) {
//
//		MemberService memberService = new MemberService();
//		boolean result = memberService.deselectMemberClass(id);
//
//		String message = result ? "Class successfully Removed: " + id : "Class not removed yet: " + id;
//
//		ModelAndView mav = new ModelAndView("allClasses");
//		mav.addObject("messageResult", message);
//
//		return mav;
//	}
}
