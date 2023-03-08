package com.semi.hitinerary.group.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.semi.hitinerary.group.domain.Group;
import com.semi.hitinerary.group.service.GroupService;
import com.semi.hitinerary.user.domain.User;

@Controller
public class GroupController {
	
	@Autowired
	GroupService gService;
	
	@RequestMapping(value="/group/register", method= RequestMethod.GET )
	public String viewRegsiterGroup(HttpSession session) {
		session.setAttribute("userId", "test1");
		return "group/create";
	}
	
	@RequestMapping(value="/group/register.do", method = RequestMethod.POST)
	public String RegisterGroup(){
		User user;
		user = gService.selectUser();
		System.out.println(user.toString());
		return "/group/create";
	}
}
