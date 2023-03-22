package com.semi.hitinerary.withboard.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.semi.hitinerary.common.Pagination;
import com.semi.hitinerary.withboard.domain.With;
import com.semi.hitinerary.withboard.store.WithStore;

@Service
public class WithServiceImpl implements WithService{

	@Autowired
	private WithStore wStore;
	
	@Autowired
	private SqlSession session;

	/**
	 * 동행찾기 게시판 등록 ServiceImpl
	 */
	@Override
	public int insertWithBoard(With with) {
		return wStore.insertWithBoard(session, with);
	}

	/**
	 * 동행찾기 목록 조회 ServiceImpl
	 */
	@Override
	public List<With> selectWithBoardList(Pagination pi) {
		List<With> wList = wStore.selectWithBoardList(session, pi);
		return wList;
	}

	/**
	 * 동행찾기 상세 조회 ServiceImpl
	 */
	@Override
	public With selectOneByNo(int boardNo) {
		With with = wStore.selectOneByNo(session, boardNo);
		return with;
	}

	/**
	 * 동행찾기 수정하기 ServiceImpl
	 */
	@Override
	public int updateWithBoard(With with) {
		return wStore.updateWithBoard(session, with);
	}

	/**
	 * 동행찾기 게시물 삭제하기 ServiceImpl
	 */
	@Override
	public int deleteWithBoard(int boardNo) {
		int result = wStore.deleteWithBoard(session, boardNo);
		return result;
	}

	/**
	 * 시퀀스 넘버 조회 ServiceImpl
	 */
	@Override
	public int getSequence() {
		return wStore.getSequence(session);
	}

	@Override
	public int selectWithBoardCount() {
		int totalCount = wStore.selectWithBoardCount(session);
		return totalCount;
	}


	@Override
	public int selectCountByUserNo(int userNo) {
		int totalCount = wStore.selectCountByUserNo(session, userNo);
		return totalCount;
	}

	@Override
	public List<With> selectByUserNo(int userNo, Pagination pi) {
		List<With> wList = wStore.selectByUserNo(session, userNo, pi);
		return wList;
	}

	/**
	 * 동행찾기 게시판 현재 인원수 플러스
	 */
	@Override
	public int plusCommentPeople(int userNo) {
		int result = wStore.plusCommentPeople(session, userNo);
		return result;
	}

}
