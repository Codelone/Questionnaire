package com.ncwu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ncwu.model.Student;
import com.ncwu.model.User;
import com.ncwu.service.StudentService;

@Controller
@RequestMapping(value="student")
public class StudentController {

	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value="list",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject getStudentList(@RequestBody JSONObject param){
		JSONObject jsonObject = new JSONObject();
		List<Student> students = this.studentService.getList(param.getInteger("studentClass"));
		jsonObject.put("students", students);
		return jsonObject;
	}
	
	@RequestMapping(value="add",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject addStudent(@RequestBody Student student){
		JSONObject jsonObject = new JSONObject();
		if (this.studentService.insertOne(student) != 0) {
			jsonObject.put("success", true);
		}else {
			jsonObject.put("success", false);			
		}
		return jsonObject;
	}
	
	@RequestMapping(value="delete/{studentId}",method=RequestMethod.GET)
	@ResponseBody
	public JSONObject deleteStudent(@PathVariable("studentId") Integer studentId){
		JSONObject jsonObject = new JSONObject();
		if (this.studentService.deleteOne(studentId) != 0) {			
			jsonObject.put("success", true);
		}else {			
			jsonObject.put("success", false);
		}
		return jsonObject;
	}
	
	@RequestMapping(value="getStudent",method=RequestMethod.GET)
	@ResponseBody
	public JSONObject getStudentInfo(HttpSession session){
		JSONObject jsonObject = new JSONObject();
		String username = ((User) session.getAttribute("user")).getUsername();
		Student student = this.studentService.selectOne(Integer.valueOf(username));
		jsonObject.put("student", student);
		return jsonObject;
	}
	
	

	
}
