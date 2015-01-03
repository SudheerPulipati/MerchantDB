package com.dkl.merchantdb.dao.intf;

import com.dkl.merchantdb.to.ItemTransactionTO;

public interface ItemTransactionDAO {

	public int createNewItemTransactionRecord(ItemTransactionTO itemTransactionTO);
}
