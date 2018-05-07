package com.ncwu.model;


import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "teacher")
public class Teacher {

	/**
	 * id
	 */
    @Id
    @Column(name = "teacher_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer teacherId;
	
	/**
	 * 教师编号=username
	 */
    @Column(name = "teacher_number")
	private Integer teacherNumber;
	
	/**
	 * 名字
	 */
    @Column(name = "teacher_name")
	private String teacherName;


	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public Integer getTeacherNumber() {
		return teacherNumber;
	}

	public void setTeacherNumber(Integer teacherNumber) {
		this.teacherNumber = teacherNumber;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	
	
}
