package com.dkl.merchantdb.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.dkl.merchantdb.dao.intf.IsequenceGenDAO;

@Repository
public class SequenseGenDAO implements IsequenceGenDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public long getSequenceID(String column, String table) {
		long seqId = 1000001;
		try {
			String query = "SELECT MAX(" + table + "." + column + ") from "
					+ table;
			seqId = jdbcTemplate.queryForObject(query, Long.class);
			++seqId;
		} catch (NullPointerException exception) {
			System.out.println("Generating 1st Row..");
		}
		return seqId;
	}

	@Override
	public String getSequenceID(String column, String table,String initialLetters) {
		int pos = initialLetters.length()+1;
		String query = "select ifnull(max(CONVERT(substr("+column+","+ pos +"),UNSIGNED INTEGER))+1,1) as next_index from "+table;
		long id = jdbcTemplate.queryForObject(query, Long.class);
		return initialLetters+id;
	}
}
