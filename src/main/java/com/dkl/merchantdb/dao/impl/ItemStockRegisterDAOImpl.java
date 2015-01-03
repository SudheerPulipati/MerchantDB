package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.ItemStockRegisterDAO;
import com.dkl.merchantdb.dao.mapper.ItemStockRegisterMapper;
import com.dkl.merchantdb.to.ItemStockRegisterTO;

@Repository
public class ItemStockRegisterDAOImpl implements ItemStockRegisterDAO{
	
	private static final String GET_ALL_ITEM_BATCH = "select isr.item_batch_id,item_batch_name from dklf.item_stock_register isr where isr.item_id=? and isr.item_stock_point_id=?";
	
	private static final String GET_STOCK_ON_HAND_AND_PURCHASE_QTY = "select *  from dklf.item_stock_register it_s where it_s.item_id=? and it_s.ITEM_NAME=? and it_s.ITEM_STOCK_POINT_ID=? and it_s.FIB_ID=?";

	private static final String INSERT_INTO_STOCK_REGISTER = "INSERT INTO `dklf`.`item_stock_register`(`ITEM_STOCK_POINT_ID`,"
			+ "`FIB_ID`,`ITEM_ID`,`ITEM_NAME`,`ITEM_BATCH_ID`,`ITEM_BATCH_NAME`,`STOCK_OPEN_QTY`,`STOCK_PURCHASE_QTY`,"
			+ "`STOCK_SALE_QTY`,`STOCK_TRANSFER_IN`,`STOCK_TRANSFER_OUT`,`STOCK_ON_HAND`,`STOCK_CRT_DATE`,`STOCK_MOD_DATE`) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,now(),now())";
	
	private static final String UPDATE_STOCK_REGISTER = "UPDATE `dklf`.`item_stock_register` SET `STOCK_PURCHASE_QTY` = ?,"
			+ "`STOCK_ON_HAND` = ?,`STOCK_MOD_DATE` = sysdate() WHERE `ITEM_STOCK_POINT_ID` = ?";	
	
	@Autowired
	private JdbcTemplate jdbcTemplate;


	@Override
	public List<ItemStockRegisterTO> getAllItemBatch(String itemId,String stockPointId) {
		return jdbcTemplate.query(GET_ALL_ITEM_BATCH,new Object[]{itemId,stockPointId}, new ItemStockRegisterMapper());
	}

	@Override
	public ItemStockRegisterTO getItemStockRegisterRecord(String itemId,String itemName,String stockPointId,String finBookId){
		return jdbcTemplate.queryForObject(GET_STOCK_ON_HAND_AND_PURCHASE_QTY,new Object[]{itemId,itemName,stockPointId,finBookId},new ItemStockRegisterMapper());
	}
	
	@Override
	public int createOrUpdateItemStockRegisterRecord(ItemStockRegisterTO itemStockRegisterTO,String newBatchInd){
		int result =0;
		if("Y".equalsIgnoreCase(newBatchInd)){
			System.out.println(result+"====================");
			result = jdbcTemplate.update(INSERT_INTO_STOCK_REGISTER,new Object[]{
											itemStockRegisterTO.getStockPointID(),
											itemStockRegisterTO.getBookID(),
											itemStockRegisterTO.getItemID(),
											itemStockRegisterTO.getItemName(),
											itemStockRegisterTO.getItemBatchID(),
											itemStockRegisterTO.getItemBatchName(),
											itemStockRegisterTO.getOpenQuantity(),
											itemStockRegisterTO.getPurchaseQuantity(),
											itemStockRegisterTO.getSaleQuantity(),
											itemStockRegisterTO.getTransferIn(),
											itemStockRegisterTO.getTransferOut(),
											itemStockRegisterTO.getStockOnHand()});
		}else{
			System.out.println(itemStockRegisterTO.getStockPointID()+"===="+itemStockRegisterTO.getStockOnHand()+"===================="+itemStockRegisterTO.getPurchaseQuantity());
			result = jdbcTemplate.update(UPDATE_STOCK_REGISTER,new Object[]{
											itemStockRegisterTO.getPurchaseQuantity(),
											itemStockRegisterTO.getStockOnHand(),
											itemStockRegisterTO.getStockPointID()});
		}
		System.out.println(result+"====================");
		return result;
	}
	
}
