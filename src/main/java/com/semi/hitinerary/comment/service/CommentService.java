package com.semi.hitinerary.comment.service;

import java.util.List;

import com.semi.hitinerary.comment.domain.Comment;

public interface CommentService {

	public List<Comment> selectListComment(int boardNo);

	/**
	 * 자유게시판 댓글 리스트 가져오기 Service
	 * @param freeBoardNo
	 * @return List<Comment>
	 */
	public List<Comment> ListFreeboardComment(int freeBoardNo);

	/**
	 * 자유게시판 댓글 작성하기 Service
	 * @param comment
	 * @return
	 */
	public int insertFreeboardComment(Comment comment);


}
