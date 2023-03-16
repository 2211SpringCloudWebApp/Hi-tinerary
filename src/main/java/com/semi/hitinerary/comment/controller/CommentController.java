package com.semi.hitinerary.comment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.semi.hitinerary.comment.domain.Comment;
import com.semi.hitinerary.comment.domain.CommentInfo;
import com.semi.hitinerary.comment.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	CommentService cService;
	
	@RequestMapping(value="/group/board/comment/write", method=RequestMethod.POST)
	public String insertGroupBoardComment(
			String groupIndex
			,@ModelAttribute Comment comment
			,Model model) {
		int result = cService.insertGroupBoardComment(comment);
		int groupBoardNo = comment.getGroupBoardNo();
		return "redirect:/group/board/detail?groupBoardNo=" + groupBoardNo + "&groupIndex=" + groupIndex;
	}
	
	@RequestMapping(value="/group/board/reply/write", method=RequestMethod.POST)
	public String insertGroupBoardReply(
			String groupIndex
			,@ModelAttribute Comment comment
			,Model model) {
		int result = cService.insertGroupBoardReply(comment);
		int groupBoardNo = comment.getGroupBoardNo();
		return "redirect:/group/board/detail?groupBoardNo=" + groupBoardNo + "&groupIndex=" + groupIndex;
	}
	
	@RequestMapping(value="/group/board/comment/delete",method=RequestMethod.POST)
	public String deleteGroupComment(
			String groupIndex
			,int commentNo
			,int groupBoardNo
			,Model model) {
		System.out.println(groupIndex);
		int result = cService.deleteGroupBoardComment(commentNo);
		return "redirect:/group/board/detail?groupBoardNo=" + groupBoardNo + "&groupIndex=" + groupIndex;
	}
	
	public CommentInfo CommentList(int boardNo) {
		List<Integer> cNumber = null;
		List<Comment> cList = cService.selectListComment(boardNo);
		Map<Integer, List<Comment>> cMap = new HashMap<Integer, List<Comment>>();
		if(!cList.isEmpty()) {
			cNumber = new ArrayList<Integer>();
			for(int i = 0; i < cList.size(); i++) {
				Comment comment = cList.get(i);
				if(comment.getDepth() == 0) {
					List<Comment> List = new ArrayList<Comment>();
					List.add(comment);
					cMap.put(comment.getCommentNo(), List);
					cNumber.add(comment.getCommentNo());
				}
				if(comment.getDepth() == 1) {
					List<Comment> List = cMap.get(comment.getRefCommentNo());
					List.add(comment);
					cMap.put(comment.getRefCommentNo(), List);
				}
			}			
		}
		if(!cList.isEmpty()) {
			CommentInfo cInfo = new CommentInfo(cNumber, cMap);
			return cInfo;
		}
		return null;
	}
}
