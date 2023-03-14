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

}
