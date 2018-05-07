package com.ncwu.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "student_answer")
public class StudentAnswer {

	/**
	 * id
	 */
    @Id
    @Column(name = "student_answer_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer studentAnswerId;
	
	/**
	 * 学生id
	 */
    @Column(name = "student_id")
	private Integer studentId;
	
	/**
	 * 答案id
	 */
    @Column(name = "answer_id")
	private Integer answerId;

	public Integer getStudentAnswerId() {
		return studentAnswerId;
	}

	public void setStudentAnswerId(Integer studentAnswerId) {
		this.studentAnswerId = studentAnswerId;
	}

	public Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}

	public Integer getAnswerId() {
		return answerId;
	}

	public void setAnswerId(Integer answerId) {
		this.answerId = answerId;
	}
	
	
}
