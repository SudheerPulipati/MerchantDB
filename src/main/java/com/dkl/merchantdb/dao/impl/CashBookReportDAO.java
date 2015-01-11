package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.ICashBookReportDAO;
import com.dkl.merchantdb.dao.mapper.ReportsMapper;
import com.dkl.merchantdb.to.CashBookTO;

@Repository
public class CashBookReportDAO implements ICashBookReportDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	/*private static final String READ_ALL_CASHBOOK_ENTRIES = "SELECT A.FIRM_NAME,"
																 + "A.MODIFIED_DATE"
																 + ",A.ledger_cr_dr"
																 + ",A.ledger_AMOUNT "
																 + "FROM LEDGER A,FIN_BOOK B WHERE "
																 + "A.FIB_ID = B.FIB_ID and A.FIB_ID = ? "
																 + "and date(A.MODIFIED_DATE) BETWEEN ? AND ?";*/
	private static final String READ_ALL_CASHBOOK_ENTRIES = "SELECT FIRM_NAME,"
																 + "MODIFIED_DATE"
																 + ",ledger_cr_dr"
																 + ",ledger_AMOUNT "
																 + "FROM LEDGER WHERE "
																 + "FIB_ID = ? "
																 + "and MODIFIED_DATE BETWEEN ? AND ? ";

	@Override
	public List<CashBookTO> readAllCashBookEntries(String finBookId,String startDate,String endDate) {
		System.out.println(READ_ALL_CASHBOOK_ENTRIES+" : "+startDate);
		System.out.println("Result::"+jdbcTemplate.query(READ_ALL_CASHBOOK_ENTRIES, new ReportsMapper(),"FY2013-14",startDate,endDate));
		return jdbcTemplate.query(READ_ALL_CASHBOOK_ENTRIES, new ReportsMapper(),finBookId,startDate,endDate);
	}

}
