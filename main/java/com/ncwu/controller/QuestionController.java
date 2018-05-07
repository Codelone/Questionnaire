package com.ncwu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ncwu.model.ExQuestion;
import com.ncwu.model.Question;
import com.ncwu.service.ExQuestionService;
import com.ncwu.service.QuestionService;

@Controller
@RequestMapping(value="question")
public class QuestionController {

	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private ExQuestionService exQuestionService;
	
	
	@RequestMapping(value="insertOne",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject insertOneQuestion(@RequestBody JSONObject param){

		Question question = new Question();
		JSONObject jsonObject = new JSONObject();
		Integer questionnaireId = param.getInteger("questionnaireId");
		question.setTopic(param.getString("topic"));
		question.setType(param.getInteger("type"));
		question.setOptionList(param.getString("option"));
		Integer questionId = this.questionService.insertQuestion(question, questionnaireId);
		if (questionId != 0) {			
			jsonObject.put("success", true);			
			jsonObject.put("questionId", questionId);					
		}else {
			jsonObject.put("success", false);			
		}
		return jsonObject;
	}
	
	@RequestMapping(value="insertList",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject insertListQuestion(@RequestBody JSONObject param){
		
		JSONObject jsonObject = new JSONObject();
		Integer questionnaireId = param.getInteger("questionnaireId");
		JSONArray jsonArray = param.getJSONArray("questionIdList");
		for (int i = 0; i < jsonArray.size(); i++) {
//			System.out.println(jsonArray.get(i));
			if (jsonArray.get(i) == null) {
				continue;
			}
			ExQuestion exQuestion = this.exQuestionService.selectOne((Integer) jsonArray.get(i));
			Question question = new Question();
			question.setOptionList(exQuestion.getOptionList());
			question.setTopic(exQuestion.getTopic());
			question.setType(exQuestion.getType());
			Integer success = this.questionService.insertQuestion(question, questionnaireId);
			if (success != 0) {
				jsonObject.put("success", true);											
			}else {
				jsonObject.put("success", false);															
			}
		}
		
		return jsonObject;
	}
	
	
	
	@RequestMapping(value="delete/{questionId}",method=RequestMethod.GET)
	@ResponseBody
	public JSONObject getCourseByTeacherId(@PathVariable("questionId") Integer questionId){
		
		JSONObject jsonObject = new JSONObject();
		if(this.questionService.deleteOne(questionId) != 0){
			jsonObject.put("success", true);
		}else {
			jsonObject.put("success", false);
		}			
		return jsonObject;
	}
	
}
