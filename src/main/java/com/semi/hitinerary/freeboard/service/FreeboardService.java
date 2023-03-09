package com.semi.hitinerary.freeboard.service;

import java.util.List;

import com.semi.hitinerary.freeboard.domain.Freeboard;
import com.semi.hitinerary.freeboard.domain.PageInfo;

public interface FreeboardService {

	/**
	 * 게시글 등록 Service
	 * @param freeboard
	 * @return int
	 */
	public int insertFreeboard(Freeboard freeboard);

	/**
	 * 게시글 전체 개수 Service
	 * @return int
	 */
	public int getListCount();

	/**
	 * 게시글 리스트 조회 Service
	 * @param pi
	 * @return List<Freeboard>
	 */
	public List<Freeboard> selectFreeboardList(PageInfo pi);

	/**
	 * 게시글 상세조회 Service
	 * @param boardNo
	 * @return Freeboard
	 */
	public Freeboard selectOneById(int boardNo);

	/**
	 * 게시글 삭제 Service
	 * @param boardNo
	 * @return
	 */
	public int deleteFreeboard(int boardNo);

}
