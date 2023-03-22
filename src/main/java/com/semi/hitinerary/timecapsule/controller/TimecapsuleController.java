package com.semi.hitinerary.timecapsule.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.semi.hitinerary.group.service.GroupService;
import com.semi.hitinerary.timecapsule.domain.Timecapsule;
import com.semi.hitinerary.timecapsule.service.TimecapsuleService;
import com.semi.hitinerary.user.domain.User;
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
	private String invite(@ModelAttribute Timecapsule timecapsule, int boardNo){
		try {
			timecapsule.createIden();
			timecapsule.setUserEmail(uService.selectOneByNo(timecapsule.getUserNo()).getUserEmail());
			int result = tService.registGroup(timecapsule,boardNo);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}				
		return "redirect:/withboard/withBoardDetail?boardNo=" + boardNo;
	}
	
	@RequestMapping(value="/group/write/capsuleView", method = RequestMethod.POST)
	public String writeCapsuleView(int groupNo, String groupName, Model model
			,HttpSession session) {
		User user = (User)session.getAttribute("loginUser");
		Timecapsule timecapsule = new Timecapsule();
		timecapsule.setGroupNo(groupNo);
		timecapsule.setUserNo(user.getUserNo());
		timecapsule.createIden();
		timecapsule = tService.SelectOneByIden(timecapsule);
		if(timecapsule != null) {
			model.addAttribute("timecapsule", timecapsule);			
		}
		model.addAttribute("groupName", groupName);
		model.addAttribute("groupNo", groupNo);
		return "/group/writecapsule";
	}
	
	@RequestMapping(value="/group/write/capsule", method = RequestMethod.POST)
	public String writeCapsule(HttpServletRequest request,
			@RequestParam(value="uploadFile", required = false) MultipartFile uploadFile
			,int userNo
			,int groupNo
			,String capsuleTitle
			,String capsuleContent) {
		
		Timecapsule timecapsule = new Timecapsule();
		timecapsule.setGroupNo(groupNo);
		timecapsule.setUserNo(userNo);
		timecapsule.createIden();
		timecapsule = tService.SelectOneByIden(timecapsule);
		if(!uploadFile.isEmpty()) {
			//기존 업로드 된 파일 체크 후
			if(timecapsule.getCapsuleImage() != null) {
				//기존 파일 삭제
				try {
					this.deleteFile(timecapsule.getCapsuleImage(), request);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			//새로 업로드 된 파일 복사(지정된 경로 업로드)
			String modifyPath = this.saveFile(uploadFile, request, groupNo, userNo);
			if(modifyPath != null) {
				timecapsule.setCapsuleImage(modifyPath);
			}
		}else {
			timecapsule.setCapsuleImage("");
		}
		timecapsule.setCapsuleTitle(capsuleTitle);
		timecapsule.setCapsuleSubject(capsuleContent);
		int result = tService.insertTimeCapsule(timecapsule);		
		return "redirect:/group/groupinfopage";
	}
	
	private String saveFile(MultipartFile uploadFile, HttpServletRequest request, int groupNo,int userNo) {
		try {
			//내가 원하는 경로 : 프로젝트 경로
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\cuploadFiles\\[" + userNo + "]capsule";
			//폴더가 없을 경우 자동으로 만들어주기 위한 코드(폴더가 있는 경우 동작 안함)
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdirs();
			}
			//실제 파일 저장
			String filePath = savePath + "\\[" + groupNo +"]"+ uploadFile.getOriginalFilename();
			File file = new File(filePath);
			filePath = "resources\\cuploadFiles\\[" + userNo + "]capsule\\[" + groupNo +"]"+ uploadFile.getOriginalFilename();
			uploadFile.transferTo(file);
			return filePath;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 파일 삭제
	private void deleteFile(String filename, HttpServletRequest request) throws Exception {
		String root = request.getSession().getServletContext().getRealPath("webapp");
		String delFilepath = root + "\\" + filename;
		File delFile = new File(delFilepath);
		if (delFile.exists()) {
			delFile.delete();
		}
	}
}
