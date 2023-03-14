package com.semi.hitinerary.comment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.semi.hitinerary.comment.domain.Comment;
import com.semi.hitinerary.comment.domain.CommentInfo;
import com.semi.hitinerary.comment.service.CommentService;

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
}
