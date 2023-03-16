package com.semi.hitinerary.comment.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.hitinerary.comment.domain.Comment;

public interface CommentStore {

	public List<Comment> selectListComment(SqlSession session,int boardNo);

	public int insertGroupBoardComment(SqlSession session, Comment comment);

	public int insertGroupBoardReply(SqlSession session, Comment comment);

	public int deleteGroupBoardComment(SqlSession session, int commentNo);



}
