package com.semi.hitinerary.report.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.semi.hitinerary.report.domain.Report;
import com.semi.hitinerary.report.domain.boardReport;

public interface ReportStore {

	/**
	 * 신고접수 Store
	 * @param session
	 * @param report
	 * @return int
	 */
	int insertReport(SqlSession session, Report report);

	/**
	 * 신고 게시글 목록 조회 Store
	 * @param session
	 * @return List<boardReport>
	 */
	public List<boardReport> selectboardReportList(SqlSession session);

	/**
	 * 신고 댓글 목록 조회 Store
	 * @param session
	 * @return List<boardReport>
	 */
	List<boardReport> selectcommentReportList(SqlSession session);
}
