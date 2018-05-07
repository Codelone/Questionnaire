package com.ncwu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

import com.ncwu.dao.StudentCourseDao;
import com.ncwu.model.StudentCourse;

@Service
public class StudentCourseService {

	@Autowired
	private StudentCourseDao studentCourseDao;
	
	public List<StudentCourse> selectByTC(Integer tcId){
		Example example = new Example(StudentCourse.class);
		Criteria criteria = example.createCriteria();
		criteria.andEqualTo("teacherCourseId", tcId);
		return this.studentCourseDao.selectByExample(example);
	}
	
	public Integer insertOne(StudentCourse studentCourse){
		return this.studentCourseDao.insert(studentCourse);
	}
	
	public Integer deleteOne(Integer scId){
		return this.studentCourseDao.deleteByPrimaryKey(scId);
	}
}
