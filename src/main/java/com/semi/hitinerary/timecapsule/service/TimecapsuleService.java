package com.semi.hitinerary.timecapsule.service;

import java.util.List;

import com.semi.hitinerary.timecapsule.domain.Timecapsule;
import com.semi.hitinerary.user.domain.User;

public interface TimecapsuleService {

	public int registGroup(Timecapsule timecapsule);

	public int deleteGroupUser(String groupNoUserNo);


}
