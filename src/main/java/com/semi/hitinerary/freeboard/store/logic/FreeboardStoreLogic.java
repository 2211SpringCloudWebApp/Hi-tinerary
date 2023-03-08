package com.semi.hitinerary.freeboard.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.semi.hitinerary.freeboard.domain.Freeboard;
import com.semi.hitinerary.freeboard.service.FreeboardService;
import com.semi.hitinerary.freeboard.store.FreeboardStore;
@Repository
public class FreeboardStoreLogic implements FreeboardStore{

	@Override
	public int insertFreeboard(SqlSession session, Freeboard freeboard) {
		return session.insert("freeboardMapper.insertFreeboard", freeboard);
	}

}
