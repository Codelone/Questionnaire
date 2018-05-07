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
import com.ncwu.model.Category;
import com.ncwu.model.Course;
import com.ncwu.model.User;
import com.ncwu.service.CategoryService;
import com.ncwu.service.CourseService;

@Controller
public class CourseController {

	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private CourseService courseService;
	
	@RequestMapping(path="/category/list",method=RequestMethod.GET)
	@ResponseBody
	public JSONObject getCategorys(){
		JSONObject jsonObject = new JSONObject();
		List<Category> categories = categoryService.getList();
		jsonObject.put("categorys", categories);
		return jsonObject;
	}
	
	
	@RequestMapping(path="/course/list",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject getCourseByCategoryId(@RequestBody JSONObject param){
		List<Course> courses = this.courseService.getList(param.getInteger("categoryId"));
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("courses", courses);
		return jsonObject;
	}
	
	@RequestMapping(path="/course/delete/{courseId}",method=RequestMethod.GET)
	@ResponseBody
	public JSONObject deleteCourse(@PathVariable("courseId") Integer courseId){
		
		JSONObject jsonObject = new JSONObject();
		if (this.courseService.deleteOne(courseId) != 0) {
			jsonObject.put("success", true);
		}else {
			jsonObject.put("success", false);			
		}
		return jsonObject;
	}
	
	@RequestMapping(path="/course/add",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject addCourse(@RequestBody JSONObject param){
		Course course = new Course();
		course.setCategoryId(param.getInteger("categoryId"));
		course.setCourseName(param.getString("courseName"));
		JSONObject jsonObject = new JSONObject();
		if (this.courseService.insertOne(course) != 0) {
			jsonObject.put("success", true);
		}else{
			jsonObject.put("success", false);			
		}
		return jsonObject;
	}
	
	@RequestMapping(path="/courseByTeacher",method=RequestMethod.GET)
	@ResponseBody
	public JSONObject getCourseByTeacherId(HttpSession session){
		
		User user = (User) session.getAttribute("user");
		List<Course> courses = this.courseService.getListByTeacher(Integer.valueOf(user.getUsername()));
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("courses", courses);
		return jsonObject;
	}
	
}
