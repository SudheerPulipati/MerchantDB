package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.IItemDAO;
import com.dkl.merchantdb.dao.mapper.ItemMapper;
import com.dkl.merchantdb.to.ItemTO;

@Repository
public class ItemDAO implements IItemDAO {

	/*
	 * ITEM_ID ITEM_GROUP_ID ITEM_NAME ITEM_UNIT_NAME ITEM_SALES_TAX_EX
	 * ITEM_TOWN_COOLIE ITEM_OOT_COOLIE ITEM_EETA_COOLIE ITEM_UNLOAD_COOLIE
	 * ITEM_PRICE_PER ITEM_CRT_DATE ITEM_MOD_DATE
	 */
	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String CREATE_ITEM = new StringBuilder(
			"INSERT INTO ITEM_MASTER(COMPANY_ID,ITEM_ID,ITEM_NAME,ITEM_UNIT_ID, ITEM_UNIT_NAME,ITEM_NO_OF_KGS,ITEM_VAT, ITEM_SALES_TAX_EX,")
			.append("ITEM_TOWN_COOLIE, ITEM_OOT_COOLIE, ITEM_EETA_COOLIE, ITEM_UNLOAD_COOLIE, ITEM_PRICE_PER,")
			.append("CREATED_DATE, MODIFIED_DATE) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate(),sysdate())").toString();

	private static final String READ_ALL_BY_FK = "SELECT * FROM ITEM_MASTER WHERE COMPANY_ID=?";
	
	private static final String UPDATE_ITEM = "UPDATE ITEM_MASTER SET ITEM_UNIT_NAME=?,ITEM_NAME=?,ITEM_NO_OF_KGS=? WHERE ITEM_ID=?";
	
	private static final String DELETE_ITEM = "DELETE FROM ITEM_MASTER WHERE ITEM_ID=?";

	@Override
	public int createItem(ItemTO itemTO) {
		System.out.println(itemTO.getCompanyId()+"==="+itemTO.getItemId()+"==="+
				itemTO.getItemName()+"==="+itemTO.getUnitName()+"==="+itemTO.getSalesTaxExcemption()+"==="+
				itemTO.getTownCoolie()+"==="+itemTO.getOutOfTownCoolie()+"==="+itemTO.getEetaCoolie()+"==="+
				itemTO.getUnloadingCoolie()+"==="+itemTO.getPricePer());
		
		return jdbcTemplate.update(CREATE_ITEM, itemTO.getCompanyId(), itemTO.getItemId(), 
				itemTO.getItemName(),itemTO.getUnitId(), itemTO.getUnitName(),itemTO.getItemNoOfKgs(),itemTO.getVat(),
				itemTO.getSalesTaxExcemption(),	itemTO.getTownCoolie(), itemTO.getOutOfTownCoolie(), itemTO.getEetaCoolie(),
				itemTO.getUnloadingCoolie(), Double.parseDouble(itemTO.getPricePer()));
	}

	@Override
	public List<ItemTO> readAllByFK(Long companyId) {
		System.out.println("DAO:" + companyId);
		return jdbcTemplate.query(READ_ALL_BY_FK, new ItemMapper(), companyId);
	}

	@Override
	public int updateItem(ItemTO itemTO) {
		System.out.println("===========");
		System.out.println(itemTO.getItemName());
		System.out.println(itemTO.getItemNoOfKgs());
		System.out.println(itemTO.getItemId());
		return jdbcTemplate.update(UPDATE_ITEM, itemTO.getUnitName(),itemTO.getItemName(),itemTO.getItemNoOfKgs() ,itemTO.getItemId());
	}
	
	@Override
	public int deleteItem(String itemId) {
		return jdbcTemplate.update(DELETE_ITEM, itemId);
	}
}
