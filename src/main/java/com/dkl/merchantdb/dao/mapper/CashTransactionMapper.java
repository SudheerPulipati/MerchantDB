package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.CashTransactionTO;

class CashTransactionMapper implements RowMapper<CashTransactionTO>{
	
	@Override
	public CashTransactionTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		CashTransactionTO cashTransactionTO = new CashTransactionTO();
		 
		return cashTransactionTO;
	}

}
