package com.ncwu.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.mapper.entity.Example;

import com.ncwu.dao.AnswerDao;
import com.ncwu.dao.QuestionDao;
import com.ncwu.model.Answer;
import com.ncwu.model.Question;
import com.ncwu.util.AnswerUtil;
import com.ncwu.vo.AnswerResult;
import com.ncwu.vo.ResultShow;

@Service
public class AnswerService {
	
	@Autowired
	private AnswerDao answerDao;
	
	@Autowired
	private QuestionDao	questionDao;
	
	public Integer insertOne(Answer answer){
		
		return this.answerDao.insertSelective(answer);
	}

	public List<ResultShow> selectResult(Integer questionnaireId){
		Example example = new Example(Answer.class);
		example.createCriteria().andEqualTo("questionnaireId", questionnaireId);
		List<Answer> answers = this.answerDao.selectByExample(example);
		
		// 初始化计数参数
		List<Question> questions = this.questionDao.selectQuestionsByquestionnaireId(questionnaireId);
		Map<String, Map<String, Integer>> result = new HashMap<String, Map<String,Integer>>();
		Map<String, List<String>> textMap = new HashMap<String, List<String>>();
		for (Question question : questions) {
			if (question.getType() == 3) {
				textMap.put(question.getQuestionId()+"", new ArrayList<String>());
				continue;
			}
			String[] options = question.getOptionList().split(",");
			Map<String, Integer> option = new HashMap<String, Integer>();
			for (int i = 0; i < options.length; i++) {
				option.put(i+"", 0);
			}
			result.put(question.getQuestionId()+"", option);
		}
		
		AnswerResult answerResult = AnswerUtil.resolveAnswer(answers, result, textMap);
		
		return AnswerUtil.solveForShow(answerResult, questions);
		
		
	}
}
