package com.dkl.merchantdb.to;

import java.util.List;

public class LedgerReportTO {
	
	private String startDate;
	private String endDate;
	private String filterBy;
	private List<String> ledgerGroupList;
	private List<String> cityGroupList;
	private List<String> partiesList;
	private List<String> itemsList;
	private List items;
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getFilterBy() {
		return filterBy;
	}
	public void setFilterBy(String filterBy) {
		this.filterBy = filterBy;
	}
	public List<String> getLedgerGroupList() {
		return ledgerGroupList;
	}
	public void setLedgerGroupList(List<String> ledgerGroupList) {
		this.ledgerGroupList = ledgerGroupList;
	}
	public List<String> getCityGroupList() {
		return cityGroupList;
	}
	public void setCityGroupList(List<String> cityGroupList) {
		this.cityGroupList = cityGroupList;
	}
	public List<String> getPartiesList() {
		return partiesList;
	}
	public void setPartiesList(List<String> partiesList) {
		this.partiesList = partiesList;
	}
	public List<String> getItemsList() {
		return itemsList;
	}
	public void setItemsList(List<String> itemsList) {
		this.itemsList = itemsList;
	}
	public List getItems() {
		return items;
	}
	public void setItems(List items) {
		this.items = items;
	}
	
	
}
