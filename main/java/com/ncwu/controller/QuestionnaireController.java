package com.ncwu.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ncwu.model.Questionnaire;
import com.ncwu.model.User;
import com.ncwu.service.QuestionService;
import com.ncwu.service.QuestionnaireService;
import com.ncwu.service.SurveyQuestionService;
import com.ncwu.vo.QuestionWithOption;
import com.ncwu.vo.QuestionnaireQuery;

@Controller
@RequestMapping(value="survey")
public class QuestionnaireController {

	@Autowired
	private QuestionnaireService service;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private SurveyQuestionService surveyQuestionService;
	
	@RequestMapping(value="selectList",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject getQuestionnaireList(@RequestBody QuestionnaireQuery query,HttpSession session){
		JSONObject jsonObject = new JSONObject();
		User user = (User) session.getAttribute("user");
		query.setTeacherId(Integer.valueOf(user.getUsername()));
		jsonObject.put("surveys", this.service.selectList(query));
		return jsonObject;
	}
	
	@RequestMapping(value="delete/{questionnaireId}",method=RequestMethod.GET)
	@ResponseBody
	public JSONObject getCourseByTeacherId(@PathVariable("questionnaireId") Integer questionnaireId){
		
		JSONObject jsonObject = new JSONObject();
		if(this.service.deleteOne(questionnaireId) != 0){
			jsonObject.put("success", true);
		}else {
			jsonObject.put("success", false);
		}			
		return jsonObject;
	}
	
	@RequestMapping(value="republish/{questionnaireId}",method=RequestMethod.GET)
	@ResponseBody
	public JSONObject republishSurvey(@PathVariable("questionnaireId") Integer questionnaireId) throws ParseException{
		
		JSONObject jsonObject = new JSONObject();
		Questionnaire questionnaire = this.service.selectOne(questionnaireId);

		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
		Date date = new Date();
		date = dateFormat.parse(year+"-01-01 00:00:00");
		if (questionnaire.getCreatetime().after(date)) {
			jsonObject.put("success", false);
			return jsonObject;
		}else {
			questionnaire.setQuestionnaireId(null);
			questionnaire.setCreatetime(null);
			questionnaire.setCourse(null);
//			System.out.println(questionnaire.toString());
			Integer newQuestionnaireId = this.service.insertOne(questionnaire);
			this.surveyQuestionService.republishQuestion(questionnaireId, newQuestionnaireId);
			jsonObject.put("success", true);
		}
		return jsonObject;
	}
	
	@RequestMapping(value="listForWrite",method=RequestMethod.GET)
	@ResponseBody
	public JSONObject getQuestionnaireListForWrite(HttpSession session){
		JSONObject jsonObject = new JSONObject();
		User user = (User) session.getAttribute("user");
		jsonObject.put("surveys", this.service.selectListForWrite(Integer.valueOf(user.getUsername())));
		return jsonObject;
	}
	
	@RequestMapping(value="insertOne",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject insertOneQuestionnaire(HttpSession session,@RequestBody JSONObject param){
		Questionnaire questionnaire = new Questionnaire();
		User user = (User) session.getAttribute("user");
		questionnaire.setTeacherId(Integer.valueOf(user.getUsername()));
		questionnaire.setCourseId(param.getInteger("courseId"));
		questionnaire.setTitle(param.getString("title"));
		questionnaire.setDescription(param.getString("description"));
		questionnaire.setStatus(param.getInteger("status"));
		JSONObject jsonObject = new JSONObject();
		Integer questionnaireId = this.service.insertOne(questionnaire);
		if (questionnaireId != 0) {			
			jsonObject.put("success", true);
			jsonObject.put("questionnaireId", questionnaireId);
		}else {
			jsonObject.put("success", false);			
		}
		return jsonObject;
	}
	
	// 暂时没用
	@RequestMapping(value="selectOne",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject selectOneQuestionnaire(@RequestBody JSONObject param){
		JSONObject jsonObject = new JSONObject();
		Questionnaire questionnaire = this.service.selectOne(param.getInteger("questionnaireId"));
		if (questionnaire != null) {
			jsonObject.put("success", true);
			jsonObject.put("questionnaire", questionnaire);
		}else {
			jsonObject.put("success", false);	
		}
		return jsonObject;
	}
	

	@RequestMapping(value="getEdit",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject selectEditQuestionnaire(HttpSession session,@RequestBody JSONObject param){
		JSONObject jsonObject = new JSONObject();
		Integer teacherId = Integer.valueOf(((User) session.getAttribute("user")).getUsername());
		Integer questionnaireId = param.getInteger("questionnaireId");
		List<Questionnaire> questionnaires = null;
		if (questionnaireId == null) {
			questionnaires = this.service.selectEdit(teacherId,param.getInteger("status"));
		}else {
			questionnaires = this.service.selectToEdit(questionnaireId, param.getInteger("status"));
		}
		if (!questionnaires.isEmpty()) {
			Questionnaire questionnaire = questionnaires.get(0);
			List<QuestionWithOption> qo = this.questionService.selectListWithQuestionnaireId(questionnaire.getQuestionnaireId());
			jsonObject.put("success", true);
			jsonObject.put("questionnaire", questionnaire);
			jsonObject.put("qo", qo);
		}else {
			jsonObject.put("success", false);
		}
		return jsonObject;
	}
	
	@RequestMapping(value="waitAnswer",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject selectAnswerQuestionnaire(@RequestBody JSONObject param){
		JSONObject jsonObject = new JSONObject();
		Integer questionnaireId = param.getInteger("questionnaireId");
		List<Questionnaire> questionnaires = this.service.selectToEdit(questionnaireId, param.getInteger("status"));
		if (!questionnaires.isEmpty()) {
			Questionnaire questionnaire = questionnaires.get(0);
			
			List<QuestionWithOption> qo = this.questionService.selectListWithQuestionnaireId(questionnaire.getQuestionnaireId());
			jsonObject.put("success", true);
			jsonObject.put("questionnaire", questionnaire);
			jsonObject.put("qo", qo);
		}else {
			jsonObject.put("success", false);
		}
		return jsonObject;
	}
	
	@RequestMapping(value="isEdit",method=RequestMethod.GET)
	@ResponseBody
	public JSONObject selectIsEdit(HttpSession session){
		JSONObject jsonObject = new JSONObject();
		Integer teacherId = Integer.valueOf(((User) session.getAttribute("user")).getUsername());
		List<Questionnaire> questionnaires = this.service.selectEdit(teacherId,0);
		if (!questionnaires.isEmpty()) {
			jsonObject.put("success", true);
		}else {
			jsonObject.put("success", false);
		}
		return jsonObject;
	}
	
	// 保存草稿或发布
	@RequestMapping(value="save",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject selectIsEdit(@RequestBody JSONObject param){
		JSONObject jsonObject = new JSONObject();
		Questionnaire questionnaire = new Questionnaire();
		questionnaire.setQuestionnaireId(param.getInteger("questionnaireId"));
		questionnaire.setStatus(param.getInteger("status"));
		if (this.service.updateOne(questionnaire) > 0) {
			jsonObject.put("success", true);
		}else {
			jsonObject.put("success", false);
		}
		return jsonObject;
	}
	
}
