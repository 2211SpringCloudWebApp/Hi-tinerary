package com.semi.hitinerary.index.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.semi.hitinerary.freeboard.domain.Freeboard;
import com.semi.hitinerary.index.service.IndexService;
import com.semi.hitinerary.tour.domain.Tour;
import com.semi.hitinerary.tour.service.TourService;
import com.semi.hitinerary.withboard.domain.With;

@Controller
public class indexController {

	@Autowired
	private IndexService IService;

	//리스트들을 불러와 보자.
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String TourBoardListView(Model model
			) {
				
		List<Tour> tList = IService.selectTourList();	
		List<Freeboard> fList = IService.selectFreeList();
		List<With> wList = IService.selectWithList();
		
		model.addAttribute("tList", tList);
		model.addAttribute("fList", fList);
		model.addAttribute("wList", wList);
		return "/index"; 
	}
}
