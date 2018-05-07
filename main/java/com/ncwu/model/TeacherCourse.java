package com.ncwu.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "teacher_course")
public class TeacherCourse {

	/**
	 * id
	 */
    @Id
    @Column(name = "teacher_course_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer teacherCourseId;

	/**
	 * 老师id
	 */
    @Column(name = "teacher_id")
	private Integer teacherId;

	/**
	 * 课程id
	 */
    @Column(name = "course_id")
	private Integer courseId;
    
    /**
	 * 课程名
	 */
    private String courseName;

	public Integer getTeacherCourseId() {
		return teacherCourseId;
	}

	public void setTeacherCourseId(Integer teacherCourseId) {
		this.teacherCourseId = teacherCourseId;
	}

	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

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

}
