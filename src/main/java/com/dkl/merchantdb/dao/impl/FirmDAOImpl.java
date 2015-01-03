package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.FirmDAO;
import com.dkl.merchantdb.dao.mapper.FirmMapper;
import com.dkl.merchantdb.to.FirmTO;

@Repository
public class FirmDAOImpl implements FirmDAO{
	
	private static final String READ_ALL_QUERY = "select * from firm";

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int createFirm(FirmTO firmTO) {
		return 0;
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
	public void updateParty(FirmTO firmTO) {
	}

	@Override
	public void deleteParty(String partyID) {
	}
}
