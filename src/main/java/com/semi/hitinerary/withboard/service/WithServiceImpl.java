package com.semi.hitinerary.withboard.service;

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
	 * 동행 찾기 게시판 등록 ServiceImpl
	 */
	@Override
	public int insertWithBoard(With with) {
		return wStore.insertWithBoard(session, with);
	}
}
