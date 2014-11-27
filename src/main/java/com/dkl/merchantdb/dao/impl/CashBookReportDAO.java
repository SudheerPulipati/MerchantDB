package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.ICashBookReportDAO;
import com.dkl.merchantdb.dao.mapper.ReportsMapper;
import com.dkl.merchantdb.to.CashBookTO;

@Component
public class CashBookReportDAO implements ICashBookReportDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String READ_ALL_CASHBOOK_ENTRIES = "SELECT A.FIRMNAME,A.MODIFIED_DATE,A.DEPOSITTYPE,A.AMOUNT,A.NARRATION FROM LEDGER A,FIN_BOOK B WHERE A.BOOKID = B.FIB_ID and A.BOOKID = ? and date(A.MODIFIED_DATE) BETWEEN ? AND ?";

	@Override
	public List<CashBookTO> readAllCashBookEntries(String finBookId,String startDate,String endDate) {
		return jdbcTemplate.query(READ_ALL_CASHBOOK_ENTRIES, new ReportsMapper(),finBookId,startDate,endDate);
	}

}
