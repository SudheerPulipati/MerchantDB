package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.ItemLedgerTO;

public class ItemLedgerMapper implements RowMapper<ItemLedgerTO> {

	@Override
	public ItemLedgerTO mapRow(ResultSet rs, int row) throws SQLException {
		ItemLedgerTO itemLedgerTO = new ItemLedgerTO();
		itemLedgerTO.setCompanyID(rs.getString("COMPANY_ID"));
		itemLedgerTO.setItemID(rs.getString("ITEM_ID"));
		itemLedgerTO.setItemLedgerID(rs.getString("ITEM_LEDGER_ID"));
		itemLedgerTO.setItemLedgerName(rs.getString("ITEM_LEDGER_NAME"));
		itemLedgerTO.setItemName(rs.getString("ITEM_NAME"));
		itemLedgerTO.setLedgerGroupName(rs.getString("ITEM_GROUP_NAME"));
		return itemLedgerTO;
	}

}
