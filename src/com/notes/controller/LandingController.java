package com.notes.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LandingController{

	@RequestMapping("/")
	public ModelAndView loadLanding(HttpSession session) {
		if(session.getAttribute("me")==null) {
			ModelAndView modelandview = new ModelAndView("index");
			return modelandview;
		} else {
			return new ModelAndView("redirect:/myfeed");
		}
	}
	
}
