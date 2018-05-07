package com.ncwu.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "student_course")
public class StudentCourse {

	/**
	 * id
	 */
    @Id
    @Column(name = "student_course_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer studentCourseId;
	
	/**
	 * 学生班级
	 */
    @Column(name = "student_class")
	private Integer studentClass;
	
	/**
	 * 老师课程id
	 */
    @Column(name = "teacher_course_id")
	private Integer teacherCourseId;

	public Integer getStudentCourseId() {
		return studentCourseId;
	}

	public void setStudentCourseId(Integer studentCourseId) {
		this.studentCourseId = studentCourseId;
	}

	public Integer getStudentClass() {
		return studentClass;
	}

	public void setStudentClass(Integer studentClass) {
		this.studentClass = studentClass;
	}

	public Integer getTeacherCourseId() {
		return teacherCourseId;
	}

	public void setTeacherCourseId(Integer teacherCourseId) {
		this.teacherCourseId = teacherCourseId;
	}


	
}
