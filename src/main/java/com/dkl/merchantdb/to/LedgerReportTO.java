package com.dkl.merchantdb.to;

import java.util.List;

public class LedgerReportTO {

	private String ledgerName;
	private String ledgerGroup;
	private String cityGroup;
	private List<LedgerReportDetailTO> ledgerReportDetailTOList;

	public String getLedgerName() {
		return ledgerName;
	}

	public void setLedgerName(String ledgerName) {
		this.ledgerName = ledgerName;
	}

	public String getLedgerGroup() {
		return ledgerGroup;
	}

	public void setLedgerGroup(String ledgerGroup) {
		this.ledgerGroup = ledgerGroup;
	}

	public String getCityGroup() {
		return cityGroup;
	}

	public void setCityGroup(String cityGroup) {
		this.cityGroup = cityGroup;
	}

	public List<LedgerReportDetailTO> getLedgerReportDetailTOList() {
		return ledgerReportDetailTOList;
	}

	public void setLedgerReportDetailTOList(
			List<LedgerReportDetailTO> ledgerReportDetailTOList) {
		this.ledgerReportDetailTOList = ledgerReportDetailTOList;
	}
}
