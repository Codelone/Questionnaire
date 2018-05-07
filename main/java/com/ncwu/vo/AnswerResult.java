package com.ncwu.vo;

import java.util.List;
import java.util.Map;


public class AnswerResult {

	
	/**
	 * 单选题结果
	 */
	private Map<String, Map<String, Integer>> result;
	
	/**
	 * 多选题结果
	 */
	private Map<String, List<String>> textMap;

	public Map<String, Map<String, Integer>> getResult() {
		return result;
	}

	public void setResult(Map<String, Map<String, Integer>> result) {
		this.result = result;
	}

	public Map<String, List<String>> getTextMap() {
		return textMap;
	}

	public void setTextMap(Map<String, List<String>> textMap) {
		this.textMap = textMap;
	}
	
	
	
}
