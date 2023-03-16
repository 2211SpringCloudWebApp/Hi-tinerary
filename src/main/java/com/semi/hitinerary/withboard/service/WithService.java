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
	 * @return List<With>
	 */
	public List<With> selectWithBoardList();

	/**
	 * 동행찾기 상세 조회 Service
	 * @param boardNo
	 * @return With
	 */
	public With selectOneByNo(int boardNo);

	/**
	 * 동행찾기 수정 Service
	 * @param with
	 * @return int
	 */
	public int updateWithBoard(With with);

	/**
	 * 동행찾기 게시물 삭제 Service
	 * @param boardNo
	 * @return int
	 */
	public int deleteWithBoard(int boardNo);
}
