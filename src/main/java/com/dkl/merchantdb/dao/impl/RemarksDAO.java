package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.IRemarksDAO;
import com.dkl.merchantdb.to.RemarksTO;

@Component
public class RemarksDAO implements IRemarksDAO {
	
	private static final String CREATE_QUERY = "INSERT INTO remarks VALUES(?,?,?)";
	
	private static final String READ_QUERY = "SELECT * FROM remarks WHERE REMARKS_ID = ?";
	
	private static final String READ_ALL_QUERY = "SELECT * FROM ";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int create(RemarksTO remarksTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public RemarksTO read(Long remarksID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<RemarksTO> readAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(RemarksTO remarksTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Long remarksID) {
		// TODO Auto-generated method stub
		return 0;
	}

}
