package com.ncwu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping(value="system")
public class SystemController {

	@RequestMapping(value="chengePage",method=RequestMethod.POST)
	public String test(@RequestParam String path) {
		return path;
	}
	
	@RequestMapping(value="admin")
	public String loadAdmin(Model model) {
		return "admin-main";
	}
	
	@RequestMapping(value="teacher")
	public String loadTeacher(Model model) {
		return "teacher-main";
	}
	
	@RequestMapping(value="student")
	public String loadStudent(Model model) {
		return "student-main";
	}
	
	
}
