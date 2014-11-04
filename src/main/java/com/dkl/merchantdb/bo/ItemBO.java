package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.impl.SequenseGenDAO;
import com.dkl.merchantdb.dao.intf.IItemDAO;
import com.dkl.merchantdb.to.ItemTO;

@Component
public class ItemBO {

	@Autowired
	private IItemDAO itemDAO;

	@Autowired
	private SequenseGenDAO sequenseGenDAO;

	public int createItem(ItemTO itemTO) {
		itemTO.setItemId(sequenseGenDAO.getSequenceID("ITEM_ID", "ITEM_MASTER"));
		return itemDAO.createItem(itemTO);
	}

	public List<ItemTO> readAllByFk(Long companyId) {
		System.out.println("BO:" + companyId);
		return itemDAO.readAllByFK(companyId);
	}

	public int update(ItemTO itemTO) {
		return itemDAO.updateItem(itemTO);
	}

	public int delete(Long itemId) {
		return itemDAO.deleteItem(itemId);
	}
}
