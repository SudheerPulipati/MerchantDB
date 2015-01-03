package com.dkl.merchantdb.dao.intf;

import com.dkl.merchantdb.to.LedgerAccountTO;


public interface LedgerAccountDAO{


	public LedgerAccountTO getLedgerAccountRecord(String ledgerId, String firmId, String finBookId);

	public int updateLedgerAccountItemAndPartyRecords(LedgerAccountTO ledgerAccountPartyObj,LedgerAccountTO ledgerAccountItemObj);
	
	public int updateLedgerAccountCashAndPartyRecords(LedgerAccountTO ledgerAccountPartyObj,LedgerAccountTO ledgerAccountCashObj);
}
