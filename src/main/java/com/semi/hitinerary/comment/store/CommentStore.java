package com.semi.hitinerary.comment.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.hitinerary.comment.domain.Comment;

public interface CommentStore {

	public List<Comment> selectListComment(SqlSession session,int boardNo);

	public int insertGroupBoardComment(SqlSession session, Comment comment);

	public int insertGroupBoardReply(SqlSession session, Comment comment);

	public int deleteGroupBoardComment(SqlSession session, int commentNo);

	/**
	 * 자유게시판 댓글 리스트 불러오기 Store
	 * @param freeBoardNo
	 * @return List<Comment>
	 */
	public List<Comment> ListFreeboardComment(SqlSession session, int freeBoardNo);

	/**
	 * 자유게시판 댓글 작성 Store
	 * @param session
	 * @param comment
	 * @param boardNo 
	 * @return int
	 */
	public int insertFreeboardComment(SqlSession session, Comment comment);

	/**
	 * 동행게시판 댓글 작성 Store
	 * @param session
	 * @param comment
	 * @return int
	 */
	public int insertWithBoardComment(SqlSession session, Comment comment);

	/**
	 * 동행게시판 댓글 목록 조회 Store
	 * @param session
	 * @param boardNo
	 * @return
	 */
	public List<Comment> selectListWithComment(SqlSession session, int boardNo);
	/**
	 * 자유게시판 댓글 채택 Store
	 * @param session
	 * @param comment
	 * @return int
	 */
	public int updateFreeBoardComment(SqlSession session, Comment comment);

	/**
	 * 자유게시판 댓글 삭제 Store
	 * @param commentNo
	 * @return int
	 */
	public int deleteFreeBoardComment(SqlSession session, int commentNo);


}
