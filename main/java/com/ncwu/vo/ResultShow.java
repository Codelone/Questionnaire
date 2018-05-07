package com.ncwu.vo;

import java.util.List;

import com.ncwu.model.Question;

public class ResultShow {

	private Question question;
	
	private List<String> options;
	
	private List<Integer> countList;
	
	private List<String> type3List;

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

	public List<Integer> getCountList() {
		return countList;
	}

	public void setCountList(List<Integer> countList) {
		this.countList = countList;
	}

	public List<String> getType3List() {
		return type3List;
	}

	public void setType3List(List<String> type3List) {
		this.type3List = type3List;
	}
	
	
}
