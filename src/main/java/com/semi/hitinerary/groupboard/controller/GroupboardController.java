package com.semi.hitinerary.groupboard.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.semi.hitinerary.comment.controller.CommentController;
import com.semi.hitinerary.comment.domain.Comment;
import com.semi.hitinerary.comment.domain.CommentInfo;
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
	
	@Autowired
	CommentController cController;
	
	@RequestMapping(value="/group/board/writeView", method=RequestMethod.POST)
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
	
	@RequestMapping(value="/group/board/write", method = RequestMethod.POST)
	public String groupBoardWrite(
				String groupIndex
				,String groupNo
				,String groupTitle
				,String groupSubject
				,HttpSession session) {
		int userNo = (Integer)session.getAttribute("loginUser");
		Groupboard gBoard = new Groupboard(groupTitle, groupSubject, Integer.parseInt(groupNo), userNo);
		int result = gBService.insertBoard(gBoard);
		return "redirect:/group/groupinfopage?groupIndex=" + groupIndex;
	}
	
	@RequestMapping(value="/group/board/detail", method=RequestMethod.GET)
	public String groupBoardView(
			int groupBoardNo
			,String groupIndex
			,Model model) {
		Groupboard gBoard = gBService.selectOneGroupBoard(groupBoardNo);
		model.addAttribute("gBoard", gBoard);
		CommentInfo cInfo = null;
		cInfo = cController.CommentList(groupBoardNo);
		if(cInfo != null) {
			String html = cController.ListToHtml(cInfo);
			model.addAttribute("write", html);			
		}
		model.addAttribute("groupIndex", groupIndex);
		return "groupboard/detail";
	}
	
	@RequestMapping(value="/group/board/delete", method = RequestMethod.POST)
	public String groupBoardDelete(
			String groupIndex
			,String groupBoardNo) {
		int result = gBService.deleteBoard(groupBoardNo);
		return "redirect:/group/groupinfopage?groupIndex=" + groupIndex;
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
