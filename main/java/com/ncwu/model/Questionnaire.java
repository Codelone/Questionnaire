package com.ncwu.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

@Table(name = "questionnaires")
public class Questionnaire {

	/**
	 * id
	 */
    @Id
    @Column(name = "questionnaire_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer questionnaireId;
	/**
	 * 标题
	 */
	private String title;
	/**
	 * 问卷描述
	 */
	private String description;
	
	/**
	 * 出卷老师id
	 */
	@Column(name = "teacher_id")
	private Integer teacherId;

	/**
	 * 课程id
	 */
	@Column(name = "course_id")
	private Integer courseId;
	
	public Integer getCourseId() {
		return courseId;
	}

	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}

	/**
	 * 问卷状态
	 */
	private Integer status;
	
	/**
	 * 创建时间
	 */
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="Asia/Shanghai")
	private Timestamp createtime;
	
	
	private Course course;

	public Integer getQuestionnaireId() {
		return questionnaireId;
	}

	public void setQuestionnaireId(Integer questionnaireId) {
		this.questionnaireId = questionnaireId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Timestamp getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	@Override
	public String toString() {
		return "Questionnaire [questionnaireId=" + questionnaireId + ", title="
				+ title + ", description=" + description + ", teacherId="
				+ teacherId + ", courseId=" + courseId + ", status=" + status
				+ ", createtime=" + createtime + "]";
	}
	
	
}
