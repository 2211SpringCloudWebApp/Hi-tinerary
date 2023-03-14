package com.semi.hitinerary.groupboard.service;

import java.util.List;

import com.semi.hitinerary.groupboard.domain.Groupboard;
import com.semi.hitinerary.groupboard.domain.PagiInfoGroupBoard;

public interface GroupboardService {

	public int insertBoard(Groupboard gBoard);

	public List<Groupboard> selectListBoardByGroupNo(PagiInfoGroupBoard piInfo);

	public int selectTotalCount(int groupNo);

	public int deleteBoard(String boardNo);

	public Groupboard selectOneGroupBoard(int groupBoardNo);


}
