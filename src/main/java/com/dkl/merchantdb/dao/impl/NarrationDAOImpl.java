package com.dkl.merchantdb.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.NarrationDAO;
import com.dkl.merchantdb.dao.mapper.NarrationMapper;
import com.dkl.merchantdb.to.NarrationTO;

@Repository
public class NarrationDAOImpl implements NarrationDAO{

	private static final String GET_ALL_NARRATION = "SELECT * FROM dklf.narration";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public int createNarration(NarrationTO narrationTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<NarrationTO> readAllNarration() {
		return jdbcTemplate.query(GET_ALL_NARRATION, new NarrationMapper());
	}

}
