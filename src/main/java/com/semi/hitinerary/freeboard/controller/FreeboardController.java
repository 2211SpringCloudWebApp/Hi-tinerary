package com.semi.hitinerary.freeboard.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.semi.hitinerary.freeboard.domain.Freeboard;
import com.semi.hitinerary.freeboard.domain.PageInfo;
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
	
	// 자유게시판 목록 조회
	@RequestMapping(value = "/freeboard/list", method=RequestMethod.GET)
	public ModelAndView freeboardView(ModelAndView mv
			, @RequestParam(value="page"
			, required=false
			, defaultValue="1") Integer page) {
		// 게시글 전체 수 조회
		int totalCount = fService.getListCount();
		System.out.println(totalCount);
		// 페이지 처리를 위한 함수
		PageInfo pi = this.getPageInfo(page, totalCount);
		System.out.println(pi);
		
		List<Freeboard> fList = fService.selectFreeboardList(pi);
		
		mv.addObject("pi",pi).addObject("fList", fList).setViewName("/freeboard/list");
		return mv;
	}
	
	//게시글 상세 조회
	@RequestMapping(value = "/freeboard/detail", method=RequestMethod.GET)
	public String freeboardView(@RequestParam("boardNo") int boardNo
			, Model model) {
		try {
			Freeboard freeboard = fService.selectOneById(boardNo);
			model.addAttribute("freeboard",freeboard);
			return "freeboard/detail";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
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
				return "redirect:/freeboard/list";
			}else {
				model.addAttribute("msg", "게시글이 등록되지 않았습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/error";
		}
	}
	
	// 게시글 삭제
	@RequestMapping(value="/freeboard/remove", method = RequestMethod.GET)
	public String freeboardRemove(@RequestParam("boardNo") int boardNo
			, Model model) {
		try {
			int result = fService.deleteFreeboard(boardNo);
			if(result > 0) {
				return "redirect:/freeboard/list";
			}else {
				model.addAttribute("msg", "삭제가 완료되지 않았습니다.");
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
			String savePath = root + "\\wuploadFiles\\" + "freeBoard";
			
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
	
	// navigator start, end값 설정 method()
	private PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int boardLimit = 10;
		int naviLimit = 5;
		int maxPage;
		int startNavi;
		int endNavi;
			
		maxPage = (int)((double)totalCount/boardLimit+0.9);
		// Math.ceil((double)totalCount/boardLimit);
		startNavi = (((int)((double)currentPage/naviLimit+0.9))-1) * naviLimit + 1;
		endNavi = startNavi + naviLimit - 1;
		if(endNavi > maxPage) {
			endNavi = maxPage;
		}
		pi = new PageInfo(currentPage, boardLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;
	}
		
	//파일삭제
	private void deleteFile(String filename, HttpServletRequest request) throws Exception{
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delPath = root + "\\nuploadFiles";
		String delFilepath = delPath + "\\" + filename;
		File delFile = new File(delFilepath);
		if(delFile.exists()) {
			delFile.delete();
		}
	}
}
