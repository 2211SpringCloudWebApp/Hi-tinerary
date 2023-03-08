package com.semi.hitinerary.freeboard.service;

import com.semi.hitinerary.freeboard.domain.Freeboard;

public interface FreeboardService {

	/**
	 * 게시글 등록 Service
	 * @param freeboard
	 * @return int
	 */
	public int insertFreeboard(Freeboard freeboard);

}
