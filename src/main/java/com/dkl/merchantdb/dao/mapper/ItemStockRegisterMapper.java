package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.ItemStockRegisterTO;

public class ItemStockRegisterMapper implements RowMapper<ItemStockRegisterTO> {

	@Override
	public ItemStockRegisterTO mapRow(ResultSet rs, int row) throws SQLException {
		ItemStockRegisterTO itemStockRegisterTO = new ItemStockRegisterTO();
		itemStockRegisterTO.setItemBatchID(rs.getString("ITEM_BATCH_ID"));
		itemStockRegisterTO.setItemBatchName(rs.getString("ITEM_BATCH_NAME"));
/*		itemStockRegisterTO.setBookID(rs.getString("FIB_ID"));
		itemStockRegisterTO.setItemID(rs.getString("ITEM_ID"));
		itemStockRegisterTO.setItemName(rs.getString("ITEM_NAME"));
		/*itemStockRegisterTO.setOpenQuantity(Double.parseDouble(rs.getString("STOCK_OPEN_QTY")));
		itemStockRegisterTO.setPurchaseQuantity(Double.parseDouble(rs.getString("STOCK_PURCHASE_QTY")));
		itemStockRegisterTO.setSaleQuantity(Double.parseDouble(rs.getString("STOCK_SALE_QTY")));
		itemStockRegisterTO.setStockOnHand(Double.parseDouble(rs.getString("STOCK_ON_HAND")));
		itemStockRegisterTO.setStockPointID(rs.getString("ITEM_STOCK_POINT_ID"));
		itemStockRegisterTO.setTransferIn(Double.parseDouble(rs.getString("STOCK_TRANSFER_IN")));
		itemStockRegisterTO.setTransferOut(Double.parseDouble(rs.getString("STOCK_TRANSFER_OUT")));*/
		return itemStockRegisterTO;
	}

	

}
