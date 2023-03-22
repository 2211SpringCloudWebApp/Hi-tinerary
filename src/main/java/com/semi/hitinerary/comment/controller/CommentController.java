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
import org.springframework.web.bind.annotation.RequestParam;

import com.semi.hitinerary.comment.domain.Comment;
import com.semi.hitinerary.comment.domain.CommentInfo;
import com.semi.hitinerary.comment.service.CommentService;
import com.semi.hitinerary.freeboard.domain.Freeboard;
import com.semi.hitinerary.freeboard.service.FreeboardService;

@Controller
public class CommentController {
	
	@Autowired
	CommentService cService;
	
	@Autowired
	FreeboardService fService;
	
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
	
	// 자유게시판 댓글 리스트 출력
	public List<Comment> ListFreeboardComment(int boardNo) {
		System.out.println("댓글 진입");
		List<Comment> cList = cService.ListFreeboardComment(boardNo);
		System.out.println(cList);
		return cList;
	}
	
	// 자유게시판 댓글쓰기
	@RequestMapping(value="/freeboard/comment/write", method=RequestMethod.POST)
	public String insertFreeBoardComment(
			@RequestParam("boardNo") int freeBoardNo
			,@ModelAttribute Comment comment
			,Model model) {
		System.out.println("댓글진입 프리보드 : " + freeBoardNo);
		comment.setFreeBoardNo(freeBoardNo);
		System.out.println("댓글진입 커맨트 : " + comment);
		int result = cService.insertFreeBoardComment(comment);
		return "redirect:/freeboard/detail?boardNo=" + freeBoardNo;
	}
	
	/**
	 * 동행찾기 게시판 댓글 쓰기
	 */
	@RequestMapping(value="/withboard/board/comment/write", method=RequestMethod.POST)
	public String writeComment(@RequestParam("CommentBoardNo") int boardNo
			, @RequestParam("CommentUserNo") int userNo
			, @RequestParam("Commentcontent") String Commentcontent) {
		Comment comment = new Comment(); 
		comment.setContent(Commentcontent);
		comment.setUserNo(userNo);
		comment.setWithBoardNo(boardNo);
		int result = cService.insertWithBoardComment(comment);
		return "redirect:/withboard/withBoardDetail?boardNo=" + boardNo;
	}
	
	/**
	 * 동행찾기 게시판 대댓글 쓰기
	 */
	@RequestMapping(value="/withboard/board/reply/write", method=RequestMethod.POST)
	public String replywriteComment(@RequestParam("CommentBoardNo") int withBoardNo
			, @RequestParam("CommentUserNo") int userNo
			, @RequestParam("replycontent") String content
			, @RequestParam("RefcommentNo") int refCommentNo) {
		Comment comment = new Comment(); 
		comment.setRefCommentNo(refCommentNo);
		comment.setContent(content);
		comment.setUserNo(userNo);
		comment.setWithBoardNo(withBoardNo);
		int result = cService.insertWithBoardReplyComment(comment);
		return "redirect:/withboard/withBoardDetail?boardNo=" + withBoardNo;
	}
	
	/**
	 * 동행찾기 게시판 댓글 목록 조회
	 * 
	 */
	public List<Comment> listComment(int boardNo) {
		List<Comment> cList = cService.selectListWithComment(boardNo);
		return cList;
	}
	
	/**
	 * 동행찾기 게시판 댓글 삭제하기
	 */
	@RequestMapping(value="/withboard/board/comment/delete", method=RequestMethod.GET)
	public String deleteWithComment(int boardNo, int commentNo) {
		int result = cService.deleteGroupBoardComment(commentNo);
		return "redirect:/withboard/withBoardDetail?boardNo=" + boardNo;
	}
	
	//자유게시판 댓글 채택하기
	@RequestMapping(value="/freeboard/comment/status", method=RequestMethod.POST)
	public String statusFreeBoardComment(
			@ModelAttribute Comment comment
			,@RequestParam("boardNo") int freeBoardNo) {
		
		int cResult = cService.updateFreeBoardComment(comment);
		int fResult = fService.updateFreeBoardCheck(freeBoardNo);
		
		return "redirect:/freeboard/detail?boardNo=" + freeBoardNo;
	}
	// 자유게시판 댓글 삭제
	@RequestMapping(value="/freeboard/comment/delete",method=RequestMethod.POST)
	public String deleteFreeboardComment(
			@RequestParam("boardNo") int boardNo
			,@RequestParam("commentNo") int commentNo
			,Model model) {
		int result = cService.deleteFreeBoardComment(commentNo);
		return "redirect:/freeboard/detail?boardNo=" + boardNo;
	}
	
	// 자유게시판 대댓글쓰기
	@RequestMapping(value="/freeboard/reply/write", method=RequestMethod.POST)
	public String insertFreeBoardReply(
			int BoardNo
			,@ModelAttribute Comment comment
			,Model model) {
		
		//int result = cService.insertFreeBoardReply(comment);
		int groupBoardNo = comment.getGroupBoardNo();
		return "redirect:/freeboard/detail?boardNo="+ BoardNo;
	}
	


}
