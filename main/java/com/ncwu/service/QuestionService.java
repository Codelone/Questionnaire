package com.ncwu.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ncwu.dao.QuestionDao;
import com.ncwu.dao.SurveyQuestionDao;
import com.ncwu.model.Question;
import com.ncwu.model.SurveyQuestion;
import com.ncwu.vo.QuestionWithOption;

@Service
public class QuestionService {

	@Autowired
	private QuestionDao questionDao;
	
	@Autowired
	private SurveyQuestionDao surveyQuestionDao;
	
	/**
	 * 插入一条问题内容  要有问卷id
	 * @param question
	 * @return
	 */
	public Integer insertQuestion(Question question,Integer questionnaireId){

		this.questionDao.insertSelective(question);
		SurveyQuestion surveyQuestion = new SurveyQuestion();
		surveyQuestion.setQuestionnaireId(questionnaireId);
		surveyQuestion.setQuestionId(question.getQuestionId());
		surveyQuestionDao.insertSelective(surveyQuestion);
		return question.getQuestionId();
	}
	
	/**
	 * 获取问题及其选项的列表
	 * @param questionnaireId
	 * @return
	 */
	public List<QuestionWithOption> selectListWithQuestionnaireId(Integer questionnaireId){		
		List<Question> questions = this.questionDao.selectQuestionsByquestionnaireId(questionnaireId);
//		System.out.println(questionnaireId);
		List<QuestionWithOption> questionWithOptions = new ArrayList<QuestionWithOption>();
		for (Question question : questions) {
			String[] options = question.getOptionList().split(",");
			QuestionWithOption e = new QuestionWithOption();
			e.setOptions(Arrays.asList(options));
			e.setQuestion(question);
			questionWithOptions.add(e);
		}
		return questionWithOptions;
	}
	

	
	public Integer deleteOne(Integer questionId){
		
		return this.questionDao.deleteByPrimaryKey(questionId);
	}
}
