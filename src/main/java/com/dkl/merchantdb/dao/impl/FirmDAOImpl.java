package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.FirmDAO;
import com.dkl.merchantdb.dao.mapper.FirmMapper;
import com.dkl.merchantdb.to.FirmTO;
import com.dkl.merchantdb.util.DklUtil;

@Repository
public class FirmDAOImpl implements FirmDAO {

	private static final String INSERT_QUERY = "insert into firm values(?,?,?,?,?)";

	private static final String READ_ALL_QUERY = "select * from firm ";

	private static final String READ_ALL_BY_FK = "select * from firm where company_id = ?";

	private static final String UPDATE_FIRM = "update firm set firm_name=?,modified_date=? where firm_id=?";

	private static final String DELETE_FIRM = "DELETE FROM firm WHERE firm_id = ?";

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int createFirm(FirmTO firmTO) {
		System.out.println(firmTO.getFirmID());
		return jdbcTemplate.update(
				INSERT_QUERY,
				new Object[] {firmTO.getFirmID(),
						firmTO.getFirmName(), firmTO.getCreationDate(),
						firmTO.getModifiedDate(), firmTO.getCompanyID() });
		
	}

	@Override
	public FirmTO readFirm(String firmID) {
		return null;
	}

	@Override
	public List<FirmTO> readAllFirms() {
		return jdbcTemplate.query(READ_ALL_QUERY, new FirmMapper());
	}

	@Override
	public List<FirmTO> readAllFirmsByFK(Long companyId) {
		return jdbcTemplate.query(READ_ALL_BY_FK, new Object[] { companyId },
				new FirmMapper());
	}

	@Override
	public int updateFirm(FirmTO firmTO) {
		System.out.println("HERE\n" + firmTO);
		int isUpdated;
		try {
			isUpdated = jdbcTemplate.update(UPDATE_FIRM,
					new Object[] { firmTO.getFirmName(),
							DklUtil.getTodayDate(), firmTO.getFirmID() });
		} catch (Exception e) {
			isUpdated = 0;
		}
		System.out.println("UPDATED:::" + isUpdated);
		return isUpdated;
	}

	@Override
	public int deleteFirm(String firmID) {
		return jdbcTemplate.update(DELETE_FIRM, new Object[] { firmID });
	}
}
