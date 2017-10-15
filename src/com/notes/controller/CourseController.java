package com.notes.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.notes.model.Course;
import com.notes.model.Student;
import com.notes.template.CourseJDBC;

@Controller
public class CourseController {
	
	@Autowired
	private CourseJDBC jdbcobject;
	
	@RequestMapping(value = "/mycourses", method = RequestMethod.GET)
	public ModelAndView showStudentCourses(HttpSession session) {
		List<Course> courselist = jdbcobject.listOfCoursesOfStudent(((Student) session.getAttribute("me")).getStudent_id());
		ModelAndView mav = new ModelAndView("mycourses");
		return mav;
	}
}
