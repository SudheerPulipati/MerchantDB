package com.dkl.merchantdb.dao.intf;

import com.dkl.merchantdb.to.PurchaseOrderRequestTO;

public interface PurchaseOrderDAO{
	
	public PurchaseOrderRequestTO prepareDataForPurchaseOrder(Long companyId);
	
	public Long getNextHighestTransactionSeqNo(String purchaseType,String finBookId);
	

}
