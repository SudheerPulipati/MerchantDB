package com.dkl.merchantdb.dao.intf;

import com.dkl.merchantdb.to.ItemLedgerTO;

public interface ItemLedgerDAO {
	
	public ItemLedgerTO getLedgerDetails(String companyId, String itemId,String ItemLedgerGroupName);
}
