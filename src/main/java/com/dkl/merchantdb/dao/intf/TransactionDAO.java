package com.dkl.merchantdb.dao.intf;

import com.dkl.merchantdb.to.TransactionTO;

public interface TransactionDAO {

	public int createNewTransactionRecord(String txnType,TransactionTO transactionTO);

}
