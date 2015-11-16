package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.ItemLedgerTO;

public interface ItemLedgerDAO {
	
	ItemLedgerTO getLedgerDetails(String companyId, String itemId,String ItemLedgerGroupName);

	int createItemLedgerRecord(ItemLedgerTO itemLedgerTO);

	int deleteItemLedgerRecord(String itemId);

	List<ItemLedgerTO> readByFK(Long companyID);
}
