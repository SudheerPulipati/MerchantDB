package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.NarrationTO;

public class NarrationMapper implements RowMapper<NarrationTO> {

	@Override
	public NarrationTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		NarrationTO narrationTO = new NarrationTO();
		narrationTO.setNarrationID(rs.getString("NARRATION_ID"));
		narrationTO.setCompanyID(rs.getLong("COMPANY_ID"));
		narrationTO.setNarration(rs.getString("NARRATION_DETAIL"));
		return narrationTO;
	}

	

}
