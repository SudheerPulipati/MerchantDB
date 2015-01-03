package com.dkl.merchantdb.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.FirmDAO;
import com.dkl.merchantdb.dao.intf.ItemMasterDAO;
import com.dkl.merchantdb.dao.intf.ItemStockRegisterDAO;
import com.dkl.merchantdb.dao.intf.IPartyDAO;
import com.dkl.merchantdb.dao.intf.PurchaseOrderDAO;
import com.dkl.merchantdb.dao.intf.StockPointDAO;
import com.dkl.merchantdb.to.PurchaseOrderRequestTO;

@Repository
public class PurchaseOrderDAOImpl implements PurchaseOrderDAO{
	
	private static final String NEXT_HIGHEST_TRANS_SEQ_NO = "select count(distinct itm_trans.ITEM_TRANSACTION_ID)+1 as seq_no from dklf.item_transaction itm_trans,dklf.transaction trans where trans.TRANSACTION_TYPE=? and trans.FIB_ID=? and trans.TRANSACTION_ID = itm_trans.ITEM_TRANSACTION_ID";
	
	private static final String NEXT_HIGHEST_ITEM_BATCH_ID_FROM_STOCK_REGISTER = "select ifnull(max(itm_trans.ITEM_TRANS_SEQ_NO),0)+1 as seq_no from dklf.item_transaction itm_trans,dklf.transaction trans where trans.TRANSACTION_TYPE=? and trans.FIB_ID=? and trans.TRANSACTION_ID = itm_trans.ITEM_TRANSACTION_ID";
			
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private FirmDAO firmDAO;
	
	@Autowired
	private IPartyDAO partyDAO;
	
	@Autowired
	private StockPointDAO stockPointDAO;
	
	@Autowired
	private ItemStockRegisterDAO itemStockRegisterDAO;
	
	@Autowired
	private ItemMasterDAO itemMasterDAO;
	
	
	@Override
	public PurchaseOrderRequestTO prepareDataForPurchaseOrder(Long CompanyId){
		PurchaseOrderRequestTO orderRequestTO = new PurchaseOrderRequestTO();
		//TODO
		orderRequestTO.setPartyList(partyDAO.readAllParty(CompanyId));
		orderRequestTO.setFirmList(firmDAO.readAllFirms());
		orderRequestTO.setStockPointList(stockPointDAO.getAllStockPointDetails());
		orderRequestTO.setItemMasterList(itemMasterDAO.getAllItems());
		return orderRequestTO;
	}
	
	
	
	public Long getNextHighestTransactionSeqNo(String transType,String finBookId){
		return jdbcTemplate.queryForObject(NEXT_HIGHEST_TRANS_SEQ_NO, new Object[]{transType,finBookId},Long.class);
	}
	
}
