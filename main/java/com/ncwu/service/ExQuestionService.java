package com.ncwu.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ncwu.dao.ExQuestionDao;
import com.ncwu.model.ExQuestion;
import com.ncwu.vo.PageInfo;

@Service
public class ExQuestionService {

	@Autowired
	private ExQuestionDao exQuestionDao;
	
	public PageInfo<ExQuestion> getList(Integer qtype,Integer pageSize,Integer pageNumber){
		int m = 0;
		if (qtype == 0) {
			m = this.exQuestionDao.selectCount(new ExQuestion());			
		}else{			
			ExQuestion exQuestion = new ExQuestion();
			exQuestion.setType(qtype);
			m = this.exQuestionDao.selectCount(exQuestion);
		}
		// 总页数
		int pageCount = (m+pageSize-1)/pageSize;
		
		if (pageNumber > pageCount) {
			pageNumber = pageCount;
			
		}
		if (pageNumber < 1) {
			pageNumber = 1;
		}
		Integer startIndex =  (pageNumber - 1) * pageSize;
		
		List<ExQuestion> exQuestions = this.exQuestionDao.listQuestion(qtype, startIndex, pageSize);
		
		return new PageInfo<ExQuestion>(pageNumber,pageCount,exQuestions);
	}
	
	public Integer insertOne(ExQuestion exQuestion){
		return this.exQuestionDao.insert(exQuestion);
	}
	public ExQuestion selectOne(Integer exQuestionId){
		return this.exQuestionDao.selectByPrimaryKey(exQuestionId);
	}
	
	public Integer deleteOne(Integer exQuestionId){
		return this.exQuestionDao.deleteByPrimaryKey(exQuestionId);
	}
	
	
	public List<ExQuestion> selectQuestionRandom(Integer typeCount1,Integer typeCount2,Integer typeCount3) {
		List<ExQuestion> exQuestions = new ArrayList<ExQuestion>();
		if (typeCount1 != 0) {
			exQuestions.addAll(this.exQuestionDao.selectQuestionByRandom(1, typeCount1));
			
		}
		if (typeCount2 != 0) {
			exQuestions.addAll(this.exQuestionDao.selectQuestionByRandom(2, typeCount2));
			
		}
		if (typeCount3 != 0) {
			exQuestions.addAll(this.exQuestionDao.selectQuestionByRandom(3, typeCount3));		
		}
		return exQuestions;
		
	}
}
