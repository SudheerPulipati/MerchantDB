package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.ItemMasterDAO;
import com.dkl.merchantdb.dao.mapper.ItemMasterMapper;
import com.dkl.merchantdb.to.ItemMasterTO;

@Repository
public class ItemMasterDAOImpl implements ItemMasterDAO{
	
	//private static final String READ_ALL_ITEM_AND_LEGER_DETAILS = "select * from dklf.item_master it_m,dklf.item_ledger it_l where it_m.ITEM_ID=it_l.ITEM_ID";
	private static final String READ_ALL_ITEM_AND_LEGER_DETAILS = "select * from dklf.item_master it_m";	
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	
	@Override
	public List<ItemMasterTO> getAllItems() {
		return jdbcTemplate.query(READ_ALL_ITEM_AND_LEGER_DETAILS, new ItemMasterMapper());
	}
	
}
