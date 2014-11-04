package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.IItemDAO;
import com.dkl.merchantdb.dao.mapper.ItemMapper;
import com.dkl.merchantdb.to.ItemTO;

@Component
public class ItemDAO implements IItemDAO {

	/*
	 * ITEM_ID ITEM_GROUP_ID ITEM_NAME ITEM_UNIT_NAME ITEM_SALES_TAX_EX
	 * ITEM_TOWN_COOLIE ITEM_OOT_COOLIE ITEM_EETA_COOLIE ITEM_UNLOAD_COOLIE
	 * ITEM_PRICE_PER ITEM_CRT_DATE ITEM_MOD_DATE
	 */
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String CREATE_ITEM = new StringBuilder(
			"INSERT INTO ITEM_MASTER(COMPANY_ID,ITEM_ID, ITEM_GROUP_ID, ITEM_NAME, ITEM_UNIT_NAME,WEIGHT, ITEM_SALES_TAX_EX,")
			.append("ITEM_TOWN_COOLIE, ITEM_OOT_COOLIE, ITEM_EETA_COOLIE, ITEM_UNLOAD_COOLIE, ITEM_PRICE_PER,")
			.append("ITEM_CRT_DATE, ITEM_MOD_DATE) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,NOW(),NOW())").toString();

	private static final String READ_ALL_BY_FK = "SELECT * FROM ITEM_MASTER WHERE COMPANY_ID=?";
	
	private static final String UPDATE_ITEM = "UPDATE ITEM_MASTER SET ITEM_GROUP_ID=?,ITEM_NAME=?,WEIGHT=? WHERE ITEM_ID=?";
	
	private static final String DELETE_ITEM = "DELETE FROM ITEM_MASTER WHERE ITEM_ID=?";

	@Override
	public int createItem(ItemTO itemTO) {
		return jdbcTemplate.update(CREATE_ITEM, itemTO.getCompanyId(), itemTO.getItemId(), itemTO.getItemGroupId(),
				itemTO.getItemName(), itemTO.getUnitName(), itemTO.getWeight(), itemTO.getSalesTaxExcemption(),
				itemTO.getTownCoolie(), itemTO.getOutOfTownCoolie(), itemTO.getEetaCoolie(),
				itemTO.getUnloadingCoolie(), itemTO.getPricePer());
	}

	@Override
	public List<ItemTO> readAllByFK(Long companyId) {
		System.out.println("DAO:" + companyId);
		return jdbcTemplate.query(READ_ALL_BY_FK, new ItemMapper(), companyId);
	}

	@Override
	public int updateItem(ItemTO itemTO) {
		return jdbcTemplate.update(UPDATE_ITEM, itemTO.getItemGroupId(),
				itemTO.getItemName(),  itemTO.getWeight(),itemTO.getItemId());
	}
	
	@Override
	public int deleteItem(Long itemId) {
		return jdbcTemplate.update(DELETE_ITEM, itemId);
	}
}
