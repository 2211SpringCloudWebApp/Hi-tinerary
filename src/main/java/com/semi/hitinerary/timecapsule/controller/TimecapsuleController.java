package com.semi.hitinerary.timecapsule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.semi.hitinerary.group.service.GroupService;
import com.semi.hitinerary.timecapsule.domain.Timecapsule;
import com.semi.hitinerary.timecapsule.service.TimecapsuleService;
import com.semi.hitinerary.user.service.UserService;
import com.semi.hitinerary.withboard.service.WithService;

@Controller
public class TimecapsuleController {

	@Autowired
	private UserService uService;
	
	@Autowired
	private TimecapsuleService tService;
	
	@Autowired
	private GroupService gService;
	
	@Autowired
	private WithService wService;
	
	@RequestMapping(value="/group/invite", method=RequestMethod.POST)
	private String invite(@ModelAttribute Timecapsule timecapsule, int boardNo) {
		timecapsule.createIden();
		timecapsule.setUserEmail(uService.selectOneByNo(timecapsule.getUserNo()).getUserEmail());
		int result = tService.registGroup(timecapsule);
		if(result > 0) {
			int result1 = gService.plusCommentPeople(timecapsule.getGroupNo());
			int result2 = wService.plusCommentPeople(boardNo);
		}
		return "redirect:/withboard/withBoardDetail?boardNo=" + boardNo;
	}
}
