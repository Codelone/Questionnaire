package com.ncwu.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "student")
public class Student {

	/**
	 * id
	 */
    @Id
    @Column(name = "student_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer studentId;
	
	
	/**
	 * 学号=username
	 */
    @Column(name = "student_number")
	private Integer studentNumber;
	
	/**
	 * 班级
	 */
    @Column(name = "student_class")
    private Integer studentClass;
	
	/**
	 * 姓名
	 */
    @Column(name = "student_name")
	private String studentName;

	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public Integer getStudentNumber() {
		return studentNumber;
	}

	public void setStudentNumber(Integer studentNumber) {
		this.studentNumber = studentNumber;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public Integer getStudentClass() {
		return studentClass;
	}

	public void setStudentClass(Integer studentClass) {
		this.studentClass = studentClass;
	}
	
	
}
