package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.dkl.merchantdb.dao.impl.SequenseGenDAO;
import com.dkl.merchantdb.dao.intf.FirmDAO;
import com.dkl.merchantdb.dao.intf.IFinancialBookDAO;
import com.dkl.merchantdb.dao.intf.IItemDAO;
import com.dkl.merchantdb.dao.intf.ILedgGroupDAO;
import com.dkl.merchantdb.dao.intf.ILedgerAccountDAO;
import com.dkl.merchantdb.dao.intf.ItemLedgerDAO;
import com.dkl.merchantdb.to.FirmTO;
import com.dkl.merchantdb.to.ItemLedgerTO;
import com.dkl.merchantdb.to.ItemTO;
import com.dkl.merchantdb.to.LedgerAccountTO;
import com.dkl.merchantdb.to.LedgerGroupTO;

@Component
public class ItemBO {

	@Autowired
	private IItemDAO itemDAO;

	@Autowired
	private ILedgGroupDAO ledgerGroupDAO;

	@Autowired
	private ILedgerAccountDAO ledgerAccountDAO;

	@Autowired
	private ItemLedgerDAO itemLedgerDAO;

	@Autowired
	private FirmDAO firmDAO;

	@Autowired
	private IFinancialBookDAO financialBookDAO;

	@Autowired
	private SequenseGenDAO sequenseGenDAO;

	@Transactional(rollbackFor = Exception.class)
	public int createItem(ItemTO itemTO) {
		int noOfRowsInserted = 0;
		itemTO.setItemId(sequenseGenDAO.getSequenceID("ITEM_ID", "ITEM_MASTER", "IT"));
		noOfRowsInserted += itemDAO.createItem(itemTO);
		List<LedgerGroupTO> ledgerGroupList = ledgerGroupDAO.readAll(itemTO.getCompanyId());
		List<FirmTO> firmsList = firmDAO.readAllFirmsByFK(itemTO.getCompanyId());
		String latestFinYear = financialBookDAO.getMaxFinYear(itemTO.getCompanyId());
		if(CollectionUtils.isEmpty(ledgerGroupList)){
			throw new EmptyResultDataAccessException(1);
		}
		for (LedgerGroupTO ledgerGroupTO : ledgerGroupList) {
			ItemLedgerTO itemLedgerTO = new ItemLedgerTO();
			itemLedgerTO.setCompanyID(Long.toString(itemTO.getCompanyId()));
			itemLedgerTO.setItemID(itemTO.getItemId());
			itemLedgerTO.setItemLedgerID(itemTO.getItemId() + ledgerGroupTO.getLedgGroupID());
			itemLedgerTO.setItemLedgerName(itemTO.getItemName() + " " + ledgerGroupTO.getLedgGroupName());
			itemLedgerTO.setLedgerGroupName(ledgerGroupTO.getLedgGroupName());
			noOfRowsInserted += itemLedgerDAO.createItemLedgerRecord(itemLedgerTO);
			if(CollectionUtils.isEmpty(firmsList)){
				throw new EmptyResultDataAccessException(1);
			}
			for (FirmTO firmTO : firmsList) {
				LedgerAccountTO ledgerAccountTO = new LedgerAccountTO();
				ledgerAccountTO.setBookID(latestFinYear);
				ledgerAccountTO.setLedgerAccountID(itemLedgerTO.getItemLedgerID());
				ledgerAccountTO.setLedgerAccountName(itemLedgerTO.getItemLedgerName());
				ledgerAccountTO.setLedgerGroupID(ledgerGroupTO.getLedgGroupID());
				ledgerAccountTO.setLedgerGroupName(ledgerGroupTO.getLedgGroupName());
				ledgerAccountTO.setLedgerGroupType(ledgerGroupTO.getLedgGroupType());
				ledgerAccountTO.setFirmID(firmTO.getFirmID());
				ledgerAccountTO.setFirmName(firmTO.getFirmName());
				noOfRowsInserted += ledgerAccountDAO.createLedgerAccountRecord(ledgerAccountTO);
			}

		}
		return noOfRowsInserted;
	}

	public List<ItemTO> readAllByFk(Long companyId) {
		System.out.println("BO:" + companyId);
		return itemDAO.readAllByFK(companyId);
	}

	public int update(ItemTO itemTO) {
		return itemDAO.updateItem(itemTO);
	}

	@Transactional
	public int delete(String itemId) {
		int noOfRowsDeleted = 0;
		noOfRowsDeleted += ledgerAccountDAO.deleteLedgerAccountRecord(itemId);
		noOfRowsDeleted += itemLedgerDAO.deleteItemLedgerRecord(itemId);
		noOfRowsDeleted += itemDAO.deleteItem(itemId);
		return noOfRowsDeleted;
	}
}
