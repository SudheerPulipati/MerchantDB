package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.ILedgerAccountDAO;
import com.dkl.merchantdb.dao.mapper.LedgerAccountMapper;
import com.dkl.merchantdb.dao.mapper.LedgerReportMapper;
import com.dkl.merchantdb.to.LedgerAccountTO;
import com.dkl.merchantdb.to.LedgerReportDetailTO;

@Repository
public class LedgerAccountDAO implements ILedgerAccountDAO {

	private static final String GET_LEDGER_ACCOUNT_RECORD = "SELECT * FROM dklf.ledger_account where fib_id = ? and firm_id= ? and ledger_ACC_id =?";

	private static final String UPDATE_LEDGER_ACCOUNT_RECORD = "update dklf.ledger_account ldacc set ldacc.ledger_acc_credit =?,ledger_acc_debit=?,ledger_acc_close_bal=?,modified_date=sysdate() where ldacc.fib_id = ? and ldacc.firm_id=? and ldacc.ledger_acc_id =?";

	private static final String CREATE_LEDGER_ACCOUNT_RECORD = "insert into ledger_account values(?,?,?,?,?,?,?,?,?,?,?,?,?,Now(),Now())";

	private static final String DELETE_LEDGER_ACCOUNT_RECORD = "delete from ledger_account where ledger_acc_id like ?";
	
	private static final String LEDGER_REPORT_BY_LEDGER_GROUP = "select * from ledger join ledger_account where ledger.LEDGER_ID in (select LEDGER_ACC_ID from ledger_account where fib_id=? and LEDGER_GRP_ID in (select LEDGER_GRP_ID from ledger_group where COMPANY_ID=?)) LIMIT 150";
	
	private static final String LEDGER_REPORT_BY_CITY_GROUP = "select * from ledger join ledger_account where ledger.LEDGER_ID in (select LEDGER_ACC_ID from ledger_account where fib_id=? and city_group_id in (select city_group_id from city_group where COMPANY_ID=?)) AND ledger_account.city_group_id IS NOT NULL LIMIT 150";
	
	private static final String LEDGER_REPORT_BY_PARTY = "select * from ledger join ledger_account where ledger.LEDGER_ID in (select LEDGER_ACC_ID from ledger_account where fib_id=? and LEDGER_ACC_ID in (select PARTY_ID from party where COMPANY_ID=?)) LIMIT 150"; 
	
	private static final String LEDGER_REPORT_BY_ITEM = "select * from ledger join ledger_account where ledger.LEDGER_ID in (select LEDGER_ACC_ID from ledger_account where fib_id=? and LEDGER_ACC_ID in (select ITEM_LEDGER_ID from item_ledger where COMPANY_ID=?)) LIMIT 150";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public LedgerAccountTO getLedgerAccountRecord(String ledgerId, String firmId, String finBookId) {
		System.out.println(".....getLedgerAccountRecord............" + ledgerId + firmId + finBookId);
		return jdbcTemplate.queryForObject(GET_LEDGER_ACCOUNT_RECORD, new Object[] { finBookId, firmId, ledgerId },
				new LedgerAccountMapper());
	}

	@Override
	public int updateLedgerAccountItemAndPartyRecords(LedgerAccountTO ledgerAccountPartyObj,
			LedgerAccountTO ledgerAccountItemObj) {
		int result = 0;
		result = jdbcTemplate.update(UPDATE_LEDGER_ACCOUNT_RECORD,
				new Object[] { ledgerAccountPartyObj.getCredit(), ledgerAccountPartyObj.getDebit(),
						ledgerAccountPartyObj.getCloseBalance(), ledgerAccountPartyObj.getBookID(),
						ledgerAccountPartyObj.getFirmID(), ledgerAccountPartyObj.getLedgerAccountID() });
		result = result
				+ jdbcTemplate.update(UPDATE_LEDGER_ACCOUNT_RECORD,
						new Object[] { ledgerAccountItemObj.getCredit(), ledgerAccountItemObj.getDebit(),
								ledgerAccountItemObj.getCloseBalance(), ledgerAccountItemObj.getBookID(),
								ledgerAccountItemObj.getFirmID(), ledgerAccountItemObj.getLedgerAccountID() });
		
		System.out.println("==================updateLedgerAccountItemAndPartyRecords======================="+result);
		return result;
	}

	@Override
	public int updateLedgerAccountCashAndPartyRecords(LedgerAccountTO ledgerAccountPartyObj,
			LedgerAccountTO ledgerAccountCashObj) {
		System.out.println("==============" + ledgerAccountCashObj.getCloseBalance());
		System.out.println("==============" + ledgerAccountPartyObj.getCloseBalance());
		return updateLedgerAccountItemAndPartyRecords(ledgerAccountPartyObj, ledgerAccountCashObj);
	}

	@Override
	public int deleteLedgerAccountRecord(String partyId) {
		return jdbcTemplate.update(DELETE_LEDGER_ACCOUNT_RECORD,partyId+"%");
	}
	
	@Override
	public int createLedgerAccountRecord(LedgerAccountTO ledgerAccountTO) {
		return jdbcTemplate.update(CREATE_LEDGER_ACCOUNT_RECORD, ledgerAccountTO.getLedgerAccountID(),
				ledgerAccountTO.getBookID(), ledgerAccountTO.getLedgerAccountName(),
				ledgerAccountTO.getLedgerGroupID(), ledgerAccountTO.getLedgerGroupName(),
				ledgerAccountTO.getLedgerGroupType(), ledgerAccountTO.getFirmID(), ledgerAccountTO.getFirmName(),
				ledgerAccountTO.getCityGroupID(), ledgerAccountTO.getOpenBalance(), ledgerAccountTO.getCredit(),
				ledgerAccountTO.getDebit(), ledgerAccountTO.getCloseBalance());
	}

	@Override
	public List<LedgerReportDetailTO> getAllLedgerReport(String filterBY, String fib_id, Long companyID, String startDate, String endDate) {
		return jdbcTemplate.query(getSQL(filterBY),new Object[]{fib_id,companyID},new LedgerReportMapper());
	}
	
	private String getSQL(String filterBy){
		if(StringUtils.equals(filterBy, "LedgerGroup")){
			return LEDGER_REPORT_BY_LEDGER_GROUP;
		} else if (StringUtils.equals(filterBy, "CityGroup")){
			return LEDGER_REPORT_BY_CITY_GROUP;
		} else if (StringUtils.equals(filterBy, "Parties")) {
			return LEDGER_REPORT_BY_PARTY;
		} else if(StringUtils.equals(filterBy, "Items")){
			return LEDGER_REPORT_BY_ITEM;
		} else {
			return null;
		}
	}
}
