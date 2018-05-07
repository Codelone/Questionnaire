package com.ncwu.model;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "survey_question")
public class SurveyQuestion {

	/**
	 * id
	 */
    @Id
    @Column(name = "survey_question_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer surveyQuestionId;
	
	/**
	 * 问卷id
	 */
    @Column(name = "questionnaire_id")
	private Integer questionnaireId;
	
	/**
	 * 问题id
	 */
    @Column(name = "question_id")
	private Integer questionId;

	public Integer getSurveyQuestionId() {
		return surveyQuestionId;
	}

	public void setSurveyQuestionId(Integer surveyQuestionId) {
		this.surveyQuestionId = surveyQuestionId;
	}

	public Integer getQuestionnaireId() {
		return questionnaireId;
	}

	public void setQuestionnaireId(Integer questionnaireId) {
		this.questionnaireId = questionnaireId;
	}

	public Integer getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}
	
	
}
