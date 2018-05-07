package com.ncwu.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "course")
public class Course {

	/**
	 * id
	 */
    @Id
    @Column(name = "course_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer courseId;
	
	/**
	 * 课程名字
	 */
    @Column(name = "course_name")
	private String courseName;
	
	/**
	 * 类别id
	 */
    @Column(name = "category_id")
	private Integer categoryId;

	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	} 
	
	
	
}
