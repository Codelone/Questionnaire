package com.ncwu.dao;

import java.util.List;

import tk.mybatis.mapper.common.Mapper;

import com.ncwu.model.Teacher;

public interface TeacherDao extends Mapper<Teacher>{
	
	List<Teacher> listTeacher(String name,Integer startIndex,Integer pageSize);
}
