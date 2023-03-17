package com.semi.hitinerary.comment.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.hitinerary.comment.domain.Comment;
import com.semi.hitinerary.comment.store.CommentStore;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	SqlSession session;
	
	@Autowired
	CommentStore cStore;

	@Override
	public List<Comment> selectListComment(int boardNo) {
		List<Comment> cList = cStore.selectListComment(session, boardNo);
		return cList;
	}

	@Override
	public int insertGroupBoardComment(Comment comment) {
		int result = cStore.insertGroupBoardComment(session, comment);
		return result;
	}

	@Override
	public int insertGroupBoardReply(Comment comment) {
		int result = cStore.insertGroupBoardReply(session, comment);
		return result;
	}

	@Override
	public int deleteGroupBoardComment(int commentNo) {
		int result = cStore.deleteGroupBoardComment(session, commentNo);
		return result;
	}

	public List<Comment> ListFreeboardComment(int freeBoardNo) {
		return cStore.ListFreeboardComment(session, freeBoardNo);
	}


	@Override
	public int insertFreeBoardComment(Comment comment) {
		return cStore.insertFreeboardComment(session, comment);
	}

	@Override
	public int updateFreeBoardComment(Comment comment) {
		return cStore.updateFreeBoardComment(session, comment);
	}

	@Override
	public int deleteFreeBoardComment(int commentNo) {
		return cStore.deleteFreeBoardComment(session, commentNo);
	}

}
