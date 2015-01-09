package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.IRemarksDAO;
import com.dkl.merchantdb.dao.mapper.RemarksMapper;
import com.dkl.merchantdb.to.RemarksTO;

@Repository
public class RemarksDAO implements IRemarksDAO {
	
	private static final String CREATE_QUERY = "INSERT INTO remarks VALUES(?,?,?,sysdate(),null)";
	
	private static final String READ_ALL_QUERY = "SELECT * FROM remarks where company_id = ?";
	
	private static final String UPDATE_QUERY = "update remarks set remark = ?,modified_date=sysdate()  where remarks_id = ? and company_id = ?";
	
	private static final String DELETE_QUERY = "delete from remarks where remarks_id = ?";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int create(RemarksTO remarksTO) {
		return jdbcTemplate.update(CREATE_QUERY, remarksTO.getCompanyID(),remarksTO.getRemarksID(),remarksTO.getRemarks());
	}

	@Override
	public List<RemarksTO> readAllByFK(Long companyId) {
		return jdbcTemplate.query(READ_ALL_QUERY, new RemarksMapper(),companyId);
	}

	@Override
	public int update(RemarksTO remarksTO) {
		return jdbcTemplate.update(UPDATE_QUERY, remarksTO.getRemarks(),remarksTO.getRemarksID(),remarksTO.getCompanyID());
	}

	@Override
	public int delete(String remarksID) {
		return jdbcTemplate.update(DELETE_QUERY, remarksID);
	}

}
