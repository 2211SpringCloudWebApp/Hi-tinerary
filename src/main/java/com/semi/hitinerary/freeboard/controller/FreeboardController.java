package com.semi.hitinerary.freeboard.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.semi.hitinerary.freeboard.domain.Freeboard;
import com.semi.hitinerary.freeboard.service.FreeboardService;

@Controller
public class FreeboardController {

	@Autowired
	private FreeboardService fService;
	
	// 자유게시판 등록 화면
	@RequestMapping(value = "/freeboard/write", method=RequestMethod.GET)
	public String writeView() {
		return "freeboard/write";
	}
	
	// 자유게시판 글 등록하기
	@RequestMapping(value = "/freeboard/write", method=RequestMethod.POST)
	public String freeboardregister(
			@ModelAttribute Freeboard freeboard
			, @RequestParam(value="uploadFile", required = false) MultipartFile uploadFile
			, HttpServletRequest request
			, Model model) {
		try {
			// 파일이 있을 경우
			if(!uploadFile.getOriginalFilename().equals("")) {
				// 파일 복사(지정한 경로 업로드)
				String filePath = saveFile(uploadFile, request);
				if(filePath != null) { // 파일복사가 성공했으면, null이 아니면
					freeboard.setBoardImage(uploadFile.getOriginalFilename());
					freeboard.setBoardImage(filePath);
				}
			}
			int result = fService.insertFreeboard(freeboard);
			if(result > 0) {
				return "redirect:/freeboard/write";
			}else {
				model.addAttribute("msg", "공지사항이 등록되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	// 아래부분 다시 봐야함.
	// 지정 경로로 파일 복사(파일 업로드)
	private String saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		// 내가 원하는 경로 : 프로젝트 경로
		try {
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root + "\\nuploadFiles";
			// 폴더가 없을 경우 자동으로 생성하는 코드
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdir();
			}
			// 파일저장
			String filePath = savePath + "\\" + uploadFile.getOriginalFilename();
			File file = new File(filePath);
			uploadFile.transferTo(file); // 복사해서 저장하는 명령어
			return filePath;
		} catch (Exception e) { // 예외 발생시 null값 반환
			e.printStackTrace();
			return null;
		}
	}
}
