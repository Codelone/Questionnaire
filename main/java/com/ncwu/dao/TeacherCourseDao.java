package com.ncwu.dao;

import java.util.List;

import tk.mybatis.mapper.common.Mapper;

import com.ncwu.model.TeacherCourse;

public interface TeacherCourseDao extends Mapper<TeacherCourse>{
	
	List<TeacherCourse> selectCourse(Integer teacherId);
	
	/**
	 * 检查某课程有几个老师在教
	 * @param courseId
	 * @return
	 */
	Integer selectCourseCount(Integer courseId);
	
	Integer insertOne(TeacherCourse teacherCourse);
	
	Integer selectCountByTeacherId(Integer teacherId);
}
