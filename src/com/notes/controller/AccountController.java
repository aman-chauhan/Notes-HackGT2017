package com.notes.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.notes.model.Note;
import com.notes.model.Student;
import com.notes.template.StudentJDBC;

@Controller
public class AccountController {

	@Autowired
	private StudentJDBC jdbcobject;

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	@ResponseBody
	public String createNewAccount(@RequestParam("inputfirstname") String firstname,
			@RequestParam("inputlastname") String lastname, @RequestParam("inputemail") String email,
			@RequestParam("inputpassword") String password) {

		Student student = new Student();
		student.setFirst_name(firstname);
		student.setLast_name(lastname);
		student.setEmail(email);
		student.setPassword(password);

		jdbcobject.insert(student);
		return "success:" + student.getEmail();
	};

	@RequestMapping(value = "/myfeed", method = RequestMethod.GET)
	public ModelAndView displayMyFeed(HttpSession session) {
		List<Note> mynotes = jdbcobject.listOfNotesByMe(((Student) session.getAttribute("me")).getStudent_id());
		List<Note> notesfromcourses = jdbcobject
				.listOfNotesFromCoursesILike(((Student) session.getAttribute("me")).getStudent_id());
		List<Note> notesfromstudents = jdbcobject
				.listOfNotesFromStudentsIFollow(((Student) session.getAttribute("me")).getStudent_id());
		ModelAndView mav = new ModelAndView("myfeed");
		mav.addObject("notesbyme", mynotes);
		mav.addObject("notesfromcourses", notesfromcourses);
		mav.addObject("notesfromstudents", notesfromstudents);
		return mav;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginToSystemWeb(@RequestParam("loginemail") String email,
			@RequestParam("loginpassword") String password, HttpSession session) {
		Student student = jdbcobject.getStudentbyLogin(email, password);
		if (student != null) {
			session.setAttribute("me", student);
			if (session.getAttribute("loginerror") != null) {
				session.removeAttribute("loginerror");
			}
			return new ModelAndView("redirect:/myfeed");
		} else {
			session.setAttribute("loginerror", "Incorrect E-Mail or Password.");
			return new ModelAndView("redirect:/");
		}
	}

	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public ModelAndView logoutOfSystemWeb(HttpSession session) {
		session.removeAttribute("me");
		return new ModelAndView("redirect:/");
	}
	
	@RequestMapping(value = "/loginmobile", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, String> loginToSystemMobile(@RequestParam("inputemail") String email,
			@RequestParam("inputpassword") String password) {
		System.out.println(email + " " + password);
		Student student = jdbcobject.getStudentbyLogin(email, password);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", Integer.toString(student.getStudent_id()));
		map.put("email", student.getEmail());
		map.put("password", student.getPassword());
		return map;
	}

	@RequestMapping(value = "/myfriends", method = RequestMethod.GET)
	public ModelAndView showStudentFollowers(HttpSession session) {
		List<Student> ifollow = jdbcobject
				.listOfStudentsIFollow(((Student) session.getAttribute("me")).getStudent_id());
		List<Student> followme = jdbcobject
				.listOfStudentsWhoFollowMe(((Student) session.getAttribute("me")).getStudent_id());
		ModelAndView mav = new ModelAndView("myfriends");
		return mav;
	}

}
