package com.dkl.merchantdb.dao.intf;

import java.util.List;

import com.dkl.merchantdb.to.ItemStockRegisterTO;

public interface ItemStockRegisterDAO{


	//get the record  for a itemID,itemName,bookId and stockPointID
	public ItemStockRegisterTO getItemStockRegisterRecord(String itemId,String itemName, String stockPointId, String finBookId);

	public int createOrUpdateItemStockRegisterRecord(ItemStockRegisterTO itemStockRegisterTO, String newBatchInd);

	List<ItemStockRegisterTO> getAllItemBatch(String itemId, String stockPointId);
}
