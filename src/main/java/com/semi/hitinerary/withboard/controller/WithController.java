package com.semi.hitinerary.withboard.controller;

import java.io.File;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.semi.hitinerary.withboard.domain.With;
import com.semi.hitinerary.withboard.service.WithService;

@Controller
public class WithController {
	
	@Autowired
	private WithService wService;
	
	@RequestMapping(value="/withboard/withWriteView", method=RequestMethod.GET)
	public String withWriteView() {
		return "withboard/withBoardWrite";
	}
	/**
	 * 동행찾기 글 쓰기
	 * @return
	 */
	@RequestMapping(value="/withboard/withBoardWrite", method=RequestMethod.POST)
	public String withWrite(
			@ModelAttribute With with,
			@RequestParam(value="start-Date") String startDate,
			@RequestParam(value="end-Date") String endDate
			, @RequestParam(value="uploadFile", required = false) MultipartFile uploadFile
			, HttpServletRequest request
			, Model model) {
		try {
			//파일이 있을 경우
			if(!uploadFile.getOriginalFilename().equals("")) {
				// 파일 복사(지정한 경로 업로드)
				String filePath = saveFile(uploadFile, request);
				// 파일 복사가 성공했으면?
				if(filePath != null) {
					with.setBoardImage(uploadFile.getOriginalFilename());
					with.setBoardImage(filePath);
				}
			}
			endDate += " 00:00:00";
			startDate += " 00:00:00";
			with.setStartDate(Timestamp.valueOf(startDate));
			with.setEndDate(Timestamp.valueOf(endDate));
			with.setUserNo(1);
			int result = wService.insertWithBoard(with);
			if(result > 0) {
				return "redirect:/withboard/withBoardList";
			} else {
				System.out.println(1);
				model.addAttribute("msg", "글 등록이 완료되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.getStackTrace();
			model.addAttribute("msg", "글 등록이 완료되지 않았습니다.");
			return "common/error";
		}
	}
	
	//지정 경로로 파일 복사(파일 업로드)
	private String saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		try {
			//내가 원하는 경로 : 프로젝트 경로
			String root = request.getSession().getServletContext().getRealPath("resources");
			int userNo = 1;
			String savePath = root + "\\wuploadFiles\\" + userNo + "withBoard";
			//폴더가 없을 경우 자동으로 만들어주기 위한 코드(폴더가 있는 경우 동작 안함)
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdirs();
			}
			//실제 파일 저장
			String filePath = savePath + "\\" + uploadFile.getOriginalFilename();
			File file = new File(filePath);
			uploadFile.transferTo(file);
			return filePath;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
//	private void deleteFile(String filename, HttpServletRequest request) throws Exception{
//		String root = request.getSession().getServletContext().getRealPath("resources");
//		int userNo = 1;
//		String delPath = root + "\\wuploadFiles\\" + userNo + "withBoard";
//		String delFilepath = delPath + "\\" + filename;
//		File delFile = new File(delFilepath);
//		if(delFile.exists()) {
//			delFile.delete();
//		}
//	}
}
