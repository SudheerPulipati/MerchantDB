package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.FirmDAO;
import com.dkl.merchantdb.dao.intf.IPartyDAO;
import com.dkl.merchantdb.dao.intf.ItemMasterDAO;
import com.dkl.merchantdb.dao.intf.SaleOrderDAO;
import com.dkl.merchantdb.dao.intf.StockPointDAO;
import com.dkl.merchantdb.to.ItemStockRegisterTO;
import com.dkl.merchantdb.to.SaleOrderRequestTO;

@Repository
public class SaleOrderDAOImpl implements SaleOrderDAO{
	
	private static final String NEXT_HIGHEST_TRANS_SEQ_NO = "select count(distinct itm_trans.ITEM_TRANSACTION_ID)+1 as seq_no from dklf.item_transaction itm_trans,dklf.transaction trans where trans.TRANSACTION_TYPE=? and trans.FIB_ID=? and trans.TRANSACTION_ID = itm_trans.ITEM_TRANSACTION_ID";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private FirmDAO firmDAO;
	
	@Autowired
	private IPartyDAO partyDAO;
	
	@Autowired
	private StockPointDAO stockPointDAO;
	
	@Autowired
	private ItemMasterDAO itemMasterDAO;

	@Override
	public SaleOrderRequestTO prepareRequestDataForSalesOrder(Long companyId) {
		
		System.out.println("====prepareRequestDataForSalesOrder========"+companyId);
		SaleOrderRequestTO orderRequestTO = new SaleOrderRequestTO();
		System.out.println("====firmDAO.readAllFirms()========"+firmDAO.readAllFirms());
		orderRequestTO.setFirmList(firmDAO.readAllFirms());
		System.out.println("====partyDAO.readAllParty========"+partyDAO.readAllParty(companyId));
		orderRequestTO.setPartyList(partyDAO.readAllParty(companyId));
		System.out.println("====stockPointDAO.getAllStockPointDetails()========"+stockPointDAO.getAllStockPointDetails());
		orderRequestTO.setStockPointList(stockPointDAO.getAllStockPointDetails());
		orderRequestTO.setItemMasterList(itemMasterDAO.getAllItems());
		System.out.println("====prepareRequestDataForSalesOrder========"+orderRequestTO.getStockPointList().get(0).getStockID());
		
		return orderRequestTO;
	}

	@Override
	public Long getNextHighestTransactionSeqNo(String transType,String finBookId){
			return jdbcTemplate.queryForObject(NEXT_HIGHEST_TRANS_SEQ_NO, new Object[]{transType,finBookId},Long.class);
	}

}
