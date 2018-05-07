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
import com.ncwu.model.StudentCourse;
import com.ncwu.model.Teacher;
import com.ncwu.model.TeacherCourse;
import com.ncwu.model.User;
import com.ncwu.service.StudentCourseService;
import com.ncwu.service.TeacherCourseService;
import com.ncwu.service.TeacherService;
import com.ncwu.vo.PageInfo;

@Controller
@RequestMapping(value="teacher")
public class TeacherController {

	@Autowired
	private TeacherService teacherService;
	
	@Autowired
	private TeacherCourseService teacherCourseService;
	
	@Autowired
	private StudentCourseService studentCourseService;
	
	@RequestMapping(value="list",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject getTeacherList(@RequestBody JSONObject param){
		JSONObject jsonObject = new JSONObject();
		Integer pageNumber = param.getInteger("pageNumber");
		Integer pageSize = param.getInteger("pageSize");
		PageInfo<Teacher> teachers = this.teacherService.selectList(param.getString("teacherName"), pageSize, pageNumber);
		jsonObject.put("teachers", teachers);
		return jsonObject;
	}
	
	@RequestMapping(value="course/{teacherId}",method=RequestMethod.GET)
	@ResponseBody
	public JSONObject getCourseByTeacherId(@PathVariable("teacherId") Integer teacherId){
		
		JSONObject jsonObject = new JSONObject();
		List<TeacherCourse> tc = this.teacherCourseService.selectCourses(teacherId);
		jsonObject.put("tc", tc);
		return jsonObject;
	}
	
	@RequestMapping(value="class/{teacherCourseId}",method=RequestMethod.GET)
	@ResponseBody
	public JSONObject getClassByTC(@PathVariable("teacherCourseId") Integer tcid){
		JSONObject jsonObject = new JSONObject();
		List<StudentCourse> sc = this.studentCourseService.selectByTC(tcid);
		jsonObject.put("sc", sc);
		return jsonObject;
	}
	
	@RequestMapping(value="deleteBytid/{teacherId}",method=RequestMethod.GET)
	@ResponseBody
	public JSONObject deleteTeacher(@PathVariable("teacherId") Integer teacherId){
		JSONObject jsonObject = new JSONObject();
		if (this.teacherService.deleteOne(teacherId) != 0) {			
			jsonObject.put("success", true);
		}else {			
			jsonObject.put("success", false);
		}
		return jsonObject;
	}
		
	@RequestMapping(value="deleteBytcid/{tcId}",method=RequestMethod.GET)
	@ResponseBody
	public JSONObject deleteCourse(@PathVariable("tcId") Integer tcId){
		JSONObject jsonObject = new JSONObject();
		if (this.teacherCourseService.deleteOne(tcId) != 0) {			
			jsonObject.put("success", true);
		}else {			
			jsonObject.put("success", false);
		}
		return jsonObject;
	}
	
	@RequestMapping(value="deleteByscid/{scId}",method=RequestMethod.GET)
	@ResponseBody
	public JSONObject deleteClass(@PathVariable("scId") Integer scId){
		JSONObject jsonObject = new JSONObject();
		if (this.studentCourseService.deleteOne(scId) != 0) {			
			jsonObject.put("success", true);
		}else {			
			jsonObject.put("success", false);
		}
		return jsonObject;
	}
	
	
	@RequestMapping(value="addTeacher",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject addTeacher(@RequestBody JSONObject param){
		JSONObject jsonObject = new JSONObject();
		Teacher teacher = new Teacher();
		teacher.setTeacherName(param.getString("teacherName"));
		teacher.setTeacherNumber(param.getInteger("teacherNumber"));
		if (this.teacherService.insertOne(teacher) != 0){
			jsonObject.put("success", true);
		}else{
			jsonObject.put("success", false);			
		}
		return jsonObject;
	}
	
	@RequestMapping(value="addTC",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject addTeacherCourse(@RequestBody JSONObject param){
		JSONObject jsonObject = new JSONObject();
		TeacherCourse teacherCourse = new TeacherCourse();
		teacherCourse.setCourseId(Integer.valueOf(param.getString("courseId")));
		teacherCourse.setTeacherId(param.getInteger("teacherNumber"));
		if (this.teacherCourseService.insertOne(teacherCourse)  != 0){
			jsonObject.put("success", true);
		}else{
			jsonObject.put("success", false);	
		}
		return jsonObject;
	}
	
	@RequestMapping(value="addTSC",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject addTeacherCourseClass(@RequestBody JSONObject param){
		JSONObject jsonObject = new JSONObject();
		StudentCourse studentCourse = new StudentCourse();
		studentCourse.setTeacherCourseId(param.getInteger("tcid"));
		studentCourse.setStudentClass(param.getInteger("studentClass"));
		if (this.studentCourseService.insertOne(studentCourse)  != 0){
			jsonObject.put("success", true);
		}else{
			jsonObject.put("success", false);	
		}
		return jsonObject;
	}
	
	@RequestMapping(value="getTeacher",method=RequestMethod.GET)
	@ResponseBody
	public JSONObject getStudentInfo(HttpSession session){
		JSONObject jsonObject = new JSONObject();
		String username = ((User) session.getAttribute("user")).getUsername();
		Teacher teacher = this.teacherService.selectOne(Integer.valueOf(username));
		jsonObject.put("teacher", teacher);
		return jsonObject;
	}
	
}
