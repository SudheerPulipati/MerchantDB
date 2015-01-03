package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.FirmTO;

public class FirmMapper implements RowMapper<FirmTO> {

	@Override
	public FirmTO mapRow(ResultSet rs, int row) throws SQLException {
		FirmTO firmTO = new FirmTO();
		firmTO.setFirmID(rs.getString("FIRM_ID"));
		firmTO.setFirmName(rs.getString("FIRM_NAME"));
		firmTO.setCompanyID(rs.getString("COMPANY_ID"));
		firmTO.setCreationDate(rs.getString("created_date"));
		firmTO.setModifiedDate(rs.getString("modified_date"));
		return firmTO;
	}

	
}
