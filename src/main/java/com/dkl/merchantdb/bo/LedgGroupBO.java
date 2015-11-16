package com.dkl.merchantdb.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.impl.CityGroupDAO;
import com.dkl.merchantdb.dao.impl.LedgGroupDAO;
import com.dkl.merchantdb.dao.impl.LedgerDAOImpl;
import com.dkl.merchantdb.dao.impl.PartyDAO;
import com.dkl.merchantdb.dao.impl.SequenseGenDAO;
import com.dkl.merchantdb.dao.intf.ILedgerAccountDAO;
import com.dkl.merchantdb.dao.intf.ItemLedgerDAO;
import com.dkl.merchantdb.dao.intf.ItemTransactionDAO;
import com.dkl.merchantdb.to.CityGroupTO;
import com.dkl.merchantdb.to.ItemLedgerTO;
import com.dkl.merchantdb.to.LedgerAccountTO;
import com.dkl.merchantdb.to.LedgerGroupTO;
import com.dkl.merchantdb.to.LedgerReportDetailTO;
import com.dkl.merchantdb.to.LedgerReportTO;
import com.dkl.merchantdb.to.LedgerTO;
import com.dkl.merchantdb.to.PartyTO;
import com.dkl.merchantdb.util.DklUtil;

@Component
public class LedgGroupBO {

	@Autowired
	LedgGroupDAO ledgGroupDAO;
	
	@Autowired
	CityGroupDAO cityGroupDAO;
	
	@Autowired
	PartyDAO partyDAO;
	
	@Autowired
	ItemLedgerDAO itemLedgerDAO;
	
	@Autowired
	ILedgerAccountDAO ledgerAccountDAO;
	
	@Autowired
	SequenseGenDAO SequenseGenDAO;
	
	@Autowired
	LedgerDAOImpl ledgerDAO;
	
	@Autowired
	ItemTransactionDAO itemTransactionDAO;
	
	public void create(LedgerGroupTO ledgGroupTO){
		ledgGroupTO.setLedgGroupID(SequenseGenDAO.getSequenceID("LEDGER_GRP_ID", "LEDGER_GROUP","LG"));
		ledgGroupTO.setLedgCreateDate(DklUtil.getTodayDate());
		ledgGroupTO.setLedgModDate(DklUtil.getTodayDate());
		ledgGroupDAO.create(ledgGroupTO);
	}
	
	public LedgerGroupTO read(String ledgGroupID){
		return ledgGroupDAO.read(ledgGroupID);
	}
	
	public List<LedgerGroupTO> readAllByFK(Long companyId){
		return ledgGroupDAO.readAll(companyId);
	}
	
	public void update(LedgerGroupTO ledgGroupTO){
		ledgGroupTO.setLedgModDate(DklUtil.getTodayDate());
		ledgGroupDAO.update(ledgGroupTO);
	}
	
	public void delete(String ledgGroupID){
		ledgGroupDAO.delete(ledgGroupID);
	}
	
	public List<LedgerGroupTO> readByFK(int companyID){
		return ledgGroupDAO.readByFK(companyID);
	}
	
	public LedgerReportTO readLedgerReport(LedgerReportTO ledgerReportTO,Long companyId, String finBookId){
		LedgerReportTO responseTO = new LedgerReportTO();  
		List<LedgerReportDetailTO> ledgerAccountList = ledgerAccountDAO.getAllLedgerReport(ledgerReportTO.getFilterBy(), finBookId, companyId, ledgerReportTO.getStartDate(), ledgerReportTO.getEndDate());
		for(LedgerReportDetailTO ledgerReportDetailTO:ledgerAccountList){
			ledgerReportDetailTO.setTransactionDetails(itemTransactionDAO.getTransactionDetail(finBookId, ledgerReportDetailTO.getTransactionID(), ledgerReportDetailTO.getLedgerSeqNo()));
		}
		/*if(StringUtils.equals(ledgerReportTO.getFilterBy(),"LedgerGroup")){
			responseTO = getDataByLedgerGroup(ledgerReportTO, companyId, finBookId);
		} else if(StringUtils.equals(ledgerReportTO.getFilterBy(),"CityGroup")){
			responseTO = getDataByCityGroup(ledgerReportTO, companyId, finBookId);
		} else if(StringUtils.equals(ledgerReportTO.getFilterBy(),"Parties")){
			responseTO =getDataByParty(ledgerReportTO, companyId, finBookId);
		} else if(StringUtils.equals(ledgerReportTO.getFilterBy(),"Items")){
			responseTO = getDataByItem(ledgerReportTO, companyId, finBookId);
		}*/
		responseTO.setItems(ledgerAccountList);
		return responseTO;
	}
	
	/*private LedgerReportTO getDataByLedgerGroup(LedgerReportTO ledgerReportTO,Long companyId, String finBookId){
		ledgerReportTO.setLedgerGroupList(getLedgerGroupIDs(ledgGroupDAO.readAll(companyId)));
		List<LedgerAccountTO> ledgerReportDataList = new ArrayList<LedgerAccountTO>();
		for (String ledgerGroupID : ledgerReportTO.getLedgerGroupList()) {
			for(LedgerAccountTO ledgerAccountTO : ledgerAccountDAO.getDataByLedgerGroup(ledgerGroupID, finBookId,ledgerReportTO.getStartDate(), ledgerReportTO.getEndDate())){
				LedgerTO ledgerTO = ledgerDAO.readAll(ledgerAccountTO.getLedgerAccountID());
				ledgerAccountTO.setTrnasactionType(ledgerTO.getTransactionType());
				ledgerAccountTO.setTransactionDate(ledgerTO.getTransactionDate());
				ledgerReportDataList.add(ledgerAccountTO);
			}
		}
		
		ledgerReportTO.setItems(ledgerReportDataList);
		return ledgerReportTO;
	}*/
	
	/*private LedgerReportTO getDataByCityGroup(LedgerReportTO ledgerReportTO,Long companyId, String finBookId){
		ledgerReportTO.setCityGroupList(getCityGroupIDs(cityGroupDAO.readAllByFK(companyId)));
		List<LedgerAccountTO> ledgerReportDataList = new ArrayList<LedgerAccountTO>();
		for (String cityGroupID : ledgerReportTO.getCityGroupList()) {
			ledgerReportDataList.addAll(ledgerAccountDAO.getDataByCityGroup(cityGroupID,
																			finBookId,
																			ledgerReportTO.getStartDate(),
																			ledgerReportTO.getEndDate()));
		}
		ledgerReportTO.setItems(ledgerReportDataList);
		return ledgerReportTO;
	}*/
	
	/*private LedgerReportTO getDataByParty(LedgerReportTO ledgerReportTO,Long companyId, String finBookId){
		ledgerReportTO.setPartiesList(getPartyIds(partyDAO.readAllParty(companyId)));
		List<LedgerAccountTO> ledgerReportDataList = new ArrayList<LedgerAccountTO>();
		for (String partyId : ledgerReportTO.getPartiesList()) {
			ledgerReportDataList.addAll(ledgerAccountDAO.getDataByParty(partyId,
																		finBookId,
																		ledgerReportTO.getStartDate(),
																		ledgerReportTO.getEndDate()));
		}
		ledgerReportTO.setItems(ledgerReportDataList);
		return ledgerReportTO;
	}*/
	
	/*private LedgerReportTO getDataByItem(LedgerReportTO ledgerReportTO,Long companyId, String finBookId){
		ledgerReportTO.setItemsList(getItemIds(itemLedgerDAO.readByFK(companyId)));
		List<LedgerAccountTO> ledgerReportDataList = new ArrayList<LedgerAccountTO>();
		for (String itemID : ledgerReportTO.getItemsList()) {
			ledgerReportDataList.addAll(ledgerAccountDAO.getDataByParty(itemID,
																			finBookId,
																			ledgerReportTO.getStartDate(),
																			ledgerReportTO.getEndDate()));
		}
		ledgerReportTO.setItems(ledgerReportDataList);
		return ledgerReportTO;
	}*/
	
	private List<String> getLedgerGroupIDs(List<LedgerGroupTO> ledgerGroupTOs){
		List<String> ledgerGroupIdList = new ArrayList<String>();
		for(LedgerGroupTO ledgerGroupTO : ledgerGroupTOs){
			ledgerGroupIdList.add(ledgerGroupTO.getLedgGroupID());
		}
		return ledgerGroupIdList;
	}
	
	private List<String> getCityGroupIDs(List<CityGroupTO> cityGroupTos){
		List<String> cityGroupList = new ArrayList<String>();
		for(CityGroupTO cityGroupTO : cityGroupTos){
			cityGroupList.add(cityGroupTO.getCityGroupID());
		}
		return cityGroupList;
	}
	
	private List<String> getPartyIds(List<PartyTO> partyTOs){
		List<String> partyIdList = new ArrayList<String>();
		for(PartyTO partyTo : partyTOs){
			partyIdList.add(partyTo.getPartyID());
		}
		return partyIdList;
	}
	
	private List<String> getItemIds(List<ItemLedgerTO> itemLedgerTos){
		List<String> ItemIdList = new ArrayList<String>();
		for(ItemLedgerTO itemLedgerTo : itemLedgerTos){
			ItemIdList.add(itemLedgerTo.getItemLedgerID());
		}
		return ItemIdList;
	}
}
