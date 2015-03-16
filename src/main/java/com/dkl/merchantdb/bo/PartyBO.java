package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.dkl.merchantdb.dao.impl.SequenseGenDAO;
import com.dkl.merchantdb.dao.intf.FirmDAO;
import com.dkl.merchantdb.dao.intf.IFinancialBookDAO;
import com.dkl.merchantdb.dao.intf.ILedgGroupDAO;
import com.dkl.merchantdb.dao.intf.ILedgerAccountDAO;
import com.dkl.merchantdb.dao.intf.IPartyDAO;
import com.dkl.merchantdb.to.FirmTO;
import com.dkl.merchantdb.to.LedgerAccountTO;
import com.dkl.merchantdb.to.LedgerGroupTO;
import com.dkl.merchantdb.to.PartyTO;
import com.dkl.merchantdb.util.DklUtil;

@Component
public class PartyBO {

	@Autowired
	private IPartyDAO partyDAO;

	@Autowired
	private ILedgerAccountDAO ledgerAccountDAO;

	@Autowired
	private FirmDAO firmDAO;

	@Autowired
	private IFinancialBookDAO financialBookDAO;
	
	@Autowired
	private ILedgGroupDAO ledgerGroupDAO;

	@Autowired
	private SequenseGenDAO sequenseGenDAO;

	@Transactional(rollbackFor = Exception.class)
	public int createParty(PartyTO partyTO) {
		partyTO.setPartyID(sequenseGenDAO.getSequenceID("PARTY_ID", "PARTY", "PY"));
		partyTO.setCreationDate(DklUtil.getTodayDate());
		partyTO.setModifiedDate(DklUtil.getTodayDate());
		LedgerGroupTO ledgerGroupTO = prepareLedgerGroupTO(partyTO.getLedgerGroupId());
		partyTO.setLedgerGroupId(ledgerGroupTO.getLedgGroupID());
		partyDAO.createParty(partyTO);
		List<FirmTO> firmsList = firmDAO.readAllFirmsByFK(partyTO.getCompanyID());
		String  finBookId = financialBookDAO.getMaxFinYear(partyTO.getCompanyID());
		int noOfRowsInserted = 0;
		if(CollectionUtils.isEmpty(firmsList)){
			throw new EmptyResultDataAccessException(1);
		}
		for (FirmTO firmTO : firmsList) {
			noOfRowsInserted += ledgerAccountDAO.createLedgerAccountRecord(prepareLedgerAccountTO(partyTO, finBookId,
					firmTO,ledgerGroupTO ));
		}
		return noOfRowsInserted;
	}

	private LedgerGroupTO prepareLedgerGroupTO(String ledgerGroup) {
		String[] ledgerGroupDetails = ledgerGroup.split(",");
		LedgerGroupTO ledgerGroupTO = new LedgerGroupTO();
		ledgerGroupTO.setLedgGroupID(ledgerGroupDetails[0]);
		ledgerGroupTO.setLedgGroupName(ledgerGroupDetails[1]);
		ledgerGroupTO.setLedgGroupType(ledgerGroupDetails[2]);
		System.out.println("ledgerGroupId:"+ledgerGroupTO.getLedgGroupID());
		return ledgerGroupTO;
	}

	private LedgerAccountTO prepareLedgerAccountTO(PartyTO partyTO, String finBookId, FirmTO firmTO, LedgerGroupTO ledgerGroupTO) {
		LedgerAccountTO ledgerAccountTO = new LedgerAccountTO();
		ledgerAccountTO.setLedgerAccountID(sequenseGenDAO.getSequenceID("LEDGER_ACC_ID", "LEDGER_ACCOUNT", "LG"));
		ledgerAccountTO.setBookID(finBookId);
		ledgerAccountTO.setLedgerAccountID(partyTO.getPartyID());
		ledgerAccountTO.setLedgerAccountName(partyTO.getPartyName());
		ledgerAccountTO.setLedgerGroupID(ledgerGroupTO.getLedgGroupID());
		ledgerAccountTO.setLedgerGroupName(ledgerGroupTO.getLedgGroupName());
		ledgerAccountTO.setLedgerGroupType(ledgerGroupTO.getLedgGroupType());
		ledgerAccountTO.setFirmID(firmTO.getFirmID());
		ledgerAccountTO.setCityGroupID(partyTO.getCityGroupId());
		ledgerAccountTO.setOpenBalance(partyTO.getOpeningBalance());
		return ledgerAccountTO;
	}

	public PartyTO readParty(String partyID) {
		return partyDAO.readParty(partyID);
	}

	public List<PartyTO> readAllParty(Long companyId) {
		return partyDAO.readAllParty(companyId);
	}

	public void update(PartyTO partyTO) {
		partyDAO.updateParty(partyTO);
	}

	@Transactional
	public void delete(String partyID) {
		partyDAO.deleteParty(partyID);
		ledgerAccountDAO.deleteLedgerAccountRecord(partyID);
	}
}
