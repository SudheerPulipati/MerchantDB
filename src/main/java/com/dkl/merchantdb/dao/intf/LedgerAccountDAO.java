package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.LedgerAccountTO;
import com.dkl.merchantdb.to.LedgerReportDataTO;


public interface LedgerAccountDAO{

	public LedgerReportDataTO getLedgerReportData(String fibID,String ledgerGroupID,String startDate, String endDate);
	
	public LedgerAccountTO getLedgerAccountRecord(String ledgerId, String firmId, String finBookId);

	public int updateLedgerAccountItemAndPartyRecords(LedgerAccountTO ledgerAccountPartyObj,LedgerAccountTO ledgerAccountItemObj);
	
	public int updateLedgerAccountCashAndPartyRecords(LedgerAccountTO ledgerAccountPartyObj,LedgerAccountTO ledgerAccountCashObj);
	
	public List<LedgerAccountTO> getDataByLedgerGroup(String ledgerGroupID, String startDate, String endDate, String fbID);
	
	public List<LedgerAccountTO> getDataByCityGroup(String cityGroupID, String startDate, String endDate, String fbID);
	
	public List<LedgerAccountTO> getDataByParty(String itemLedgerID, String startDate, String endDate, String fbID);
}
