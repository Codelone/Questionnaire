package com.ncwu.dao;

import java.util.List;

import com.ncwu.model.Questionnaire;
import com.ncwu.vo.QuestionnaireQuery;

import tk.mybatis.mapper.common.Mapper;


public interface QuestionnaireDao extends Mapper<Questionnaire>{

	List<Questionnaire> selectQuestionnaireForWrite(Integer studentNumber);
	
	List<Questionnaire> selectByStatus(QuestionnaireQuery query);
	
}
