package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.ItemTO;

public class ItemMapper implements RowMapper<ItemTO> {

	@Override
	public ItemTO mapRow(ResultSet resultSet, int rowNum) throws SQLException {

		ItemTO itemTO = new ItemTO();
		itemTO.setCompanyId(resultSet.getLong("COMPANY_ID"));
		itemTO.setItemId(resultSet.getString("ITEM_ID"));
		itemTO.setItemName(resultSet.getString("ITEM_NAME"));
		itemTO.setUnitId(resultSet.getString("item_unit_id"));
		itemTO.setUnitName(resultSet.getString("item_unit_name"));
		itemTO.setSalesTaxExcemption(resultSet.getString("ITEM_SALES_TAX_EX"));
		itemTO.setTownCoolie(resultSet.getString("ITEM_TOWN_COOLIE"));
		itemTO.setOutOfTownCoolie(resultSet.getDouble("ITEM_OOT_COOLIE"));
		itemTO.setUnloadingCoolie(resultSet.getDouble("ITEM_UNLOAD_COOLIE"));
		itemTO.setEetaCoolie(resultSet.getDouble("ITEM_EETA_COOLIE"));
		itemTO.setPricePer(resultSet.getString("ITEM_PRICE_PER"));
		itemTO.setItemNoOfKgs(resultSet.getDouble("ITEM_NO_OF_KGS"));
		return itemTO;
	}

}
