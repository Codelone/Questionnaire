package com.ncwu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import tk.mybatis.mapper.entity.Example;

import com.ncwu.dao.UserDao;
import com.ncwu.model.User;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	/**
	 * 根据用户名密码查询信息
	 * @param username
	 * @param password
	 * @return
	 */
	public User selectUser(String username,String password){
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		return this.userDao.selectOne(user);
		
	}
	
	public boolean usernameExist(String username){
		User user = new User();
		user.setUsername(username);
		return this.userDao.selectCount(user) > 0;
	}
	
	public Integer deleteByUsername(Integer username){
		Example example = new Example(User.class);
		example.createCriteria().andEqualTo("username", String.valueOf(username));
		return this.userDao.deleteByExample(example);
	}
	
	public Integer insertOne(Integer username,Integer authority){
		User user = new User();
		user.setUsername(String.valueOf(username));
		user.setPassword("123456");
		user.setAuthority(authority);
		return this.userDao.insertSelective(user);
	}
	
	public Integer updatePassword(String username,String password){
		Example example = new Example(User.class);
		example.createCriteria().andEqualTo("username", username);
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		return this.userDao.updateByExampleSelective(user, example);
	}
}
