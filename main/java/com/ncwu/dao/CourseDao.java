package com.ncwu.dao;


import java.util.List;

import tk.mybatis.mapper.common.Mapper;

import com.ncwu.model.Course;

public interface CourseDao extends Mapper<Course> {

	List<Course> selectCourseByTeacher(Integer teacherId);
}
