package com.ncwu.vo;

import java.util.List;

import com.ncwu.model.Question;

public class QuestionWithOption {

	
	private Question question;
	
	private List<String> options;

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public List<String> getOptions() {
		return options;
	}

	public void setOptions(List<String> options) {
		this.options = options;
	}


	
	
}
