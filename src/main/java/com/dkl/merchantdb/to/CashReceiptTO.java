package com.dkl.merchantdb.to;

import java.util.List;

public class CashReceiptTO {

	private List<PartyTO> partyList;
	
	private List<FirmTO> firmList;
	
	private List<NarrationTO> narrationList;
	
	private Long cashReceiptNo;

	public List<PartyTO> getPartyList() {
		return partyList;
	}

	public void setPartyList(List<PartyTO> partyList) {
		this.partyList = partyList;
	}

	public List<FirmTO> getFirmList() {
		return firmList;
	}

	public void setFirmList(List<FirmTO> firmList) {
		this.firmList = firmList;
	}

	public List<NarrationTO> getNarrationList() {
		return narrationList;
	}

	public void setNarrationList(List<NarrationTO> narrationList) {
		this.narrationList = narrationList;
	}

	public Long getCashReceiptNo() {
		return cashReceiptNo;
	}

	public void setCashReceiptNo(Long cashReceiptNo) {
		this.cashReceiptNo = cashReceiptNo;
	}
	
	
}
