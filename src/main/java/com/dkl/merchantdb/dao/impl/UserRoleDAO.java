package com.dkl.merchantdb.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.intf.IUserRoleDAO;

@Component
public class UserRoleDAO implements IUserRoleDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	private static String READ_QUERY = "SELECT role_name from role,user_role where role.role_id=user_role.role_id and user_id=?";

	@Override
	public List<String> getUserRoles(int userId) {
		return jdbcTemplate.query(READ_QUERY, new RowMapper<String>(){
			@Override
			public String mapRow(ResultSet rs, int num) throws SQLException {
				return rs.getString(1);
			}
		},userId);
	}


}
