package com.ncwu.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ncwu.model.Answer;
import com.ncwu.model.Question;
import com.ncwu.vo.AnswerResult;
import com.ncwu.vo.ResultShow;

public class AnswerUtil {

	public static AnswerResult resolveAnswer(List<Answer> answers,Map<String,Map<String, Integer>> result,Map<String, List<String>> textMap){
		Map<String,String> optionList = new HashMap<String, String>();
		for (Answer answer : answers) {
			String[] answerList = answer.getAnswerContent().split(";");
			// 取出每一个答案
			for (int i=0; i<answerList.length; i++) {
				String temp = answerList[i];
				// 单选
				if (temp.contains("&")) {
					String[] qo = temp.split("&");
					if (optionList.get(qo[0]) == null) {						
						optionList.put(qo[0], qo[1]);	
					}else {	
					optionList.put(qo[0], optionList.get(qo[0])+","+qo[1]);
					}
				}
				// 多选
				if (temp.contains("-")) {
					String[] qo = temp.split("-");	
					if (optionList.get(qo[0]) == null) {						
						optionList.put(qo[0], qo[1]);	
					}else {	
					optionList.put(qo[0], optionList.get(qo[0])+","+qo[1]);
					}
				}
				// 问答
				if (temp.contains(":")) {
					String[] qo = temp.split(":");
					if (qo.length < 2) {
						continue;
					}
					if (optionList.get(qo[0]) == null) {						
						optionList.put(qo[0], qo[1]);	
					}else {
						optionList.put(qo[0], optionList.get(qo[0])+"#"+qo[1]);	
					}
				}
				
			}
			
		}// 统计出每道题的所有选项
		
		/*System.out.println("每道题的选项");
		for (String key : optionList.keySet()) {
			System.out.println(key+"+"+optionList.get(key));
		}
		System.out.println("----------------------");
		System.out.println("初始化的变量");
		for (String key : result.keySet()) {
			System.out.println(key+":"+result.get(key));
		}
		for (String key : textMap.keySet()) {
			System.out.println(key+":"+textMap.get(key).toString());
		}
		System.out.println("----------------------");
		*/
		
		// 统计个数
		for (String key : optionList.keySet()) {
			// 问答题
			if (optionList.get(key).contains("#")) {
				List<String> textList = textMap.get(key);
				for (String text : optionList.get(key).split("#")) {
					textList.add(text);
				}
				textMap.put(key, textList);
			}
			// 单多选
			if (optionList.get(key).contains(",")) {
				for (String index : optionList.get(key).split(",")) {	
					result.get(key).put(index, result.get(key).get(index)+1);
				}
			}
		}
		
		/*for (String key : result.keySet()) {
			System.out.println(key+":"+result.get(key));
		}
		for (String key : textMap.keySet()) {
			System.out.println(key+":"+textMap.get(key).toString());
		}*/
		
		AnswerResult answerResult = new AnswerResult();
		answerResult.setResult(result);
		answerResult.setTextMap(textMap);
		return answerResult;
		
		
	}
	
	public static List<ResultShow> solveForShow(AnswerResult answerResult,List<Question> questions){
		List<ResultShow> resultShows = new ArrayList<ResultShow>();
		for (Question question : questions) {
			ResultShow resultShow = new ResultShow();
			resultShow.setQuestion(question);
			if (question.getType() == 3) {				
				// 问答答案list
				List<String> text = answerResult.getTextMap().get(question.getQuestionId()+"");
				resultShow.setType3List(text);
			}else {
				// 把选项做成list
				resultShow.setOptions(Arrays.asList(question.getOptionList().split(",")));
				// 将结果做成list
				Map<String, Integer> counts = answerResult.getResult().get(question.getQuestionId()+"");
				List<Integer> countList = new ArrayList<Integer>();
				for (int i = 0; i < counts.size(); i++) {
					countList.add(counts.get(i+""));
				}
				resultShow.setCountList(countList);
			}
			resultShows.add(resultShow);
		}
		// 组装完结果
		return resultShows;
	}
	
	
	public static void main(String[] args) {
		List<Answer> answers = new ArrayList<Answer>();
		for (int i = 0; i < 20; i++) {
			Answer e = new Answer();
			e.setAnswerContent("8&1;9-0,1;10:哈哈;11-0;");
			answers.add(e);			
		}
		
		Map<String, Map<String, Integer>> result = new HashMap<String, Map<String,Integer>>();
		Map<String, Integer> q8 = new HashMap<String, Integer>();
		q8.put("0", 0);
		q8.put("1", 0);
		q8.put("2", 0);
		result.put("8", q8);
		
		Map<String, Integer> q9 = new HashMap<String, Integer>();
		q9.put("0", 0);
		q9.put("1", 0);
		q9.put("2", 0);
		result.put("9", q9);
		
		Map<String, Integer> q11 = new HashMap<String, Integer>();
		q11.put("0", 0);
		q11.put("1", 0);
		result.put("11", q11);
		
		Map<String, List<String>> textMap = new HashMap<String, List<String>>();
		textMap.put("10", new ArrayList<String>());
		

		resolveAnswer(answers, result, textMap);
		
	}

	
	
}
