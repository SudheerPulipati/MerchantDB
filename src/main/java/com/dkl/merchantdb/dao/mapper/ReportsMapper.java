package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang3.StringUtils;
import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.CashBookTO;

public class ReportsMapper implements RowMapper<CashBookTO> {

	@Override
	public CashBookTO mapRow(ResultSet resultSet, int row) throws SQLException {
		CashBookTO cashBookTO = new CashBookTO();
		cashBookTO.setPartyName(resultSet.getString("firm_name"));
		cashBookTO.setModifiedDate(resultSet.getTimestamp("modified_date"));
		cashBookTO.setRemarks("narration");
		cashBookTO.setAction("Need to set");
		if (StringUtils.equalsIgnoreCase(resultSet.getString("ledger_cr_dr"), "cr")) {
			cashBookTO.setCredit(resultSet.getDouble("ledger_amount"));
			cashBookTO.setDebit(0d);
		} else {
			cashBookTO.setDebit(resultSet.getDouble("ledger_amount"));
			cashBookTO.setCredit(0d);
		}

		return cashBookTO;
	}

}
