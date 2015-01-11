package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.ITrailBalanceReportDAO;
import com.dkl.merchantdb.dao.mapper.TrailBalanceReportMapper;
import com.dkl.merchantdb.to.TrailBalanceTO;

@Component
public class TrailBalanceReportDAO implements ITrailBalanceReportDAO {

	private static final String TRAIL_BAL_RECORDS_QUERY = "SELECT A.LEDGER_NAME"
															  + ",A.LEDGER_CR_DR"
															  + ",A.LEDGER_AMOUNT "
															  + "FROM dklf.LEDGER A,dklf.FIN_BOOK B "
															  + "WHERE A.FIB_ID = B.FIB_ID and A.FIB_ID = ? and A.MODIFIED_DATE BETWEEN ? AND ?";

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<TrailBalanceTO> readAllTrailBalanceEntries(String bookId, String startDate, String endDate) {
		return jdbcTemplate.query(TRAIL_BAL_RECORDS_QUERY, new TrailBalanceReportMapper(), bookId, startDate, endDate);
	}

}
