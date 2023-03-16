package com.semi.hitinerary.comment.service;

import java.util.List;

import com.semi.hitinerary.comment.domain.Comment;

public interface CommentService {

	public List<Comment> selectListComment(int boardNo);

	public int insertGroupBoardComment(Comment comment);

	public int insertGroupBoardReply(Comment comment);

	public int deleteGroupBoardComment(int commentNo);



}
