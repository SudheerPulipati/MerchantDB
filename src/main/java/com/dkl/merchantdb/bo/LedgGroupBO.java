package com.dkl.merchantdb.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.impl.LedgGroupDAO;
import com.dkl.merchantdb.dao.impl.SequenseGenDAO;
import com.dkl.merchantdb.dao.intf.LedgerAccountDAO;
import com.dkl.merchantdb.to.LedgGroupTO;
import com.dkl.merchantdb.to.LedgerGroupTO;
import com.dkl.merchantdb.to.LedgerReportDataTO;
import com.dkl.merchantdb.to.LedgerReportDetailTO;
import com.dkl.merchantdb.to.LedgerReportTO;
import com.dkl.merchantdb.util.DklUtil;
import com.google.gson.Gson;

@Component
public class LedgGroupBO {

	@Autowired
	LedgGroupDAO ledgGroupDAO;
	
	@Autowired
	LedgerAccountDAO ledgerAccountDAO;
	
	@Autowired
	SequenseGenDAO SequenseGenDAO;
	
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
	
	public List<LedgerReportTO> readLedgerReport(){
		List<LedgerReportDataTO> ledgerReportDataToList = ledgerAccountDAO.getLedgerReportData();
		
		//List<LedgerReportDataTO> ledgerReportDataToList = genMockLedgerReportData();
		List<LedgerReportTO> ledgerReportList = new ArrayList<LedgerReportTO>();
		LedgerReportTO ledgerReportTO = null;
		LedgerReportDetailTO ledgerReportDetailTO;
		List<LedgerReportDetailTO> LedgerReportDetailList = null;
		int index = 0;
		String ledgerName = "";
		 
		for(LedgerReportDataTO reportData : ledgerReportDataToList){
			ledgerReportDetailTO = new LedgerReportDetailTO();
			
			if(index == 0 || !ledgerName.equals(reportData.getLedgerName())){
				ledgerReportTO = new LedgerReportTO();
				LedgerReportDetailList = new ArrayList<LedgerReportDetailTO>();
				ledgerName = reportData.getLedgerName();
				ledgerReportTO.setLedgerName(reportData.getLedgerName());
				ledgerReportTO.setLedgerGroup(reportData.getLedgerGroup());
				ledgerReportTO.setCityGroup(reportData.getCityGroup());
				ledgerReportDetailTO.setDate(reportData.getDate());
				ledgerReportDetailTO.setCredit(Long.toString(reportData.getCredit()));
				ledgerReportDetailTO.setDebit(Long.toString(reportData.getDebit()));
				ledgerReportDetailTO.setBalance(Long.toString(reportData.getBalance()));
				ledgerReportDetailTO.setMode(reportData.getMode());
				LedgerReportDetailList.add(ledgerReportDetailTO);
				ledgerReportTO.setLedgerReportDetailTOList(LedgerReportDetailList);
				ledgerReportList.add(ledgerReportTO);
				index++;
			}  else {
				ledgerReportDetailTO.setDate(reportData.getDate());
				ledgerReportDetailTO.setCredit(Long.toString(reportData.getCredit()));
				ledgerReportDetailTO.setDebit(Long.toString(reportData.getDebit()));
				ledgerReportDetailTO.setBalance(Long.toString(reportData.getBalance()));
				ledgerReportDetailTO.setMode(reportData.getMode());
				LedgerReportDetailList.add(ledgerReportDetailTO);
				ledgerReportTO.setLedgerReportDetailTOList(LedgerReportDetailList);
			}
		}
		return ledgerReportList;
	}
	
	private List<LedgerReportDataTO> genMockLedgerReportData(){
		List<LedgerReportDataTO> ledgerReportDataToList = new ArrayList<LedgerReportDataTO>();
		for(int i=0;i<5;i++){
			LedgerReportDataTO ledgerReportTO = new LedgerReportDataTO();
			ledgerReportTO.setLedgerName("LEDG1");
			ledgerReportTO.setLedgerGroup("LedgerGroup1");
			ledgerReportTO.setCityGroup("CITY1");
			ledgerReportTO.setDate("23rd March,2015");
			ledgerReportTO.setCredit(1000);
			ledgerReportTO.setBalance(500);
			ledgerReportTO.setMode("Credit");
			ledgerReportDataToList.add(ledgerReportTO);
		}
		for(int i=0;i<5;i++){
			LedgerReportDataTO ledgerReportTO = new LedgerReportDataTO();
			ledgerReportTO.setLedgerName("LEDG2");
			ledgerReportTO.setLedgerGroup("LedgerGroup2");
			ledgerReportTO.setCityGroup("CITY2");
			ledgerReportTO.setDate("23rd March,2015");
			ledgerReportTO.setCredit(1000);
			ledgerReportTO.setBalance(500);
			ledgerReportTO.setMode("Credit");
			ledgerReportDataToList.add(ledgerReportTO);
		}
		for(int i=0;i<5;i++){
			LedgerReportDataTO ledgerReportTO = new LedgerReportDataTO();
			ledgerReportTO.setLedgerName("LEDG3");
			ledgerReportTO.setLedgerGroup("LedgerGroup3");
			ledgerReportTO.setCityGroup("CITY3");
			ledgerReportTO.setDate("23rd March,2015");
			ledgerReportTO.setCredit(1000);
			ledgerReportTO.setBalance(500);
			ledgerReportTO.setMode("Credit");
			ledgerReportDataToList.add(ledgerReportTO);
		}
		System.out.println("...."+new Gson().toJson(ledgerReportDataToList));
		return ledgerReportDataToList;
	}
	public static void main(String[] args) {
		System.out.println(new Gson().toJson(new LedgGroupBO().readLedgerReport()));
	}
}
