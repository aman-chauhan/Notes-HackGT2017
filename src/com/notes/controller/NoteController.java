package com.notes.controller;

import java.io.IOException;
import java.util.Base64;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.notes.model.Alert;
import com.notes.model.Student;
import com.notes.template.CourseJDBC;
import com.notes.template.NoteJDBC;

@Controller
public class NoteController {

	@Autowired
	private NoteJDBC notejdbcobject;

	@Autowired
	private CourseJDBC coursejdbcobject;

	@RequestMapping(value = "/noteimage", method = RequestMethod.POST)
	public ModelAndView uploadinitialnote(@RequestParam("courseid") String courseid,
			@RequestParam("imageofnote") MultipartFile imageofnote, HttpSession session) {
		try {
			notejdbcobject.createNote(((Student) session.getAttribute("me")).getStudent_id(), courseid,
					Base64.getEncoder().encodeToString(imageofnote.getBytes()));
			Alert msg = new Alert();
			msg.setType("success");
			msg.setMain("Success");
			msg.setText("Your note was added to your collection. You can edit it on your feed.");
			session.setAttribute("alert", msg);
			return new ModelAndView("redirect:/uploadfromimage");
		} catch (IOException e) {
			Alert msg = new Alert();
			msg.setType("danger");
			msg.setMain("Failed");
			msg.setText("There was some error. Please try again.");
			session.setAttribute("alert", msg);
			return new ModelAndView("redirect:/uploadfromimage");
		}
	}

	@RequestMapping(value = "/uploadfromimage", method = RequestMethod.GET)
	public ModelAndView initialnotePage(HttpSession session) {
		if (session.getAttribute("me") == null) {
			return new ModelAndView("redirect:/upload");
		} else {
			ModelAndView model = new ModelAndView("uploadimage");
			model.addObject("courses",
					coursejdbcobject.listOfCoursesOfStudent(((Student) session.getAttribute("me")).getStudent_id()));
			return model;
		}
	}

	@RequestMapping(value = "/edit/note/{id}", method = RequestMethod.POST)
	public ModelAndView editExistingNote(@PathVariable("id") String noteid, @RequestParam("noteTitle") String noteTitle,
			@RequestParam("noteDate") String noteDate, @RequestParam("courseID") String courseID,
			@RequestParam("noteContent") String noteContent, HttpSession session) {
		if (session.getAttribute("me") == null) {
			return new ModelAndView("redirect:/");
		} else {
			int result = notejdbcobject.editNote(((Student) session.getAttribute("me")).getStudent_id(), noteid,
					noteTitle, noteDate, courseID, noteContent);
			if (result == 0) {
				Alert msg = new Alert();
				msg.setType("warning");
				msg.setMain("Failed");
				msg.setText("There was some error. Please try again.");
				session.setAttribute("alert", msg);
			} else {
				Alert msg = new Alert();
				msg.setType("success");
				msg.setMain("Success");
				msg.setText("The note was editted successfully.");
				session.setAttribute("alert", msg);
			}
			return new ModelAndView("redirect:/myfeed");
		}
	}

	@RequestMapping(value = "/submit/note/{id}", method = RequestMethod.POST)
	public ModelAndView submitNote(@PathVariable("id") String noteid, @RequestParam("noteTitle") String noteTitle,
			@RequestParam("noteDate") String noteDate, @RequestParam("noteContent") String noteContent,
			HttpSession session) {
		if (session.getAttribute("me") == null) {
			return new ModelAndView("redirect:/");
		} else {
			int result = notejdbcobject.submitNote(((Student) session.getAttribute("me")).getStudent_id(), noteid,
					noteTitle, noteDate, noteContent);
			if (result == 0) {
				Alert msg = new Alert();
				msg.setType("warning");
				msg.setMain("Failed");
				msg.setText("There was some error. Please try again.");
				session.setAttribute("alert", msg);
			} else {
				Alert msg = new Alert();
				msg.setType("success");
				msg.setMain("Success");
				msg.setText("The note was submitted successfully.");
				session.setAttribute("alert", msg);
			}
			return new ModelAndView("redirect:/myfeed");
		}
	}
}
