package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.ItemUnitTO;

public class ItemUnitMapper implements RowMapper<ItemUnitTO> {

	@Override
	public ItemUnitTO mapRow(ResultSet resultSet, int rowNum) throws SQLException {
		ItemUnitTO itemUnitTO = new ItemUnitTO();
		itemUnitTO.setUnitId(resultSet.getString("unit_id"));
		itemUnitTO.setCompanyId(resultSet.getLong("company_id"));
		itemUnitTO.setUnitName(resultSet.getString("unit_name"));
		itemUnitTO.setWeight(resultSet.getDouble("unit_no_of_kg"));
		return itemUnitTO;
	}

}
