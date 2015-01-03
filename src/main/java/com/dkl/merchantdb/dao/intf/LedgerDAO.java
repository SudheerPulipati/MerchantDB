package com.dkl.merchantdb.dao.intf;

import com.dkl.merchantdb.to.LedgerTO;

public interface LedgerDAO{

	public int createLedgerItemAndLedgerPartyRecords(LedgerTO ledgerItem, LedgerTO ledgerParty);
	
	public int createLedgerCashAndLedgerPartyRecords(LedgerTO ledgerCash, LedgerTO ledgerParty);
}
