package com.semi.hitinerary.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.semi.hitinerary.report.service.ReportService;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService rService;
	
	// 신고페이지 접속
	@RequestMapping(value = "/report", method = RequestMethod.POST)
	public String reportView(
			@RequestParam("userNo") int userNo
			,@RequestParam("boardNo") int boardNo
			,@RequestParam("commentNo") String commentNo
			,@RequestParam("boardType") String boardType
			, Model model) {
		
		System.out.println(userNo);
		System.out.println(boardNo);
		System.out.println(commentNo);
		System.out.println(boardType);
		
		model.addAttribute("userNo",userNo);
		model.addAttribute("boardNo",boardNo);
		model.addAttribute("commentNo",commentNo);
		model.addAttribute("boardType",boardType);
		
		return "report/report";
	}
	
	// 신고버튼 클릭
	@RequestMapping(value = "/clickReport", method = RequestMethod.GET)
	public String clickReport(
			@RequestParam("boardNo") int boardNo
			,@RequestParam("boardType") String boardType
			,@RequestParam("reportReason") String reportReason
			) {
			System.out.println(boardNo);
			System.out.println(boardType);
			System.out.println(reportReason);
			
		if(boardType.equals("free")) {
			return "redirect:/freeboard/detail?boardNo=" + boardNo;
		}else if(boardType.equals("with")) {
			return "redirect:/withboard/withBoardDetail?boardNo=" + boardNo;
		}else if(boardType.equals("tour")) {
			return "redirect:/tour/tourBoardDetail?tourNo=" + boardNo;
		}
		return "common/error";
	}
	
	// 뒤로가기 버튼 클릭
	@RequestMapping(value = "/rollbackView", method = RequestMethod.GET)
	public String rollbackView(
			@RequestParam("boardNo") int boardNo
			,@RequestParam("boardType") String boardType
			) {
		
		if(boardType.equals("free")) {
			return "redirect:/freeboard/detail?boardNo=" + boardNo;
		}else if(boardType.equals("with")) {
			return "redirect:/withboard/withBoardDetail?boardNo=" + boardNo;
		}else if(boardType.equals("tour")) {
			return "redirect:/tour/tourBoardDetail?tourNo=" + boardNo;
		}
		return "common/error";
	}
	
}
