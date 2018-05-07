package com.ncwu.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "question")
public class Question {

	/**
	 * 问题ID
	 */
    @Id
    @Column(name = "question_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer questionId;
	
	/**
	 * 问题
	 */
	private String topic;

	/**
	 * 选项
	 */
	@Column(name = "option_list")
	private String optionList;
	
	/**
	 * 问题类型（单双问答）
	 */
	private Integer type;

	public String getOptionList() {
		return optionList;
	}

	public void setOptionList(String optionList) {
		this.optionList = optionList;
	}

	public Integer getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
	
	
}
