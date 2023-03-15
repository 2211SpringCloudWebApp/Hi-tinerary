package com.semi.hitinerary.withboard.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<With> selectWithBoardList() {
		List<With> wList = wStore.selectWithBoardList(session);
		return wList;
	}

	/**
	 * 동행찾기 상세 조회 ServiceImpl
	 */
	@Override
	public With selectOneById(int boardNo) {
		With with = wStore.selectOneById(session, boardNo);
		return with;
	}

	/**
	 * 동행찾기 수정하기 ServiceImpl
	 */
	@Override
	public int updateWithBoard(With with) {
		return wStore.updateWithBoard(session, with);
	}
}
