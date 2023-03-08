package com.semi.hitinerary.freeboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.semi.hitinerary.freeboard.service.FreeboardService;

@Controller
public class FreeboardController {
	
	@Autowired
	private FreeboardService fService;
	
	// 공지사항 등록 화면
	@RequestMapping(value="/freeboard/writeView.kh", method=RequestMethod.GET)
	public String writeView() {
		return "freeboard/write";
	}
	
	
}
