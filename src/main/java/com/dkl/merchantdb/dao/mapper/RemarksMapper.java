package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.RemarksTO;

public class RemarksMapper implements RowMapper<RemarksTO> {

	@Override
	public RemarksTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		RemarksTO remarksTO = new RemarksTO();
		remarksTO.setRemarksID(rs.getString("REMARKS_ID"));
		remarksTO.setCompanyID(rs.getLong("COMPANY_ID"));
		remarksTO.setRemarks(rs.getString("REMARK"));
		return remarksTO;
	}

}
