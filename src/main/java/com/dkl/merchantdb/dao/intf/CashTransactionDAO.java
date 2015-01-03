package com.dkl.merchantdb.dao.intf;

import com.dkl.merchantdb.to.CashTransactionTO;

public interface CashTransactionDAO{
	
	public Long getNextHighestTransactionSeqNo(String transType,String finBookId);

	public int createCashReceiptRecord(CashTransactionTO cashTransactionTO);
}
