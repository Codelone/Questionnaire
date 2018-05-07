package com.ncwu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.mapper.entity.Example;

import com.ncwu.dao.SurveyQuestionDao;
import com.ncwu.model.SurveyQuestion;

@Service
public class SurveyQuestionService {

	@Autowired
	private SurveyQuestionDao surveyQuestionDao;
	
	// 再次出问题
	public boolean republishQuestion(Integer questionnaireId,Integer newQuestionnaireId){
		Example example = new Example(SurveyQuestion.class);
		example.createCriteria().andEqualTo("questionnaireId", questionnaireId);
		List<SurveyQuestion> surveyQuestions = this.surveyQuestionDao.selectByExample(example);
		for (SurveyQuestion surveyQuestion : surveyQuestions) {
			SurveyQuestion surveyQuestion2 = new SurveyQuestion();
			surveyQuestion2.setQuestionnaireId(newQuestionnaireId);
			surveyQuestion2.setQuestionId(surveyQuestion.getQuestionId());
			if (this.surveyQuestionDao.insertSelective(surveyQuestion2) == 0) {
				return false;
			}
		}
		return true;
	}
}
