package com.semi.hitinerary.groupboard.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
import com.semi.hitinerary.user.domain.User;

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
		if(session.getAttribute("loginUser") == null) {
			return "redirect:/user/login";
		}
		User user = (User)session.getAttribute("loginUser");
		int userNo = user.getUserNo();
		Groupboard gBoard = new Groupboard(groupTitle, groupSubject, Integer.parseInt(groupNo), userNo);
		int result = gBService.insertBoard(gBoard);
		return "redirect:/group/groupinfopage?groupIndex=" + groupIndex;
	}
	
	@RequestMapping(value="/group/board/detail", method=RequestMethod.GET)
	public String groupBoardView(
			@RequestParam(value="groupBoardNo", required = false, defaultValue = "-1") String sGroupBoardNo
			,@RequestParam(value="groupIndex", required=false, defaultValue = "-1") String groupIndex
			,Model model) {
		try {
			if(sGroupBoardNo.equals("-1")) {
				return "redirect:/group/groupinfopage?groupIndex=" + groupIndex;
			}
			int groupBoardNo = Integer.parseInt(sGroupBoardNo);			
			Groupboard gBoard = gBService.selectOneGroupBoard(groupBoardNo);
			model.addAttribute("gBoard", gBoard);
			CommentInfo cInfo = null;
			cInfo = cController.CommentList(groupBoardNo);
			
			if(cInfo != null) {
				model.addAttribute("cInfo", cInfo);			
			}
			model.addAttribute("groupIndex", groupIndex);
		} catch (Exception e) {
			groupIndex = "-1";
			return "redirect:/group/groupinfopage?groupIndex=" + groupIndex;
		}
		return "groupboard/detail";
	}
	
	@RequestMapping(value="/group/board/delete", method = RequestMethod.POST)
	public String groupBoardDelete(
			String groupIndex
			,String groupBoardNo) {
		int result = gBService.deleteBoard(groupBoardNo);
		return "redirect:/group/groupinfopage?groupIndex=" + groupIndex;
	}
	
	@RequestMapping(value="/group/board/updateView", method = RequestMethod.POST)
	public String groupBoardUpdateView(
			int groupBoardNo,
			String groupIndex,
			String groupName,
			Model model) {
		Groupboard gBoard = gBService.selectOneGroupBoard(groupBoardNo);
		model.addAttribute("board", gBoard);
		model.addAttribute("groupIndex", groupIndex);
		model.addAttribute("groupName", groupName);
		return "groupboard/update";
	}
	
	@RequestMapping(value="/group/board/update",method=RequestMethod.POST)
	public String groupBoardUpdate(
			String groupIndex
			,@ModelAttribute Groupboard board) {
		int result = gBService.updateGroupBoard(board);
		return "redirect:/group/board/detail?groupBoardNo=" + board.getBoardNo() + "&groupIndex=" + groupIndex;
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
