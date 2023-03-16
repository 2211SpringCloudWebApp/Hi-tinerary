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
	 * @return
	 */
	public int insertFreeboardComment(SqlSession session, Comment comment);


}
