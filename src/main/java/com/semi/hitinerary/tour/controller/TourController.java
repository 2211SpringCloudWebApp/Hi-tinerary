package com.semi.hitinerary.tour.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.semi.hitinerary.tour.domain.Tour;
import com.semi.hitinerary.tour.service.TourService;

@Controller
public class TourController {
	@Autowired
	private TourService tService;

	// 패키지게시판 리스트 보기
	@RequestMapping(value = "/tour/tourBoardList", method = RequestMethod.GET)
	public String TourBoardListView() {
		return "tour/tourBoardList";
	}

	// 패키지게시판 글쓰기페이지 보기
	@RequestMapping(value = "/tour/tourBoardWrite", method = RequestMethod.GET)
	public String TourBoardWriteView() {
		return "tour/tourBoardWrite";
	}

	// 패키지게시판 글등록하기
	@RequestMapping(value = "/tour/tourBoardWriteUp", method = RequestMethod.POST)
	public String TourBoardWriteUp(Model model, HttpServletRequest request) {

		
		String tourTitle = request.getParameter("tourTitle");
		String tourContent = request.getParameter("tourContent");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String price = request.getParameter("price");
		String deadline = request.getParameter("deadline");
		String currentPeople = request.getParameter("currentPeople");
		String maxPeople = request.getParameter("maxPeople");
		String minPeople = request.getParameter("minPeople");
		String tourImage = request.getParameter("tourImage");
		String thumbnail = request.getParameter("thumbnail");
		int userNo = 1;
		
		int result = tService.insertPosting(tour);
		if (result > 0) {
			return "redirect:/tour/tourBoardList";
		} else {
			// model.addAttribute("msg", "등록 안됐음");
			return "redirect:/tour/tourBoardList";
		}

	}

}
