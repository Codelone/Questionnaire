package com.ncwu.dao;

import java.util.List;

import tk.mybatis.mapper.common.Mapper;

import com.ncwu.model.Category;

public interface CategoryDao extends Mapper<Category>{

	List<Category> selectListAndCount();
	
}
