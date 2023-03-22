package com.semi.hitinerary.comment.store;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.hitinerary.comment.domain.Comment;
import com.semi.hitinerary.comment.domain.SearchComment;
import com.semi.hitinerary.common.Pagination;

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

	public List<Comment> ListFreeboardComment(SqlSession session, int freeBoardNo) {
		return session.selectList("commentMapper.ListFreeboardComment", freeBoardNo);
	}


	@Override
	public int insertFreeboardComment(SqlSession session, Comment comment) {
		// TODO Auto-generated method stub
		return session.insert("commentMapper.insertFreeboardComment", comment);
	}

	/**
	 * 동행 게시판 댓글 작성 StoreLogic
	 */
	@Override
	public int insertWithBoardComment(SqlSession session, Comment comment) {
		int result = session.insert("commentMapper.insertWithBoardComment", comment);
		return result;
	}

	/**
	 * 동행 게시판 댓글 목록 조회 StoreLogic
	 */
	@Override
	public List<Comment> selectListWithComment(SqlSession session, int boardNo) {
		List<Comment> cList = session.selectList("commentMapper.selectListWithComment", boardNo);
		return cList;
	}
	
	@Override
	public int updateFreeBoardComment(SqlSession session, Comment comment) {
		return session.update("commentMapper.updateFreeBoardComment", comment);
	}

	@Override
	public int deleteFreeBoardComment(SqlSession session, int commentNo) {
		return session.delete("commentMapper.deleteFreeBoardComment", commentNo);
	}

	@Override
	public int selectCountByUserNo(SqlSession session, SearchComment sComment) {
		int totalCount = session.selectOne("commentMapper.selectCountByUserNo", sComment);
		return totalCount;
	}

	@Override
	public List<Comment> selectListByUserNo(SqlSession session, SearchComment sComment, Pagination pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowbounds = new RowBounds(offset, limit);
		List<Comment> cList = session.selectList("commentMapper.selectListByUserNo", sComment, rowbounds);
		return cList;
	}

	/**
	 * 동행찾기 게시판 대댓글 작성
	 */
	@Override
	public int insertWithBoardReplyComment(SqlSession session, Comment comment) {
		int result = session.insert("commentMapper.insertWithBoardReplyComment",comment);
		return result;
	}

}
