package com.dkl.merchantdb.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.LedgerAccountDAO;
import com.dkl.merchantdb.dao.mapper.LedgerAccountMapper;
import com.dkl.merchantdb.to.LedgerAccountTO;

@Repository
public class LedgerAccountDAOImpl implements LedgerAccountDAO{
	
	private static final String GET_LEDGER_ACCOUNT_RECORD = "SELECT * FROM dklf.ledger_account where fib_id = ? and firm_id= ? and ledger_ACC_id =?";
	private static final String UPDATE_LEDGER_ACCOUNT_RECORD = "update dklf.ledger_account ldacc set ldacc.ledger_acc_credit =?,ledger_acc_debit=?,ledger_acc_close_bal=?,ledger_item_batch_mod_date=sysdate() where ldacc.fib_id = ? and ldacc.firm_id=? and ldacc.ledger_acc_id =?";

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public LedgerAccountTO getLedgerAccountRecord(String ledgerId,String firmId,String finBookId) {
		System.out.println(".....getLedgerAccountRecord............"+ledgerId+firmId+finBookId);
		return jdbcTemplate.queryForObject(GET_LEDGER_ACCOUNT_RECORD, new Object[]{finBookId,firmId,ledgerId},new LedgerAccountMapper());
	}

	@Override
	public int updateLedgerAccountItemAndPartyRecords(LedgerAccountTO ledgerAccountPartyObj,LedgerAccountTO ledgerAccountItemObj) {
		int result =0;
		result = jdbcTemplate.update(UPDATE_LEDGER_ACCOUNT_RECORD, 
							       new Object[]{ledgerAccountPartyObj.getCredit(),
											ledgerAccountPartyObj.getDebit(),
											ledgerAccountPartyObj.getCloseBalance(),
											ledgerAccountPartyObj.getBookID(),
											ledgerAccountPartyObj.getFirmID(),
											ledgerAccountPartyObj.getLedgerAccountID()});
		result = result + jdbcTemplate.update(UPDATE_LEDGER_ACCOUNT_RECORD, 
								    new Object[]{ledgerAccountItemObj.getCredit(),
												 ledgerAccountItemObj.getDebit(),
												 ledgerAccountItemObj.getCloseBalance(),
												 ledgerAccountItemObj.getBookID(),
												 ledgerAccountItemObj.getFirmID(),
												 ledgerAccountItemObj.getLedgerAccountID()});
		return result;
	}

	@Override
	public int updateLedgerAccountCashAndPartyRecords(LedgerAccountTO ledgerAccountPartyObj,LedgerAccountTO ledgerAccountCashObj){
		System.out.println("=============="+ledgerAccountCashObj.getCloseBalance());
		System.out.println("=============="+ledgerAccountPartyObj.getCloseBalance());
		return updateLedgerAccountItemAndPartyRecords(ledgerAccountPartyObj,ledgerAccountCashObj);
	}

}
