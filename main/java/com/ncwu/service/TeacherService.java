package com.ncwu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.mapper.entity.Example;

import com.ncwu.dao.TeacherCourseDao;
import com.ncwu.dao.TeacherDao;
import com.ncwu.model.Teacher;
import com.ncwu.vo.PageInfo;


@Service
public class TeacherService {

	@Autowired
	private TeacherDao teacherDao;
	
	@Autowired
	private TeacherCourseDao teacherCourseDao;
	
	@Autowired
	private UserService userService;
	
	public Integer insertOne(Teacher teacher){
		
		this.teacherDao.insert(teacher);
		this.userService.insertOne(teacher.getTeacherNumber(), 1);
		return teacher.getTeacherId();
	}
	
	public Integer deleteOne(Integer teacherId){
		if (this.teacherCourseDao.selectCountByTeacherId(teacherId) != 0) {
			return 0;
		}else{
			Example example = new Example(Teacher.class);
			example.createCriteria().andEqualTo("teacherNumber", teacherId);
			this.userService.deleteByUsername(teacherId);
			return this.teacherDao.deleteByExample(example);
		}
	}
	
	public Teacher selectOne(Integer username){
		Teacher record = new Teacher();
		record.setTeacherNumber(username);
		return this.teacherDao.selectOne(record);
	}
	
	public PageInfo<Teacher> selectList(String name,Integer pageSize,Integer pageNumber){
		int m = 0;
//		System.out.println(name);
		if (name == null || name.equals("")) {
			m = this.teacherDao.selectCount(new Teacher());			
		}else{			
			Example example = new Example(Teacher.class);
			example.createCriteria().andLike("teacherName", name);
			m = this.teacherDao.selectCountByExample(example);
		}
//		System.out.println(m);
		// 总页数
		int pageCount = (m+pageSize-1)/pageSize;
		
		if (pageNumber > pageCount) {
			pageNumber = pageCount;
			
		}
		if (pageNumber < 1) {
			pageNumber = 1;
		}
		Integer startIndex =  (pageNumber - 1) * pageSize;
		
		List<Teacher> teachers = this.teacherDao.listTeacher(name, startIndex, pageSize);
		return new PageInfo<Teacher>(pageNumber,pageCount,teachers);
	}
}
