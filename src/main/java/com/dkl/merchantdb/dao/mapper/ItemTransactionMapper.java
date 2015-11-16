package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.ItemTransactionTO;

public class ItemTransactionMapper implements RowMapper<ItemTransactionTO> {

	@Override
	public ItemTransactionTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ItemTransactionTO itemTransactionTO = new ItemTransactionTO();
		itemTransactionTO.setFirmID(rs.getString("FIB_ID"));
		itemTransactionTO.setTransactionID(rs.getString("ITEM_TRANSACTION_ID"));
		itemTransactionTO.setTransactionSeqNr(rs.getLong("ITEM_TRANS_SEQ_NO"));
		itemTransactionTO.setItemID(rs.getString("ITEM_ID"));
		itemTransactionTO.setItemName(rs.getString("ITEM_NAME"));
		itemTransactionTO.setItemBatchID(rs.getString("ITEM_BATCH_ID"));
		itemTransactionTO.setItemBatchName(rs.getString("ITEM_BATCH_NAME"));
		itemTransactionTO.setQuantity(rs.getDouble("ITEM_QTY"));
		
		return itemTransactionTO;
	}

}
