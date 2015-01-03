package com.dkl.merchantdb.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.ItemTransactionDAO;
import com.dkl.merchantdb.to.ItemTransactionTO;

@Repository
public class ItemTransactionDAOImpl implements ItemTransactionDAO{
	
	private static final String INSERT_ITEM_TRANSACTION_QUERY = "INSERT INTO `dklf`.`item_transaction`(`FIB_ID`,`ITEM_TRANSACTION_ID`,"
			+ "`ITEM_TRANS_SEQ_NO`,`ITEM_ID`,`ITEM_NAME`,`ITEM_BATCH_ID`,`ITEM_BATCH_NAME`,`ITEM_QTY`,`ITEM_WEIGHT`,`ITEM_WEIGHT_DIFF`,"
			+ "`ITEM_PRICE_PER`,`ITEM_PRICE_1`,`ITEM_PRICE_2`,`ITEM_AMOUNT_1`,`ITEM_AMOUNT_2`,`ITEM_TOTAL_AMOUNT`,`FIRM_ID`,`FIRM_NAME`,`ITEM_TRANS_CRT_DATE`,`ITEM_TRANS_MOD_DATE`)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),now())";

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int createNewItemTransactionRecord(ItemTransactionTO itemTransactionTO){
		return jdbcTemplate.update(INSERT_ITEM_TRANSACTION_QUERY, new Object[]{	itemTransactionTO.getBookID(),
																				itemTransactionTO.getTransactionID(),
																				itemTransactionTO.getTransactionSeqNr(),
																				itemTransactionTO.getItemID(),
																				itemTransactionTO.getItemName(),
																				itemTransactionTO.getItemBatchID(),
																				itemTransactionTO.getItemBatchName(),
																				itemTransactionTO.getQuantity(),
																				itemTransactionTO.getWeight(),
																				itemTransactionTO.getWeightDifference(),
																				itemTransactionTO.getPricePer(),
																				itemTransactionTO.getPrice1(),
																				itemTransactionTO.getPrice2(),
																				itemTransactionTO.getAmount1(),
																				itemTransactionTO.getAmount2(),
																				itemTransactionTO.getTotalAmount(),
																				itemTransactionTO.getFirmID(),
																				itemTransactionTO.getFirmName()});
	}

}

