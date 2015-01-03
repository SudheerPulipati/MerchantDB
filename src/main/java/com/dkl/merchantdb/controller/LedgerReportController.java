package com.dkl.merchantdb.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dkl.merchantdb.to.JsonTemplateTO;
import com.dkl.merchantdb.to.LedgerReportDetailTO;
import com.dkl.merchantdb.to.LedgerReportTO;
import com.google.gson.Gson;

@Controller
@SessionAttributes("fbid")
public class LedgerReportController {

	@RequestMapping("/ledgerReport")
	public String viewLedgerReport() {
		return "ledgerReport";
	}
	
	@RequestMapping("/ledgerReportJSON")
	@ResponseBody
	public String viewLedgerReportJSON(){
		/*LedgerReportDetailTO ledgerReportDetailTO = new LedgerReportDetailTO();
		
		LedgerReportTO ledgerReportTO = new LedgerReportTO();
		ledgerReportDetailTO.setBalance("$100");
		ledgerReportDetailTO.setCredit("$200");
		ledgerReportDetailTO.setDate("7th DEC,2014");
		ledgerReportDetailTO.setDebit("$300");
		ledgerReportDetailTO.setMode("CASH");
		ledgerReportDetailTO.setRemarks("Nice One");
		ledgerReportTO.setCityGroup("CITY111");
		ledgerReportTO.setLedgerGroup("LEDG111");
		ledgerReportTO.setLedgerName("Consultancy");
			List<LedgerReportDetailTO> LedgerReportDetailTOList = new ArrayList<LedgerReportDetailTO>();
			LedgerReportDetailTOList.add(ledgerReportDetailTO);
			LedgerReportDetailTO ledgerReportDetailTO2 = new LedgerReportDetailTO();
			ledgerReportDetailTO2.setBalance("Rs10");
			ledgerReportDetailTO2.setCredit("Rs20");
			ledgerReportDetailTO2.setDate("7th DEC,2012");
			ledgerReportDetailTO2.setDebit("Rs 350");
			ledgerReportDetailTO2.setMode("NET BANKING");
			ledgerReportDetailTO2.setRemarks("GOOD");
			LedgerReportDetailTOList.add(ledgerReportDetailTO2);
		ledgerReportTO.setLedgerReportDetailTOList(LedgerReportDetailTOList);*/
		return new Gson().toJson(populateLedgerReportTO());
	}
	
	private List<LedgerReportTO> populateLedgerReportTO(){
	    List<LedgerReportTO> ledgerReportToList = new ArrayList<LedgerReportTO>();
	    
	    for(int i=0;i<60;i++){
		LedgerReportTO ledgerReportTO = new LedgerReportTO();
		ledgerReportTO.setCityGroup("CITY"+i);
		ledgerReportTO.setLedgerGroup("LG"+i);
		ledgerReportTO.setLedgerName("LN"+i);
		ledgerReportTO.setLedgerReportDetailTOList(populateLedgerReportDetailTO());
		ledgerReportToList.add(ledgerReportTO);
	    }
	    LedgerReportTO ledgerReportTO = new LedgerReportTO();
	    ledgerReportTO.setCityGroup("CITY15");
	    ledgerReportTO.setLedgerGroup("LG15");
	    ledgerReportTO.setLedgerName("LN1");
	    ledgerReportTO.setLedgerReportDetailTOList(populateLedgerReportDetailTO());
	    ledgerReportToList.add(ledgerReportTO);
	    return ledgerReportToList;
	}
	
	private List<LedgerReportDetailTO> populateLedgerReportDetailTO(){
	    List<LedgerReportDetailTO> ledgerReportDetailTOList = new ArrayList<LedgerReportDetailTO>();
	    for(int i=0;i<5;i++){
		LedgerReportDetailTO ledgerReportDetailTO = new LedgerReportDetailTO();
		ledgerReportDetailTO.setBalance("BAL"+1);
		ledgerReportDetailTO.setCredit("CR"+i);
		ledgerReportDetailTO.setDate("DATE"+i);
		ledgerReportDetailTO.setDebit("DEBIT"+i);
		ledgerReportDetailTO.setMode("MODE"+i);
		ledgerReportDetailTO.setRemarks("Remarks"+i);
		ledgerReportDetailTOList.add(ledgerReportDetailTO);
	    }
	    return ledgerReportDetailTOList;
	}
}
