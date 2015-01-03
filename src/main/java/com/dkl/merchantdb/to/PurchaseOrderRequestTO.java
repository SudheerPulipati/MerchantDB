package com.dkl.merchantdb.to;

import java.util.List;

public class PurchaseOrderRequestTO{
	
	private List<PartyTO> partyList;
	
	private List<StockPointTO> stockPointList;
	
	private List<FirmTO> firmList;
	
	private List<ItemStockRegisterTO> itemStockRegisterList;
	
	private List<ItemMasterTO> itemMasterList;
	
	

	public List<PartyTO> getPartyList() {
		return partyList;
	}

	public void setPartyList(List<PartyTO> partyList) {
		this.partyList = partyList;
	}

	public List<StockPointTO> getStockPointList() {
		return stockPointList;
	}

	public void setStockPointList(List<StockPointTO> stockPointList) {
		this.stockPointList = stockPointList;
	}

	public List<FirmTO> getFirmList() {
		return firmList;
	}

	public void setFirmList(List<FirmTO> firmList) {
		this.firmList = firmList;
	}

	public List<ItemStockRegisterTO> getItemStockRegisterList() {
		return itemStockRegisterList;
	}

	public void setItemStockRegisterList(List<ItemStockRegisterTO> itemStockRegisterList) {
		this.itemStockRegisterList = itemStockRegisterList;
	}

	public List<ItemMasterTO> getItemMasterList() {
		return itemMasterList;
	}

	public void setItemMasterList(List<ItemMasterTO> itemMasterList) {
		this.itemMasterList = itemMasterList;
	}

	
}
