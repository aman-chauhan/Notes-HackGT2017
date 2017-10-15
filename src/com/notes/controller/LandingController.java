package com.notes.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LandingController{

	@RequestMapping("/")
	public ModelAndView loadLanding() {	
		ModelAndView modelandview = new ModelAndView("index");
		return modelandview;
	}
	
}
