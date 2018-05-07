package com.ncwu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.mapper.entity.Example;

import com.ncwu.dao.StudentDao;
import com.ncwu.model.Student;

@Service
public class StudentService {

	@Autowired
	private StudentDao studentDao;
	
	@Autowired
	private UserService userService;
	
	public List<Student> getList(Integer studentClass){
		Example example = new Example(Student.class);
		example.createCriteria().andEqualTo("studentClass", studentClass);			
		return this.studentDao.selectByExample(example);
		
	}
	
	public Integer insertOne(Student student) {
		
		this.studentDao.insert(student);
		this.userService.insertOne(student.getStudentNumber(), 2);
		return student.getStudentId();
	}
	
	public Integer deleteOne(Integer studentId){
		this.userService.deleteByUsername(studentId);
		return this.studentDao.deleteByPrimaryKey(studentId);
	}
	
	public Student selectOne(Integer username){
		
		Student record = new Student();
		record.setStudentNumber(username);
		return this.studentDao.selectOne(record);
	}
}
