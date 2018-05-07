package com.ncwu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ncwu.model.ExQuestion;
import com.ncwu.service.ExQuestionService;
import com.ncwu.vo.PageInfo;

@Controller
@RequestMapping(value="exquestion")
public class ExQuestionController {

	@Autowired
	private ExQuestionService exQuestionService;
	
	@RequestMapping(value="list",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject getQuestionList(@RequestBody JSONObject param){
		JSONObject jsonObject = new JSONObject();
		Integer qtype = param.getInteger("qtype");
		Integer pageNumber = param.getInteger("pageNumber");
		Integer pageSize = param.getInteger("pageSize");
		PageInfo<ExQuestion> questions = this.exQuestionService.getList(qtype, pageSize, pageNumber);
		jsonObject.put("questions", questions);
		return jsonObject;
	}
	
	@RequestMapping(value="auto",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject getAutoQuestionList(@RequestBody JSONObject param){
		JSONObject jsonObject = new JSONObject();
		Integer type1 = param.getInteger("type1");
		Integer type2 = param.getInteger("type2");
		Integer type3 = param.getInteger("type3");
		List<ExQuestion> questions = this.exQuestionService.selectQuestionRandom(type1, type2, type3);
		jsonObject.put("questions", questions);
		return jsonObject;
	}
	
	@RequestMapping(value="add",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject addQuestion(@RequestBody ExQuestion exQuestion){
		JSONObject jsonObject = new JSONObject();
		if (this.exQuestionService.insertOne(exQuestion) != 0) {
			jsonObject.put("success", true);
		}else {
			jsonObject.put("success", false);			
		}
		return jsonObject;
	}
	
	@RequestMapping(value="delete/{exQuestionId}",method=RequestMethod.GET)
	@ResponseBody
	public JSONObject deleteQuestion(@PathVariable("exQuestionId") Integer studentId){
		JSONObject jsonObject = new JSONObject();
		if (this.exQuestionService.deleteOne(studentId) != 0) {			
			jsonObject.put("success", true);
		}else {			
			jsonObject.put("success", false);
		}
		return jsonObject;
	}
}
