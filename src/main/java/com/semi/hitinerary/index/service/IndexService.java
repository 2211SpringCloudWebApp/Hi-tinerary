package com.semi.hitinerary.index.service;

import java.util.List;

import com.semi.hitinerary.freeboard.domain.Freeboard;
import com.semi.hitinerary.tour.domain.Tour;
import com.semi.hitinerary.withboard.domain.With;

public interface IndexService {

	/**
	 * 투어게시판 리스트 불러옵시다 Service
	 * @return List<Tour>
	 */
	public List<Tour> selectTourList();

	/**
	 * 자유게시판 리스트 불로옵시다 Service
	 * @return List<Freeboard>
	 */
	public List<Freeboard> selectFreeList();

	/**
	 * 동행게시판 리스트 블러옵시다 Service
	 * @return List<With>
	 */
	public List<With> selectWithList();

}
