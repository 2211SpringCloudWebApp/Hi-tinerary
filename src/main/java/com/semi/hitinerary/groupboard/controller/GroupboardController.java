package com.semi.hitinerary.groupboard.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.semi.hitinerary.common.Pagination;
import com.semi.hitinerary.group.service.GroupService;
import com.semi.hitinerary.groupboard.domain.Groupboard;
import com.semi.hitinerary.groupboard.domain.NavigationNList;
import com.semi.hitinerary.groupboard.domain.PagiInfoGroupBoard;
import com.semi.hitinerary.groupboard.service.GroupboardService;

@Controller
public class GroupboardController {
	
	@Autowired
	GroupboardService gBService;
	
	@Autowired
	GroupService gService;
	
	@RequestMapping(value="/group/writeView", method=RequestMethod.POST)
	public String groupBoardWriteView(
			@RequestParam("groupName") String groupName
			,String groupNo
			,String groupIndex
			,Model model) {
		model.addAttribute("groupName", groupName);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("groupIndex", groupIndex);
		return "groupboard/write";
	}
	
	@RequestMapping(value="/group/write")
	public String groupBoardWrite(
				String groupIndex
				,String groupNo
				,String groupTitle
				,String groupSubject
				,HttpSession session) {
		int userNo = (Integer)session.getAttribute("loginUser");
		Groupboard gBoard = new Groupboard(groupTitle, groupSubject, Integer.parseInt(groupNo), userNo);
		int result = gBService.insertBoard(gBoard);
		return "redirect:/group/groupinfopage?groupIndex=" + groupIndex ;
	}
	
	public NavigationNList groupBoardList(int groupNo, int currentPage) {
		int totalCount = gBService.selectTotalCount(groupNo);
		Pagination pi = new Pagination(currentPage, totalCount);
		PagiInfoGroupBoard piInfo = new PagiInfoGroupBoard(pi, groupNo);
		List<Groupboard> gBList = gBService.selectListBoardByGroupNo(piInfo);
		NavigationNList naviNList = new NavigationNList(pi, gBList);
		return naviNList;
	}
}
