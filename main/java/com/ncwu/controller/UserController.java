package com.ncwu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ncwu.model.User;
import com.ncwu.service.UserService;

@Controller
@RequestMapping(value="user")
public class UserController {

	@Autowired
	private UserService service;
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject login(HttpSession session,@RequestBody JSONObject param){
		String username = param.getString("username");
		String password = param.getString("password");
		User user = this.service.selectUser(username, password);
		JSONObject jsonObject = new JSONObject();
		if (user == null) {
			jsonObject.put("success", false);
		}else {
			jsonObject.put("success", true);
			session.setAttribute("user", user);
			session.setMaxInactiveInterval(30*60);
			jsonObject.put("authority", user.getAuthority());
		}
		return jsonObject;
	}
	
	
	@RequestMapping(value="searchUsername",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject searchUsername(@RequestBody JSONObject param){
		JSONObject jsonObject = new JSONObject();
		if (this.service.usernameExist(param.getString("username"))) {
			jsonObject.put("success", true);
		}else {
			jsonObject.put("success", false);
		}		
		return jsonObject;
	}
	
	@RequestMapping(value="changePassword",method=RequestMethod.POST)
	@ResponseBody
	public JSONObject changePassword(@RequestBody JSONObject param, HttpSession session){
		JSONObject jsonObject = new JSONObject();
		User user = (User) session.getAttribute("user");
		String username = user.getUsername();
		String password = param.getString("newPassword");
		if (user.getPassword().equals(param.getString("password"))) {
			this.service.updatePassword(username, password);
			jsonObject.put("success", true);
		}else {
			jsonObject.put("success", false);
		}		
		return jsonObject;
	}
	
	
	
}
