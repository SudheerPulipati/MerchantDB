package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.ItemUnitTO;

public interface IItemUnitDAO {
	
	int createItemUnit(ItemUnitTO itemUnitTO);

	List<ItemUnitTO> readAllByFk(Long companyId);
	
	int updateItemUnit(ItemUnitTO itemUnitTO);

	int deleteItemUnit(String itemUnitId);

	Long getWeight(String unitName, Long companyId);
}
