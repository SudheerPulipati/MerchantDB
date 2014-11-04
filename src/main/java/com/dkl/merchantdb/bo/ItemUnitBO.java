package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.impl.SequenseGenDAO;
import com.dkl.merchantdb.dao.intf.IItemUnitDAO;
import com.dkl.merchantdb.to.ItemUnitTO;

@Component
public class ItemUnitBO {

	@Autowired
	private IItemUnitDAO itemUnitDAO;
	
	@Autowired
	private SequenseGenDAO sequenseGenDAO;

	public int createItemUnit(ItemUnitTO itemUnitTO) {
		itemUnitTO.setUnitId(sequenseGenDAO.getSequenceID("UNIT_ID", "UNIT"));
		return itemUnitDAO.createItemUnit(itemUnitTO);
	}

	public List<ItemUnitTO> readAllByFK(Long companyId) {
		return itemUnitDAO.readAllByFk(companyId);
	}

	public int update(ItemUnitTO itemUnitTO) {
		return itemUnitDAO.updateItemUnit(itemUnitTO);
	}

	public int delete(String itemUnitId) {
		return itemUnitDAO.deleteItemUnit(itemUnitId);
	}

	public Double getWeight(String unitName, Long companyId) {
		return itemUnitDAO.getWeight(unitName,companyId);
	}
	
	
}
