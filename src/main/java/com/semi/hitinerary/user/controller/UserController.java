package com.semi.hitinerary.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value="/user/registerUser", method = RequestMethod.GET)
	public String registerTypeUser() {
		return "/user/registerUser";
	}
	
	@RequestMapping(value="/user/registerCompany", method = RequestMethod.GET)
	public String registerTypeCo() {
		return "/user/registerCompany";
	}
		
	// 일반회원가입
	@RequestMapping(value="/user/registerUser", method=RequestMethod.POST)
	public String userRegister(HttpServletRequest request, @ModelAttribute User user, Model model, @RequestParam("domain-input") String domainInput) {
		try {
			String email = user.getUserEmail() + "@" + domainInput;
			user.setUserEmail(email);
			int result = uService.insertUser(user); 
			if(result > 0) {
				return "redirect:/index.jsp";
			} else {
				model.addAttribute("msg", "회원가입 실패");
				return "common/error";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 기업회원가입
	@RequestMapping(value="/user/registerCompany", method=RequestMethod.POST)
	public String companyRegister(HttpServletRequest request, @ModelAttribute User user, Model model, @RequestParam("domain-input") String domainInput) {
		try {
			String email = user.getUserEmail() + "@" + domainInput;
			user.setUserEmail(email);
			int result = uService.insertCoUser(user); 
			if(result > 0) {
				return "redirect:/index.jsp";
			} else {
				model.addAttribute("msg", "회원가입 실패");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
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
	
	// 일반회원 마이페이지
	@RequestMapping(value = "/user/mypageUser", method= {RequestMethod.GET, RequestMethod.POST})
	public String showUserMypage() {
		return "/user/mypageUser";
	}
	
	// 관리자 마이페이지 화면 접속
	@RequestMapping(value = "/manager/mypage", method=RequestMethod.GET)
	public String writeView() {
		return "manager/mypage";
	}
}
