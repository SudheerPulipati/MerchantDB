package com.dkl.merchantdb.to;

import java.sql.Timestamp;

public class CashBookTO extends MerchantBaseTO {

	private static final long serialVersionUID = -1675327496171985132L;

	private String partyName;

	private Timestamp modifiedDate;

	private Double credit;

	private Double debit;

	private String remarks;

	private String action;
	
	private String finBookId;

	public String getPartyName() {
		return partyName;
	}

	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}

	public Timestamp getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Timestamp modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public Double getCredit() {
		return credit;
	}

	public void setCredit(Double credit) {
		this.credit = credit;
	}

	public Double getDebit() {
		return debit;
	}

	public void setDebit(Double debit) {
		this.debit = debit;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getFinBookId() {
		return finBookId;
	}

	public void setFinBookId(String finBookId) {
		this.finBookId = finBookId;
	}

}
