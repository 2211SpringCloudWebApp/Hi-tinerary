package com.semi.hitinerary.withboard.service;

import java.util.List;

import com.semi.hitinerary.withboard.domain.With;

public interface WithService {

	/**
	 * 동행찾기 글쓰기 등록 Service
	 * @param with
	 * @return int
	 */
	public int insertWithBoard(With with);

	/**
	 * 동행찾기 목록 조회 Service
	 * @return
	 */
	public List<With> selectWithBoardList();
}
