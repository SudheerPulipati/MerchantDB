package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.LedgerReportDataTO;
import com.dkl.merchantdb.to.LedgerReportDetailTO;
import com.dkl.merchantdb.to.LedgerReportTO;

/**
 * @author Administrator
 *
 */
public class LedgerReportMapper implements RowMapper<LedgerReportDetailTO>  {

	@Override
	public LedgerReportDetailTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		LedgerReportDetailTO ledgerReportDetailTO = new LedgerReportDetailTO();
		ledgerReportDetailTO.setBookID(rs.getString("FIB_ID"));
		ledgerReportDetailTO.setTransactionID(rs.getString("TRANS_ID"));
		ledgerReportDetailTO.setTrnasactionType(rs.getString("TRANS_TYPE"));
		ledgerReportDetailTO.setTransactionDate(rs.getString("TRANS_DATE"));
		ledgerReportDetailTO.setLedgerID(rs.getString("LEDGER_ID"));
		ledgerReportDetailTO.setLedgerSeqNo(rs.getLong("LEDGER_SEQ_NO"));
		ledgerReportDetailTO.setLedgerAccountName(rs.getString("LEDGER_NAME"));
		ledgerReportDetailTO.setFirmID(rs.getString("FIRM_ID"));
		ledgerReportDetailTO.setFirmName(rs.getString("FIRM_NAME"));
		ledgerReportDetailTO.setCityGroupID(rs.getString("city_group_id"));
		ledgerReportDetailTO.setCr_Dr(rs.getString("LEDGER_CR_DR"));
		ledgerReportDetailTO.setAmount(rs.getLong("LEDGER_AMOUNT"));
		ledgerReportDetailTO.setCreationDate(rs.getString("CREATED_DATE"));
		ledgerReportDetailTO.setModifiedDate(rs.getString("MODIFIED_DATE"));
		ledgerReportDetailTO.setLedgerAccountID(rs.getString("LEDGER_ACC_ID"));
		ledgerReportDetailTO.setLedgerGroupID(rs.getString("LEDGER_GRP_ID"));
		ledgerReportDetailTO.setLedgerGroupName(rs.getString("LEDGER_GRP_NAME"));
		ledgerReportDetailTO.setFirmID(rs.getString("FIRM_ID"));
		ledgerReportDetailTO.setFirmName(rs.getString("FIRM_NAME"));
		ledgerReportDetailTO.setTransactionID(rs.getString("TRANS_ID"));
		ledgerReportDetailTO.setOpenBalance(rs.getLong("LEDGER_ACC_OPEN_BAL"));
		ledgerReportDetailTO.setCredit(rs.getLong("LEDGER_ACC_CREDIT"));
		ledgerReportDetailTO.setDebit(rs.getLong("LEDGER_ACC_DEBIT"));
		ledgerReportDetailTO.setCloseBalance(rs.getLong("LEDGER_ACC_CLOSE_BAL"));
		
		return ledgerReportDetailTO;
	}

}
