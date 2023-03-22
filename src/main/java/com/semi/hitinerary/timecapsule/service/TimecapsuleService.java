package com.semi.hitinerary.timecapsule.service;

import java.util.List;

import com.semi.hitinerary.timecapsule.domain.Timecapsule;
import com.semi.hitinerary.user.domain.User;

public interface TimecapsuleService {

	public int registGroup(Timecapsule timecapsule);

	public int deleteGroupUser(String groupNoUserNo);

	public int registGroup(Timecapsule timecapsule, int boardNo) throws Exception;

	public int insertTimeCapsule(Timecapsule timecapsule);

	public Timecapsule SelectOneByIden(Timecapsule timecapsule);

	public int selectGetCountCapsule(int groupNo);

	public List<Timecapsule> selectListByGroupNo(int groupNo);


}
