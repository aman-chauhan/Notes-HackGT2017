package com.notes.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.notes.model.Alert;
import com.notes.model.Course;
import com.notes.model.Note;
import com.notes.model.Student;
import com.notes.template.CourseJDBC;
import com.notes.template.StudentJDBC;

@Controller
public class AccountController {

	@Autowired
	private StudentJDBC studentjdbcobject;
	@Autowired
	private CourseJDBC coursejdbcobject;

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

		studentjdbcobject.insert(student);
		return "success:" + student.getEmail();
	};

	@RequestMapping(value = "/myfeed", method = RequestMethod.GET)
	public ModelAndView displayMyFeed(HttpSession session) {
		if (session.getAttribute("me") == null) {
			return new ModelAndView("redirect:/");
		} else {
			List<Note> mynotes = studentjdbcobject.listOfNotesByMe(((Student) session.getAttribute("me")).getStudent_id(), 1);
			List<Note> mydrafts = studentjdbcobject.listOfNotesByMe(((Student) session.getAttribute("me")).getStudent_id(), 0);
			List<Note> notesfromcourses = studentjdbcobject
					.listOfNotesFromCoursesILike(((Student) session.getAttribute("me")).getStudent_id());
			List<Note> notesfromstudents = studentjdbcobject
					.listOfNotesFromStudentsIFollow(((Student) session.getAttribute("me")).getStudent_id());
			List<Course> courselist = coursejdbcobject
					.listOfCoursesOfStudent(((Student) session.getAttribute("me")).getStudent_id());
			ModelAndView mav = new ModelAndView("myfeed");
			mav.addObject("courselist", courselist);
			mav.addObject("notesbyme", mynotes);
			mav.addObject("mydrafts", mydrafts);
			mav.addObject("notesfromcourses", notesfromcourses);
			mav.addObject("notesfromstudents", notesfromstudents);
			return mav;
		}
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView loginToSystemWeb(@RequestParam("loginemail") String email,
			@RequestParam("loginpassword") String password, HttpSession session) {
		Student student = studentjdbcobject.getStudentbyLogin(email, password);
		if (student != null) {
			session.setAttribute("me", student);
			if (session.getAttribute("alert") != null) {
				session.removeAttribute("alert");
			}
			return new ModelAndView("redirect:/myfeed");
		} else {
			Alert msg = new Alert();
			msg.setType("warning");
			msg.setMain("Error");
			msg.setText("Incorrect E-Mail or Password.");
			session.setAttribute("alert", msg);
			return new ModelAndView("redirect:/");
		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logoutOfSystemWeb(HttpSession session) {
		session.removeAttribute("me");
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/loginmobile", method = RequestMethod.POST)
	public ModelAndView loginToSystemMobile(@RequestParam("inputemail") String email,
			@RequestParam("inputpassword") String password, HttpSession session) {
		Student student = studentjdbcobject.getStudentbyLogin(email, password);
		if (student != null) {
			session.setAttribute("me", student);
			if (session.getAttribute("alert") != null) {
				session.removeAttribute("alert");
			}
			return new ModelAndView("redirect:/uploadfromimage");
		} else {
			Alert msg = new Alert();
			msg.setType("warning");
			msg.setMain("Error");
			msg.setText("Incorrect E-Mail or Password.");
			session.setAttribute("alert", msg);
			return new ModelAndView("redirect:/upload");
		}
	}

	@RequestMapping(value = "/myfriends", method = RequestMethod.GET)
	public ModelAndView showStudentFollowers(HttpSession session) {
		if (session.getAttribute("me") == null) {
			return new ModelAndView("redirect:/");
		} else {
			List<Student> ifollow = studentjdbcobject
					.listOfStudentsIFollow(((Student) session.getAttribute("me")).getStudent_id());
			List<Student> followme = studentjdbcobject
					.listOfStudentsWhoFollowMe(((Student) session.getAttribute("me")).getStudent_id());
			ModelAndView mav = new ModelAndView("myfriends");
			mav.addObject("followme", followme);
			mav.addObject("ifollow", ifollow);
			return mav;
		}
	}

}
