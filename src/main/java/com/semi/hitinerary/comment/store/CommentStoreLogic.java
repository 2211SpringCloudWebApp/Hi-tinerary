package com.semi.hitinerary.comment.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.hitinerary.comment.domain.Comment;

@Repository
public class CommentStoreLogic implements CommentStore{


	@Override
	public List<Comment> selectListComment(SqlSession session, int boardNo) {
		List<Comment> cList = session.selectList("commentMapper.selectListComment", boardNo);
		return cList;
	}

	@Override
	public int insertGroupBoardComment(SqlSession session, Comment comment) {
		int result = session.insert("commentMapper.insertGroupBoardComment", comment);
		return result;
	}

	@Override
	public int insertGroupBoardReply(SqlSession session, Comment comment) {
		int result = session.insert("commentMapper.insertGroupBoardReply", comment);
		return result;
	}

	@Override
	public int deleteGroupBoardComment(SqlSession session, int commentNo) {
		int result = session.delete("commentMapper.deleteGroupBoardComment", commentNo);
		return result;
	}


}
