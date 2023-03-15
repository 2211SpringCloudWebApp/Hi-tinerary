package com.semi.hitinerary.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.semi.hitinerary.user.domain.User;
import com.semi.hitinerary.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService uService;
	
	// 회원가입 분류창
		@RequestMapping(value="/user/registerType", method = RequestMethod.GET)
		public String registerType() {
			return "user/registerType";
		}
	
	// 로그인창
	@RequestMapping(value="/user/login", method = RequestMethod.GET)
	public String Login() {
		return "user/login";
	}
	
	// 로그인
	@RequestMapping(value="/user/login", method = RequestMethod.POST)
	public String Login(HttpServletRequest request, @ModelAttribute User user, String userId, Model model) {
		try {
			User result = uService.Login(user);
			if(result != null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", result);
				model.addAttribute("name", user.getUserNickname());
				model.addAttribute("userGrade", user.getUserGrade());
				model.addAttribute("userNo", user.getUserNo());
				return "redirect:/index.jsp";
			} else {
				model.addAttribute("msg", "로그인 실패");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 로그아웃
	@RequestMapping(value="/user/logout", method=RequestMethod.GET)
	public String Logout(HttpSession session, Model model) {
		if (session != null) {
			session.invalidate();
			return "redirect:/index.jsp";
		} else {
			model.addAttribute("msg", "로그아웃 실패");
			return "common/error";
		}
	}
}
