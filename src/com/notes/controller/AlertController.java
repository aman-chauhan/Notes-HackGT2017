package com.notes.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AlertController {
	@ResponseBody
	@RequestMapping(value = "/alertdismiss", method = RequestMethod.GET)
	public String dismissAlert(HttpSession session) {
		if(session.getAttribute("alert")!=null) {
			session.removeAttribute("alert");
		}
		return "alert dismissed.";
	}
}
