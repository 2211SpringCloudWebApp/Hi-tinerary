package com.semi.hitinerary.freeboard.service;

import java.util.List;

import com.semi.hitinerary.freeboard.domain.Freeboard;
import com.semi.hitinerary.freeboard.domain.PageInfo;
import com.semi.hitinerary.freeboard.domain.Search;

public interface FreeboardService {

	/**
	 * 게시글 등록 Service
	 * @param freeboard
	 * @return int
	 */
	public int insertFreeboard(Freeboard freeboard);
	/**
	 * 게시글 수정 Service
	 * @param freeboard
	 * @return int
	 */
	public int modifyFreeboard(Freeboard freeboard);
	/**
	 * 게시글 전체 개수 Service
	 * @return int
	 */
	public int getListCount(Search search);

	/**
	 * 게시글 리스트 조회 Service
	 * @param pi
	 * @return List<Freeboard>
	 */
	public List<Freeboard> selectFreeboardList(PageInfo pi, Search search);

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

	/**
	 * 게시글 검색 게시물 수 Service
	 * @param search
	 * @return int
	 */
	public int getSearchListCount(Search search);

	/**
	 * 게시글 검색 목록 조회 Service
	 * @param pi
	 * @param search
	 * @return List<Freeboard>
	 */
	public List<Freeboard> selectListByKeyword(PageInfo pi, Search search);

	/**
	 * 닉네임 조회 Service
	 * @param boardNo
	 * @return
	 */
	public String selectNickname(int boardNo);
	
	/**
	 * 시퀀스 넘버 조회 Service
	 * @return int
	 */
	public int getSequence();
	
	/**
	 * 질문글 답변 채택 Service
	 * @param freeBoardNo
	 * @return
	 */
	public int updateFreeBoardCheck(int freeBoardNo);

}
