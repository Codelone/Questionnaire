package com.ncwu.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "exquestion")
public class ExQuestion {

	/**
	 * 问题ID
	 */
    @Id
    @Column(name = "exquestion_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer exquestionId;
	
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

	public Integer getExquestionId() {
		return exquestionId;
	}

	public void setExquestionId(Integer exquestionId) {
		this.exquestionId = exquestionId;
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
