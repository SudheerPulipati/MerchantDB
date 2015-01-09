package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.IBalanceSheetDAO;
import com.dkl.merchantdb.dao.mapper.BalanceSheetMapper;
import com.dkl.merchantdb.to.BalanceSheetTO;

@Component
public class BalanceSheetDAO implements IBalanceSheetDAO {

	private static final String BAL_SHEET_RECORDS_QUERY = "SELECT A.LEDGER_NAME,A.LEDGER_CR_DR,A.LEDGER_AMOUNT FROM LEDGER A,FIN_BOOK B WHERE A.FIB_ID = B.FIB_ID and A.FIB_ID = ? and date(A.MODIFIED_DATE) BETWEEN ? AND ?";

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<BalanceSheetTO> readAllBalanceSheetEntries(String bookId, String startDate, String endDate) {
		return jdbcTemplate.query(BAL_SHEET_RECORDS_QUERY, new BalanceSheetMapper(), bookId, startDate, endDate);
	}

}
