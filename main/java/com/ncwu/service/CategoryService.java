package com.ncwu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ncwu.dao.CategoryDao;
import com.ncwu.model.Category;

@Service
public class CategoryService {

	@Autowired
	private CategoryDao categoryDao;
	
	public List<Category> getList(){
		return this.categoryDao.selectListAndCount();
	}
	

}
