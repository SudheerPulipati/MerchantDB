package com.dkl.merchantdb.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.ItemLedgerDAO;
import com.dkl.merchantdb.dao.mapper.ItemLedgerMapper;
import com.dkl.merchantdb.to.ItemLedgerTO;

@Repository
public class ItemLedgerDAOImpl implements ItemLedgerDAO{
	
	private static final String GET_LEDGER_DETAILS = "select * from dklf.item_ledger it_ldg where it_ldg.COMPANY_ID=? and it_ldg.ITEM_ID=? and it_ldg.ITEM_GROUP_NAME=?";

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public ItemLedgerTO getLedgerDetails(String companyId,String itemId,String ItemLedgerGroupName) {
		System.out.println(companyId+"====22===="+itemId+"====22===="+ItemLedgerGroupName);
		return jdbcTemplate.queryForObject(GET_LEDGER_DETAILS, new Object[]{companyId,itemId,ItemLedgerGroupName},new ItemLedgerMapper());
	}

	
}
