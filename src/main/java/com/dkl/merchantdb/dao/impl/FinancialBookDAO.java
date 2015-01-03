package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.IFinancialBookDAO;
import com.dkl.merchantdb.dao.mapper.FinancialBookMapper;
import com.dkl.merchantdb.to.FinancialBookTO;

@Repository
public class FinancialBookDAO implements IFinancialBookDAO {

	private static final String READ_ALL_BY_FK_QUERY = "SELECT * FROM FIN_BOOK WHERE COMPANY_ID = ?";

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<FinancialBookTO> readAllByFk(Long companyId) {
		return jdbcTemplate.query(READ_ALL_BY_FK_QUERY, new FinancialBookMapper(), companyId);
	}

}
