package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.FinancialBookTO;

public class FinancialBookMapper implements RowMapper<FinancialBookTO> {

	@Override
	public FinancialBookTO mapRow(ResultSet resultSet, int row) throws SQLException {
		FinancialBookTO financialBookTO = new FinancialBookTO();
		financialBookTO.setCompanyId(resultSet.getLong("company_id"));
		financialBookTO.setFinBookId(resultSet.getString("fib_id"));
		financialBookTO.setFinancialYear(resultSet.getString("fib_financial_yr"));
		financialBookTO.setCreationDate(resultSet.getTimestamp("fib_creation_date"));
		financialBookTO.setModifiedDate(resultSet.getTimestamp("fib_mod_date"));
		return financialBookTO;
	}

}
