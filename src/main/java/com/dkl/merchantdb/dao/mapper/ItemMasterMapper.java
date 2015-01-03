package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.ItemMasterTO;

public class ItemMasterMapper implements RowMapper<ItemMasterTO> {

	@Override
	public ItemMasterTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ItemMasterTO itemMasterTO = new ItemMasterTO();
		itemMasterTO.setCompanyID(rs.getString("COMPANY_ID"));
		itemMasterTO.setItemID(rs.getString("ITEM_ID"));
		itemMasterTO.setItemName(rs.getString("ITEM_NAME"));
		itemMasterTO.setItemType(rs.getString("ITEM_NAME"));
		itemMasterTO.setUnitID(rs.getString("ITEM_UNIT_ID"));
		itemMasterTO.setUnitName(rs.getString("ITEM_UNIT_NAME"));
		itemMasterTO.setNoOfKgs(rs.getString("ITEM_NO_OF_KGS"));
		itemMasterTO.setVat(rs.getString("ITEM_VAT"));
		itemMasterTO.setSalesTaxExemption(rs.getString("ITEM_SALES_TAX_EX"));
		itemMasterTO.setTownCoolie(rs.getString("ITEM_TOWN_COOLIE"));
		itemMasterTO.setOutOfTown_Coollie(rs.getString("ITEM_OOT_COOLIE"));
		itemMasterTO.setEetaCoolie(rs.getString("ITEM_EETA_COOLIE"));
		itemMasterTO.setUnloadingCoolie(rs.getString("ITEM_UNLOAD_COOLIE"));
		itemMasterTO.setPricePer(rs.getString("ITEM_PRICE_PER"));
		itemMasterTO.setCreationDate(rs.getString("created_date"));
		itemMasterTO.setModifiedDate(rs.getString("modified_date"));
		return itemMasterTO;
	}

	

}
