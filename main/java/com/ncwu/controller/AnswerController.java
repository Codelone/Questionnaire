package com.ncwu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ncwu.model.Answer;
import com.ncwu.model.Questionnaire;
import com.ncwu.model.User;
import com.ncwu.service.AnswerService;
import com.ncwu.service.QuestionnaireService;
import com.ncwu.vo.ResultShow;

@Controller
@RequestMapping(value="answer")
public class AnswerController {

	@Autowired
	private AnswerService answerService;
	
	@Autowired
	private QuestionnaireService questionnaireService;
	
	@RequestMapping(value="add",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject addAnswer(@RequestBody Answer answer,HttpSession session){
		JSONObject jsonObject = new JSONObject();
		User user = (User) session.getAttribute("user");
		answer.setStudentNumber(Integer.valueOf(user.getUsername()));
		if (this.answerService.insertOne(answer) != 0) {
			jsonObject.put("success", true);
		}else {
			jsonObject.put("success", false);			
		}
		return jsonObject;
	}
	
	@RequestMapping(value="result",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject addAnswer(@RequestBody JSONObject param){
		JSONObject jsonObject = new JSONObject();
		Integer questionnaireId = param.getInteger("questionnaireId");
		List<ResultShow> resultShows = this.answerService.selectResult(questionnaireId);
		Questionnaire questionnaire = this.questionnaireService.selectOne(questionnaireId);
		jsonObject.put("resultShows", resultShows);
		jsonObject.put("questionnaire", questionnaire);
		
		return jsonObject;
	}
}
