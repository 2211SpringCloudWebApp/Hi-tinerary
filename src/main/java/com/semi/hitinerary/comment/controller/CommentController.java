package com.semi.hitinerary.comment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.semi.hitinerary.comment.domain.Comment;
import com.semi.hitinerary.comment.domain.CommentInfo;
import com.semi.hitinerary.comment.service.CommentService;
import com.semi.hitinerary.freeboard.domain.Freeboard;

@Controller
public class CommentController {
	
	@Autowired
	CommentService cService;
	
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
	
	public String ListToHtml(CommentInfo cInfo) {
		List<Integer> cNumber = cInfo.getcNumber();
		Map<Integer, List<Comment>> cMap = cInfo.getcMap();
		StringBuilder sb = new StringBuilder();
		for(int num : cNumber) {
			List<Comment> cList = cMap.get(num);
			Comment comment = cList.get(0);
			sb.append("<div class='comment-area'><span>" + comment.getUserNo() +"</span><span>" + comment.getContent() + "</span></div>");
			for(int i = 1; i < cList.size(); i++) {
				comment = cList.get(i);
				sb.append("<div class='reply-area'><span>" + comment.getUserNo() +"</span><span>" + comment.getContent() + "</span></div>");
			}
			
		}
		return sb.toString();
	}
	
	@RequestMapping(value = "/freeboard/comment/write", method=RequestMethod.POST)
	public String writeFreeboardComment(
			@ModelAttribute Freeboard freeboard
			, Model model
			, HttpServletRequest request) {
		try {

			int result = cService.insertFreeboardComment(comment);

			if(result > 0) {
				return "redirect:/freeboard/detail?boardNo="+freeboard.getBoardNo();
			}else {
				model.addAttribute("msg", "댓글 등록되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	@RequestMapping(value="/freeboard/comment/list", method=RequestMethod.GET)
	public void ListFreeboardComment(
			@ModelAttribute Comment comment
			) {
		int freeBoardNo = 1;
		List<Comment> cList = cService.ListFreeboardComment(freeBoardNo);
	}
}
