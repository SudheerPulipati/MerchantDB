package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.LedgerAccountTO;
import com.dkl.merchantdb.to.LedgerReportDataTO;


public interface LedgerAccountDAO{

	public List<LedgerReportDataTO> getLedgerReportData();
	
	public LedgerAccountTO getLedgerAccountRecord(String ledgerId, String firmId, String finBookId);

	public int updateLedgerAccountItemAndPartyRecords(LedgerAccountTO ledgerAccountPartyObj,LedgerAccountTO ledgerAccountItemObj);
	
	public int updateLedgerAccountCashAndPartyRecords(LedgerAccountTO ledgerAccountPartyObj,LedgerAccountTO ledgerAccountCashObj);
}
