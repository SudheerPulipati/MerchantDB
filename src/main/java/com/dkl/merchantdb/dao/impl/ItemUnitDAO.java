package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.IItemUnitDAO;
import com.dkl.merchantdb.dao.mapper.ItemUnitMapper;
import com.dkl.merchantdb.to.ItemUnitTO;

@Repository
public class ItemUnitDAO implements IItemUnitDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String CREATE_ITEM_UNIT = "insert into unit values(?,?,?,?,NOW(),NOW())";

	private static final String VIEW_ITEMS = "select * from unit where company_id = ?";

	private static final String UPDATE_ITEM_UNIT = "UPDATE UNIT SET UNIT_NAME=?,UNIT_NO_OF_KG=? WHERE UNIT_ID=?";
	
	private static final String DELETE_ITEM_UNIT = "DELETE FROM UNIT WHERE UNIT_ID=?";

	private static final String GET_WEIGHT = "SELECT UNIT_NO_OF_KG FROM UNIT WHERE UNIT_NAME=? AND COMPANY_ID=?";

	@Override
	public int createItemUnit(ItemUnitTO itemUnitTO) {
		return jdbcTemplate.update(CREATE_ITEM_UNIT, itemUnitTO.getUnitId(), itemUnitTO.getCompanyId(),
				itemUnitTO.getUnitName(), itemUnitTO.getWeight());
	}

	@Override
	public List<ItemUnitTO> readAllByFk(Long companyId) {
		return jdbcTemplate.query(VIEW_ITEMS, new ItemUnitMapper(), companyId);
	}

	@Override
	public int updateItemUnit(ItemUnitTO itemUnitTO) {
		return jdbcTemplate.update(UPDATE_ITEM_UNIT, itemUnitTO.getUnitName(), itemUnitTO.getWeight(),
				itemUnitTO.getUnitId());
	}

	@Override
	public int deleteItemUnit(String itemUnitId) {
		return jdbcTemplate.update(DELETE_ITEM_UNIT, itemUnitId);
	}

	@Override
	public Long getWeight(String unitName, Long companyId) {
		try{
			return jdbcTemplate.queryForObject(GET_WEIGHT, new Object[] {unitName,companyId},Long.class);
		}catch (EmptyResultDataAccessException e) {
			System.out.println("No Such Unit Available..."+unitName+"...for company id..."+companyId);
			return 0L;
		}
	}

}
