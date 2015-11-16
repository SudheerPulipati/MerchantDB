package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.LedgerAccountDAO;
import com.dkl.merchantdb.dao.mapper.CityGroupRowMapper;
import com.dkl.merchantdb.dao.mapper.LedgerAccountMapper;
import com.dkl.merchantdb.dao.mapper.LedgerReportMapper;
import com.dkl.merchantdb.to.LedgerAccountTO;
import com.dkl.merchantdb.to.LedgerReportDataTO;

@Repository
public class LedgerAccountDAOImpl implements LedgerAccountDAO {

	private static final String GET_LEDGER_ACCOUNT_RECORD = "SELECT * FROM dklf.ledger_account where fib_id = ? and firm_id= ? and ledger_ACC_id =?";
	private static final String UPDATE_LEDGER_ACCOUNT_RECORD = "update dklf.ledger_account ldacc set ldacc.ledger_acc_credit =?,ledger_acc_debit=?,ledger_acc_close_bal=?,ledger_item_batch_mod_date=sysdate() where ldacc.fib_id = ? and ldacc.firm_id=? and ldacc.ledger_acc_id =?";
	// private static final String LEDGER_REPORT_QUERY = "SELECT ld.LEDGER_NAME,
	// la.LEDGER_GRP_NAME, cg.city_group_name, ld.MODIFIED_DATE,
	// la.LEDGER_ACC_CREDIT, la.LEDGER_ACC_DEBIT, la.LEDGER_ACC_CLOSE_BAL,
	// tr.PAYMENT_MODE FROM ledger_account la,ledger ld,city_group cg,
	// transaction tr WHERE la.LEDGER_ACC_ID=ld.LEDGER_ID AND
	// la.city_group_id=cg.city_group_id AND tr.LEDGER_ID=la.LEDGER_ACC_ID ORDER
	// BY LEDGER_NAME";
	private static final String READ_ALL = "SELECT * FROM ledger_account where fib_id=? and LEDGER_GRP_ID=? and CREATED_DATE BETWEEN ? and ?";
	
	private static final String GET_DATA_BY_LEDGERGROUP = "SELECT * FROM ledger_account where LEDGER_GRP_ID = ? AND fib_id=? AND MODIFIED_DATE BETWEEN ? AND ?";

	private static final String GET_DATA_BY_CITYGROUP = "SELECT * FROM ledger_account where city_group_id = ? AND fib_id=? AND MODIFIED_DATE BETWEEN ? AND ?";

	private static final String GET_DATA_BY_PARTY = "SELECT * FROM ledger_account where LEDGER_ACC_ID = ? AND fib_id=? AND MODIFIED_DATE BETWEEN ? AND ?";

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public LedgerReportDataTO getLedgerReportData(String fibID, String ledgerGroupID, String startDate,
			String endDate) {
		/*return jdbcTemplate.queryForObject(READ_ALL, new Object[] { fibID, ledgerGroupID, startDate, endDate },
				new LedgerReportMapper());*/
		return null;
	}

	@Override
	public LedgerAccountTO getLedgerAccountRecord(String ledgerId, String firmId, String finBookId) {
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
		result = result + jdbcTemplate.update(UPDATE_LEDGER_ACCOUNT_RECORD,
				new Object[] { ledgerAccountItemObj.getCredit(), ledgerAccountItemObj.getDebit(),
						ledgerAccountItemObj.getCloseBalance(), ledgerAccountItemObj.getBookID(),
						ledgerAccountItemObj.getFirmID(), ledgerAccountItemObj.getLedgerAccountID() });
		return result;
	}

	@Override
	public int updateLedgerAccountCashAndPartyRecords(LedgerAccountTO ledgerAccountPartyObj,
			LedgerAccountTO ledgerAccountCashObj) {
		return updateLedgerAccountItemAndPartyRecords(ledgerAccountPartyObj, ledgerAccountCashObj);
	}

	@Override
	public List<LedgerAccountTO> getDataByLedgerGroup(String ledgerGroupID, String fbID, String startDate, String endDate) {
		return jdbcTemplate.query(GET_DATA_BY_LEDGERGROUP, new LedgerAccountMapper(),ledgerGroupID,fbID,startDate,endDate);
	}

	@Override
	public List<LedgerAccountTO> getDataByCityGroup(String cityGroupID, String fbID, String startDate, String endDate) {
		return jdbcTemplate.query(GET_DATA_BY_CITYGROUP, new LedgerAccountMapper(),cityGroupID,fbID,startDate,endDate);
	}

	@Override
	public List<LedgerAccountTO> getDataByParty(String itemLedgerID, String fbID, String startDate, String endDate) {
		return jdbcTemplate.query(GET_DATA_BY_PARTY, new LedgerAccountMapper(),itemLedgerID,fbID,startDate,endDate);
	}

}
