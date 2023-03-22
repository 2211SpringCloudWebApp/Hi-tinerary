package com.semi.hitinerary.index.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.hitinerary.freeboard.domain.Freeboard;
import com.semi.hitinerary.tour.domain.Tour;
import com.semi.hitinerary.withboard.domain.With;

public interface IndexStore {

	/**
	 * 투어게시판 리스트 불러오기 Store
	 * @return List<Tour>
	 */
	public List<Tour> selectTourList(SqlSession session);

	/**
	 * 자유게시판 리스트 불러오기 Store
	 * @param session
	 * @return List<Freeboard>
	 */
	public List<Freeboard> selectFreeList(SqlSession session);

	/**
	 * 동행게시판 리스트 불러오기 Store
	 * @param session
	 * @return List<With>
	 */
	public List<With> selectWithList(SqlSession session);

}
