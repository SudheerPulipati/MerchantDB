package com.dkl.merchantdb.to;

public class ItemMasterLedgerTO {
	
	private ItemMasterTO itemMasterTO;

	private ItemLedgerTO itemLedgerTO;

	public ItemLedgerTO getItemLedgerTO() {
		return itemLedgerTO;
	}

	public void setItemLedgerTO(ItemLedgerTO itemLedgerTO) {
		this.itemLedgerTO = itemLedgerTO;
	}

	public ItemMasterTO getItemMasterTO() {
		return itemMasterTO;
	}

	public void setItemMasterTO(ItemMasterTO itemMasterTO) {
		this.itemMasterTO = itemMasterTO;
	}
}

