package com.dkl.merchantdb.dao.mapper;


import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.ItemMasterLedgerTO;
import com.dkl.merchantdb.to.ItemMasterTO;

public class ItemMasterLedgerMapper implements RowMapper<ItemMasterLedgerTO> {

	@Override
	public ItemMasterLedgerTO mapRow(ResultSet rs, int row)	throws SQLException {
		ItemMasterLedgerTO itemMasterLedgerTO = new ItemMasterLedgerTO();
		
		ItemMasterTO itemMasterTO = new ItemMasterTO();
		//ItemLedgerTO itemLedgerTO = new ItemLedgerTO();
		
		
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
		
		
		/*itemLedgerTO.setCompanyID(rs.getString("COMPANY_ID"));
		itemLedgerTO.setItemID(rs.getString("ITEM_ID"));
		itemLedgerTO.setItemName(rs.getString("ITEM_NAME"));
		itemLedgerTO.setLedgerGroupName(rs.getString("ITEM_GROUP_NAME"));
		itemLedgerTO.setItemLedgerID(rs.getString("ITEM_LEDGER_ID"));
		itemLedgerTO.setItemLedgerName(rs.getString("ITEM_LEDGER_NAME"));
		itemLedgerTO.setCreationDate(rs.getString("ITEM_LEDGER_CRT_DATE"));
		itemLedgerTO.setModifiedDate(rs.getString("ITEM_LEDGER_MOD_DATE"));*/
		
		
		//itemMasterLedgerTO.setItemLedgerTO(itemLedgerTO);
		itemMasterLedgerTO.setItemMasterTO(itemMasterTO);
		
		
		
		return itemMasterLedgerTO;
	}

	

}
