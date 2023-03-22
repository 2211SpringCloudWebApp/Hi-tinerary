package com.semi.hitinerary.report.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.semi.hitinerary.report.domain.Report;
import com.semi.hitinerary.report.domain.boardReport;
import com.semi.hitinerary.report.store.ReportStore;

@Repository
public class ReportStoreLogic implements ReportStore{

	@Override
	public int insertReport(SqlSession session, Report report) {
		return session.insert("reportMapper.insertReport", report);
	}
	
	@Override
	public List<boardReport> selectboardReportList(SqlSession session) {
		return session.selectList("reportMapper.selectboardReportList");
	}

	@Override
	public List<boardReport> selectcommentReportList(SqlSession session) {
		return session.selectList("reportMapper.selectcommentReportList");
	}
	
}
