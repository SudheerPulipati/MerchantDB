package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.ProfitLossTO;

public class ProfitLossMapper implements RowMapper<ProfitLossTO> {

	@Override
	public ProfitLossTO mapRow(ResultSet resultSet, int rows) throws SQLException {
		ProfitLossTO profitLossTO = new ProfitLossTO();
		profitLossTO.setTo("xyz");
		profitLossTO.setBy("PQR");
		profitLossTO.setAmount1(0.0);
		profitLossTO.setAmount2(0.0);
		return profitLossTO;
	}

}
