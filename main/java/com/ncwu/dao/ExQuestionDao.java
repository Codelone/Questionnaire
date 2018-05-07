package com.ncwu.dao;

import java.util.List;

import tk.mybatis.mapper.common.Mapper;

import com.ncwu.model.ExQuestion;
public interface ExQuestionDao extends Mapper<ExQuestion> {
	
	List<ExQuestion> listQuestion(Integer qtype,Integer startIndex,Integer pageSize);
	
	List<ExQuestion> selectQuestionByRandom(Integer type,Integer number);
}
