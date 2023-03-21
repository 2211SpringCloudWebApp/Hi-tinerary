package com.semi.hitinerary.report.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.hitinerary.report.domain.Report;
import com.semi.hitinerary.report.domain.boardReport;
import com.semi.hitinerary.report.service.ReportService;
import com.semi.hitinerary.report.store.ReportStore;

@Service
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	private ReportStore rStore;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertReport(Report report) {
		return rStore.insertReport(session, report);
	}

	@Override
	public List<boardReport> selectboardReportList() {
		return rStore.selectboardReportList(session);
	}
}
