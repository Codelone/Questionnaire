package com.ncwu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.mapper.entity.Example;

import com.ncwu.dao.StudentCourseDao;
import com.ncwu.dao.TeacherCourseDao;
import com.ncwu.model.StudentCourse;
import com.ncwu.model.TeacherCourse;

@Service
public class TeacherCourseService {

	@Autowired
	private TeacherCourseDao teacherCourseDao;
	
	@Autowired
	private StudentCourseDao studentCourseDao;
	
	public Integer insertOne(TeacherCourse teacherCourse){
		return this.teacherCourseDao.insertOne(teacherCourse);
	}
	
	public List<TeacherCourse> selectCourses(Integer teacherId){
		return this.teacherCourseDao.selectCourse(teacherId);
	}
	
	public Integer deleteOne(Integer tcId){
		Example example = new Example(StudentCourse.class);
		example.createCriteria().andEqualTo("teacherCourseId", tcId);
		if (this.studentCourseDao.selectCountByExample(example) != 0) {
			return 0;
		}else{
			return this.teacherCourseDao.deleteByPrimaryKey(tcId);
		}
	}
}
