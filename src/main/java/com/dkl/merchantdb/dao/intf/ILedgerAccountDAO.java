package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.LedgerAccountTO;
import com.dkl.merchantdb.to.LedgerReportDetailTO;

public interface ILedgerAccountDAO {

	public int createLedgerAccountRecord(LedgerAccountTO ledgerAccountTO);

	public LedgerAccountTO getLedgerAccountRecord(String ledgerId, String firmId, String finBookId);

	public int updateLedgerAccountItemAndPartyRecords(LedgerAccountTO ledgerAccountPartyObj,
			LedgerAccountTO ledgerAccountItemObj);

	public int updateLedgerAccountCashAndPartyRecords(LedgerAccountTO ledgerAccountPartyObj,
			LedgerAccountTO ledgerAccountCashObj);

	int deleteLedgerAccountRecord(String partyId);
	
	public List<LedgerReportDetailTO> getAllLedgerReport(String filterBY, String fib_id, Long companyID, String startDate, String endDate);
}
