package com.ncwu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tk.mybatis.mapper.entity.Example;

import com.ncwu.dao.QuestionDao;
import com.ncwu.dao.QuestionnaireDao;
import com.ncwu.model.Question;
import com.ncwu.model.Questionnaire;
import com.ncwu.vo.QuestionnaireQuery;

@Service
public class QuestionnaireService {

	@Autowired
	private QuestionnaireDao questionnaireDao;
	
	@Autowired
	private QuestionDao questionDao;
	
	/**
	 * 插入一条问卷信息,要输入老师id 课程id
	 * @param questionnaire
	 */
	public Integer insertOne(Questionnaire questionnaire){
		this.questionnaireDao.insertSelective(questionnaire);
		return questionnaire.getQuestionnaireId();
	}
	
	public Integer updateOne(Questionnaire questionnaire){
		
		if (questionnaire.getStatus() == 2) {
			Integer qcount = this.questionDao.selectCountByExample(new Example(Question.class).createCriteria().andEqualTo("questionnaireId", questionnaire.getQuestionnaireId()));
			if (qcount<1) {
				return 0;
			}
		}
		return this.questionnaireDao.updateByPrimaryKeySelective(questionnaire);
	}
	
	public List<Questionnaire> selectList(QuestionnaireQuery query){
		return this.questionnaireDao.selectByStatus(query);
	}
	
	public List<Questionnaire> selectListForWrite(Integer studentNumber){
		return this.questionnaireDao.selectQuestionnaireForWrite(studentNumber);
	}
	
	
	/**
	 * 根据问卷id查询
	 * @param questionnaireId
	 * @return
	 */
	public Questionnaire selectOne(Integer questionnaireId){
		QuestionnaireQuery query = new QuestionnaireQuery();
		query.setStatus(2);
		query.setQuestionnaireId(questionnaireId);
		return this.questionnaireDao.selectByStatus(query).get(0);
	}
	
	
	
	/**
	 * 获取该老师编辑状态的问卷
	 * @param teacherId
	 * @return
	 */
	public List<Questionnaire> selectEdit(Integer teacherId,Integer status){
		QuestionnaireQuery query = new QuestionnaireQuery();
		query.setTeacherId(teacherId);
		query.setStatus(status);
		List<Questionnaire> questionnaires = this.questionnaireDao.selectByStatus(query);
		if (questionnaires != null) {
			return questionnaires;
		}else {
			return null;
		}
	}
	
	public List<Questionnaire> selectToEdit(Integer questionnaireId,Integer status){
		QuestionnaireQuery query = new QuestionnaireQuery();
		query.setStatus(status);
		query.setQuestionnaireId(questionnaireId);
		List<Questionnaire> questionnaires = this.questionnaireDao.selectByStatus(query);
		if (questionnaires != null) {
			return questionnaires;
		}else {
			return null;
		}
	}
	
	public Integer deleteOne(Integer questionnaireId){
		return this.questionnaireDao.deleteByPrimaryKey(questionnaireId);
	}
	
	
}
