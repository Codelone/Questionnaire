package com.ncwu.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ncwu.dao.CourseDao;
import com.ncwu.dao.TeacherCourseDao;
import com.ncwu.model.Course;

import tk.mybatis.mapper.entity.Example;

@Service
public class CourseService {

	@Autowired
	private CourseDao courseDao;
	
	@Autowired
	private TeacherCourseDao teacherCourseDao;
	
	/**
	 * 通过分类id获取课程
	 * @param categoryId
	 * @return
	 */
	public List<Course> getList(Integer categoryId){
		Example example = new Example(Course.class);
		example.createCriteria().andEqualTo("categoryId", categoryId);
		return this.courseDao.selectByExample(example);
	}

	public List<Course> getListByTeacher(Integer teacherId){
		return this.courseDao.selectCourseByTeacher(teacherId);
		
	}
	
	public Integer deleteOne(Integer courseId){
		// 需要检查课程是否有人在教  有则不能删
		if(this.teacherCourseDao.selectCourseCount(courseId) == 0){
			return this.courseDao.deleteByPrimaryKey(courseId);
		}else {
			return 0;
		}
	}
	
	public Integer insertOne(Course course){
		return this.courseDao.insert(course);
	}
}
