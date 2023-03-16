package com.semi.hitinerary.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.semi.hitinerary.report.service.ReportService;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService rService;
	
	// 신고페이지 접속
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String reportView() {
		return "report/report";
	}
}
