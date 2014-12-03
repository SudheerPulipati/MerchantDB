package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.IProfitLossDAO;
import com.dkl.merchantdb.dao.mapper.ProfitLossMapper;
import com.dkl.merchantdb.to.ProfitLossTO;

@Component
public class ProfitLossDAO implements IProfitLossDAO {

	private static final String PROFIT_LOSS_RECORDS_QUERY = "SELECT A.LEDGER_NAME,A.DEPOSITTYPE,A.AMOUNT FROM LEDGER A,FIN_BOOK B WHERE A.BOOKID = B.FIB_ID and A.BOOKID = ? and date(A.MODIFIED_DATE) BETWEEN ? AND ?";

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<ProfitLossTO> readAllProfitLossRecords(String bookId, String startDate, String endDate) {
		return jdbcTemplate.query(PROFIT_LOSS_RECORDS_QUERY, new ProfitLossMapper(), bookId, startDate, endDate);
	}

}
