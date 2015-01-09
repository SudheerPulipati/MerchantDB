package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.ItemTO;

public interface IItemDAO {
	int createItem(ItemTO itemTO);
	List<ItemTO> readAllByFK(Long itemId);
	int updateItem(ItemTO itemTO);
	int deleteItem(String itemId);
	
}
