package com.semi.hitinerary.comment.service;

import java.util.List;

import com.semi.hitinerary.comment.domain.Comment;
import com.semi.hitinerary.comment.domain.SearchComment;
import com.semi.hitinerary.common.Pagination;

public interface CommentService {

	public List<Comment> selectListComment(int boardNo);

	public int insertGroupBoardComment(Comment comment);

	public int insertGroupBoardReply(Comment comment);

	/**
	 * 동행게시판 댓글, 대댓글 삭제
	 * @param commentNo
	 * @return int
	 */
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
	
	/**
	 * 유저 마이페이지 댓글 개수 조회 Service
	 * @param sComment
	 * @return
	 */
	public int selectCountByUserNo(SearchComment sComment);
	
	/**
	 * 유저 마이페이지 댓글 개수 조회 Service
	 * @param sComment
	 * @param pi
	 * @return
	 */
	public List<Comment> selectListByUserNo(SearchComment sComment, Pagination pi);

	/**
	 * 동행찾기 게시판 대댓글 Service
	 * @param comment
	 * @return int
	 */
	public int insertWithBoardReplyComment(Comment comment);

}
