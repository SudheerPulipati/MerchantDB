package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.IItemUnitDAO;
import com.dkl.merchantdb.dao.mapper.ItemUnitMapper;
import com.dkl.merchantdb.to.ItemUnitTO;

@Component
public class ItemUnitDAO implements IItemUnitDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static final String CREATE_ITEM_UNIT = "insert into unit values(?,?,?,?,NOW(),NOW())";

	private static final String VIEW_ITEMS = "select * from unit where company_id = ?";
	
	private static final String UPDATE_ITEM_UNIT = "UPDATE UNIT SET UNIT_NAME=?,UNIT_NO_OF_KGS=? WHERE UNIT_ID=?";
	@Override
	public int createItemUnit(ItemUnitTO itemUnitTO) {
		return jdbcTemplate.update(CREATE_ITEM_UNIT, itemUnitTO.getUnitId(), itemUnitTO.getCompanyId(),
				itemUnitTO.getUnitName(), itemUnitTO.getWeight());
	}

	@Override
	public List<ItemUnitTO> readAllByFk(Long companyId) {
		return jdbcTemplate.query(VIEW_ITEMS, new ItemUnitMapper(),companyId);
	}

	@Override
	public int updateItemUnit(ItemUnitTO itemUnitTO) {
		return 0;
		//return jdbcTemplate.update(psc);
	}

}
