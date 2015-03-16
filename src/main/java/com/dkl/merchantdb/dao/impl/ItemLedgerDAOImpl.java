package com.dkl.merchantdb.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.ItemLedgerDAO;
import com.dkl.merchantdb.dao.mapper.ItemLedgerMapper;
import com.dkl.merchantdb.to.ItemLedgerTO;

@Repository
public class ItemLedgerDAOImpl implements ItemLedgerDAO {

	private static final String GET_LEDGER_DETAILS = "select * from dklf.item_ledger it_ldg where it_ldg.COMPANY_ID=? and it_ldg.ITEM_ID=? and it_ldg.ITEM_GROUP_NAME=?";

	private static final String CREATE_ITEM_LEDGER_RECORD = "insert into item_ledger values(?,?,?,?,?,?,NOW(),NOW())";

	private static final String DELETE_ITEM_LEDGER_RECORD = "DELETE FROM ITEM_LEDGER WHERE ITEM_LEDGER_ID LIKE ?";

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public ItemLedgerTO getLedgerDetails(String companyId, String itemId, String ItemLedgerGroupName) {
		System.out.println(companyId + "====22====" + itemId + "====22====" + ItemLedgerGroupName);
		return jdbcTemplate.queryForObject(GET_LEDGER_DETAILS, new Object[] { companyId, itemId, ItemLedgerGroupName },
				new ItemLedgerMapper());
	}

	@Override
	public int createItemLedgerRecord(ItemLedgerTO itemLedgerTO) {
		return jdbcTemplate.update(CREATE_ITEM_LEDGER_RECORD, itemLedgerTO.getItemLedgerID(), itemLedgerTO.getCompanyID(),
				itemLedgerTO.getItemID(), itemLedgerTO.getItemName(), itemLedgerTO.getItemLedgerName(),
				itemLedgerTO.getLedgerGroupName());
	}

	@Override
	public int deleteItemLedgerRecord(String itemId) {
		return jdbcTemplate.update(DELETE_ITEM_LEDGER_RECORD,itemId+"%");
	}

}
