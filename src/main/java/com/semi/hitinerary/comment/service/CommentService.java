package com.semi.hitinerary.comment.service;

import java.util.List;

import com.semi.hitinerary.comment.domain.Comment;

public interface CommentService {

	public List<Comment> selectListComment(int boardNo);

	public int insertGroupBoardComment(Comment comment);

	public int insertGroupBoardReply(Comment comment);

	public int deleteGroupBoardComment(int commentNo);

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
	public int insertFreeBoardComment(Comment comment);

	/**
	 * 자유게시판 댓글 채택 Service
	 * @param comment
	 */
	public int updateFreeBoardComment(Comment comment);

	/**
	 * 자유게시판 댓글 삭제 Service
	 * @param commentNo
	 * @return
	 */
	public int deleteFreeBoardComment(int commentNo);

	/**
	 * 동행게시판 댓글 작성하기 Service
	 * @param comment
	 * @return
	 */
	public int insertWithBoardComment(Comment comment);

	/**
	 * 동행게시판 댓글 목록조회 Service
	 * @param boardNo
	 * @return
	 */
	public List<Comment> selectListWithComment(int boardNo);

}
