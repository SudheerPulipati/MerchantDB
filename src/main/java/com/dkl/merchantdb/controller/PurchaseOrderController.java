package com.dkl.merchantdb.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dkl.merchantdb.bo.PurchaseOrderBO;
import com.dkl.merchantdb.to.ItemStockRegisterTO;
import com.dkl.merchantdb.to.ItemTransactionTO;
import com.dkl.merchantdb.to.PurchaseOrderRequestTO;
import com.dkl.merchantdb.to.TransactionTO;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@SessionAttributes("companyId")
public class PurchaseOrderController{
	
	@Autowired
	private PurchaseOrderBO purchaseOrderBO;
	
	
	private static final Logger logger = LoggerFactory.getLogger(PurchaseOrderController.class);
	
	@RequestMapping(value = "/purchaseOrder", method = RequestMethod.GET)
	public String purchaseOrderHome() {
		return "purchaseOrder";
	}
	
	@RequestMapping(value = "/getRequestDataForPurchaseOrder", method = RequestMethod.GET)
	@ResponseBody
	public PurchaseOrderRequestTO  getRequestDataForPurchaseOrder(@ModelAttribute("companyId")Long companyId) {
		logger.info("Welcome PurchaseOrderController! getRequestDataForPurchaseOrder...."+companyId);
		return purchaseOrderBO.prepareDataForPurchaseOrder(companyId);
	}
	
	@RequestMapping(value = "/getAllItemBatch", method = RequestMethod.GET)
	@ResponseBody
	public List<ItemStockRegisterTO> getAllItemBatch(@RequestParam String itemId,@RequestParam String stockPointId) {
		return purchaseOrderBO.getAllItemBatch(itemId,stockPointId);
	}
	
	
			
	@RequestMapping(value = "/saveTransaction", method = RequestMethod.POST)
	@ResponseBody
	public String saveTransaction(@RequestBody String transactionTO1) throws Exception{
		
		
		
		logger.info("Welcome saveTransaction!");
		
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
			
			logger.info("Welcome saveTransaction! getPrice1===="+itemTransactionTO.getPrice1());
			logger.info("Welcome saveTransaction! getPrice2===="+itemTransactionTO.getPrice2());
			logger.info("Welcome saveTransaction! getAmount1===="+itemTransactionTO.getAmount1());
			logger.info("Welcome saveTransaction! getAmount2===="+itemTransactionTO.getAmount2());
			
			
			logger.info("Welcome saveTransaction! getTotalAmount===="+itemTransactionTO.getTotalAmount());
			logger.info("Welcome saveTransaction! getFirmID===="+itemTransactionTO.getFirmID());
			logger.info("Welcome saveTransaction! getFirmName===="+itemTransactionTO.getFirmName());
			logger.info("Welcome saveTransaction! getNewItemBatchInd===="+itemTransactionTO.getNewItemBatchInd());
			
			logger.info("Welcome saveTransaction! getStockPointId===="+itemTransactionTO.getStockPointId());
			logger.info("Welcome saveTransaction! getStockPointName===="+itemTransactionTO.getStockPointName());
			logger.info("Welcome saveTransaction! getCompanyId===="+itemTransactionTO.getCompanyId());
			
			logger.info("Welcome saveTransaction! getNewItemBatchInd===="+itemTransactionTO.getNewItemBatchInd());
		}
		
		purchaseOrderBO.storePurchaseOrder(transactionTO);
		
		return "purchaseOrderTxnSuccess";
	}
	
	
	
	public static void main(String[] args) throws Exception {
		ApplicationContext ax=new ClassPathXmlApplicationContext("classpath:*META-INF/spring/applicationcontext-datasoure.xml");
		PurchaseOrderBO purchaseOrderBO = ax.getBean("purchaseOrderBO",PurchaseOrderBO.class);
		try{
				/*System.out.println(purchaseOrderBO.prepareDataForPurchaseOrder().getFirmList());
				System.out.println(purchaseOrderBO.prepareDataForPurchaseOrder().getItemMasterLedgerList());
				System.out.println(purchaseOrderBO.prepareDataForPurchaseOrder().getPartyList());
				System.out.println(purchaseOrderBO.prepareDataForPurchaseOrder().getItemStockRegisterList());
				System.out.println(purchaseOrderBO.prepareDataForPurchaseOrder().getStockPointList());*/
			}catch(DataAccessException ex){
			System.out.println(ex.getMessage());
		}
		
		try{
			
			TransactionTO transactionInputTO = new TransactionTO();
			
			transactionInputTO.setBookID("FY2013-14");
			transactionInputTO.setTransactionType("PURCHASE");
			transactionInputTO.setTransactionDate("2014-11-01 19:48:53");
			transactionInputTO.setLedgerID("PY7");
			transactionInputTO.setLedgerName("BASAVAPPA");
			transactionInputTO.setPaymentMode("CREDIT");
			transactionInputTO.setTotalAmount(50000);
			transactionInputTO.setSlipNo("s4");
			
			
			ItemTransactionTO itemTransactionTO = new ItemTransactionTO();
			itemTransactionTO.setBookID("FY2013-14");
			itemTransactionTO.setItemID("IT1");
			itemTransactionTO.setItemName("10 KG Karipuli");
			itemTransactionTO.setItemBatchID("IB4");
			itemTransactionTO.setItemBatchName("1040/1050");
			
			itemTransactionTO.setQuantity(10);
			itemTransactionTO.setWeight(1000);
			itemTransactionTO.setWeightDifference(0);
			
			itemTransactionTO.setPricePer(10);
			itemTransactionTO.setPrice1(200);
			itemTransactionTO.setPrice2(300);
			
			itemTransactionTO.setAmount1(20000);
			itemTransactionTO.setAmount2(30000);
			
			itemTransactionTO.setTotalAmount(50000);
			itemTransactionTO.setFirmID(1+"");
			itemTransactionTO.setFirmName("DVR");
			
			itemTransactionTO.setNewItemBatchInd("Y");
			
			itemTransactionTO.setStockPointId("SP5");
			itemTransactionTO.setStockPointName("ELR MAIN SHOP");
			
			itemTransactionTO.setCompanyId("1");
			
			ItemTransactionTO[] itemTransactionTOs = new ItemTransactionTO[1];
			itemTransactionTOs[0]=itemTransactionTO;
			
			transactionInputTO.setItemTransactionTOs(itemTransactionTOs);
			purchaseOrderBO.storePurchaseOrder(transactionInputTO);
			
		}catch(DataAccessException ex){
		System.out.println(ex.getMessage());
	}
		
	}

}
