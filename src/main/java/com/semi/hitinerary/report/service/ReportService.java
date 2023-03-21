package com.semi.hitinerary.report.service;

import java.util.List;

import com.semi.hitinerary.report.domain.Report;
import com.semi.hitinerary.report.domain.boardReport;

public interface ReportService {

	/**
	 * 신고 접수 Service
	 * @param report
	 * @return
	 */
	int insertReport(Report report);

	/**
	 * 신고 게시글 목록 조회 Service
	 * @return
	 */
	public List<boardReport> selectboardReportList();
}
