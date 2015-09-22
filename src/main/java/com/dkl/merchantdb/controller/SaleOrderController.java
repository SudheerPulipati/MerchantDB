package com.dkl.merchantdb.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dkl.merchantdb.bo.SaleOrderBO;
import com.dkl.merchantdb.to.ItemStockRegisterTO;
import com.dkl.merchantdb.to.ItemTransactionTO;
import com.dkl.merchantdb.to.SaleOrderRequestTO;
import com.dkl.merchantdb.to.TransactionTO;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@SessionAttributes("companyId")
public class SaleOrderController {
	
	@Autowired
	private SaleOrderBO saleOrderBO;
	
	private static final Logger logger = LoggerFactory.getLogger(PurchaseOrderController.class);
	
	@RequestMapping(value = "/salesOrder", method = RequestMethod.GET)
	public String saleOrderHome(@RequestParam String fibId,Model model){
		logger.info("==========/salesOrder/{fibId}==========="+fibId);
		model.addAttribute("fibId",fibId);
		return "salesOrder";
	}
	
	
	@RequestMapping(value = "/getRequestDataForSalesOrder", method = RequestMethod.GET)
	@ResponseBody
	public SaleOrderRequestTO  prepareRequestDataForSalesOrder(@ModelAttribute("companyId")Long companyId){
		logger.info("Welcome SaleOrderController! getRequestDataForSalesOrder...."+companyId);
		SaleOrderRequestTO salesOrderRequestTO = saleOrderBO.prepareDataForPurchaseOrder(companyId);
		logger.info("SalesOrderRequestTO! ...."+salesOrderRequestTO);
		return salesOrderRequestTO;
	}
	
	@RequestMapping(value = "/getItemBatch", method = RequestMethod.GET)
	@ResponseBody
	public List<ItemStockRegisterTO> getAllItemBatch(@RequestParam String itemId,@RequestParam String stockPointId) {
		return saleOrderBO.getAllItemBatch(itemId,stockPointId);
	}
	
	
	@RequestMapping(value = "/saveSaleTransaction", method = RequestMethod.POST)
	@ResponseBody
	public String saveTransaction(@RequestBody String transactionTO1,@ModelAttribute("companyId")Long companyId) throws Exception{
		
		
		
		logger.info("Welcome saveSaleTransaction!");
		
		TransactionTO transactionTO = new ObjectMapper().readValue(transactionTO1, TransactionTO.class);
		
		//return purchaseOrderBO.storePurchaseOrder();
		logger.info("Welcome saveTransaction! getBookID"+transactionTO.getBookID());
		
		logger.info("Welcome saveTransaction! getTransactionType"+transactionTO.getTransactionType());
		logger.info("Welcome saveTransaction! getTransactionDate"+transactionTO.getTransactionDate());
		logger.info("Welcome saveTransaction! getLedgerID"+transactionTO.getLedgerID());
		logger.info("Welcome saveTransaction! getLedgerName"+transactionTO.getLedgerName());
		logger.info("Welcome saveTransaction! getPaymentMode"+transactionTO.getPaymentMode());
		logger.info("Welcome saveTransaction! getTotalAmount"+transactionTO.getTotalAmount());
		logger.info("Welcome saveTransaction! getSlipNo"+transactionTO.getSlipNo());
		
		ItemTransactionTO[] itemTOs =  transactionTO.getItemTransactionTOs();
		
		for (ItemTransactionTO itemTransactionTO : itemTOs) {
			logger.info("Welcome saveTransaction! getBookID===="+itemTransactionTO.getBookID());
			logger.info("Welcome saveTransaction! getItemID===="+itemTransactionTO.getItemID());
			logger.info("Welcome saveTransaction! getItemName===="+itemTransactionTO.getItemName());
			logger.info("Welcome saveTransaction! getItemBatchID===="+itemTransactionTO.getItemBatchID());
			logger.info("Welcome saveTransaction! getItemBatchName===="+itemTransactionTO.getItemBatchName());
			
			logger.info("Welcome saveTransaction! getQuantity===="+itemTransactionTO.getQuantity());
			logger.info("Welcome saveTransaction! getWeight===="+itemTransactionTO.getWeight());
			logger.info("Welcome saveTransaction! getWeightDifference===="+itemTransactionTO.getWeightDifference());
			logger.info("Welcome saveTransaction! getPricePer===="+itemTransactionTO.getPricePer());
			
			logger.info("Welcome saveTransaction! getTotalAmount===="+itemTransactionTO.getTotalAmount());
			logger.info("Welcome saveTransaction! getFirmID===="+itemTransactionTO.getFirmID());
			logger.info("Welcome saveTransaction! getFirmName===="+itemTransactionTO.getFirmName());
			logger.info("Welcome saveTransaction! getNewItemBatchInd===="+itemTransactionTO.getNewItemBatchInd());
			
			logger.info("Welcome saveTransaction! getStockPointId===="+itemTransactionTO.getStockPointId());
			logger.info("Welcome saveTransaction! getStockPointName===="+itemTransactionTO.getStockPointName());
			logger.info("Welcome saveTransaction! getCompanyId===="+itemTransactionTO.getCompanyId());
			
			logger.info("Welcome saveTransaction! getNewItemBatchInd===="+itemTransactionTO.getNewItemBatchInd());
			
			itemTransactionTO.setCompanyId(companyId.toString());
			logger.info("==============================");
		}
		
		saleOrderBO.storeSaleOrder(transactionTO);
		
		logger.info(" saveTransaction! Completed");
		
		return "saleOrderTxnSuccess";
	}

}
