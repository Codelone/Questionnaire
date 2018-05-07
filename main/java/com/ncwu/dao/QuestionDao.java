package com.ncwu.dao;

import java.util.List;

import tk.mybatis.mapper.common.Mapper;

import com.ncwu.model.Question;

public interface QuestionDao extends Mapper<Question> {

	List<Question> selectQuestionsByquestionnaireId(Integer questionnaireId);
	
}
