package com.notes.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.notes.template.NoteJDBC;

@Controller
public class NoteController {

	@Autowired
	private NoteJDBC jdbcobject;

	@ResponseBody
	@RequestMapping(value = "/noteimage", method = RequestMethod.POST)
	public HashMap<String, String> uploadinitialnote(@RequestParam("studentid") String studentid,
			@RequestParam("courseid") String courseid, @RequestParam("base64string") String base64string) {
		jdbcobject.createNote(studentid, courseid, base64string);
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("msg", "success");
		return map;
	}
}
