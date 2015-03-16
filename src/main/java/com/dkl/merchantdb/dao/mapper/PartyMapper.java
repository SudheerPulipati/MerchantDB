package com.dkl.merchantdb.dao.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.dkl.merchantdb.to.PartyTO;

public class PartyMapper implements RowMapper<PartyTO> {

	@Override
	public PartyTO mapRow(ResultSet resultSet, int row) throws SQLException {

		PartyTO partyTO = new PartyTO();
		partyTO.setPartyID(resultSet.getString("PARTY_ID"));
		partyTO.setCompanyID(resultSet.getLong("COMPANY_ID"));
		partyTO.setPartyName(resultSet.getString("PARTY_Name"));
		partyTO.setPartyType(resultSet.getString("PARTY_TYPE"));
		partyTO.setCityGroupId(resultSet.getString("CITY_GROUP_ID"));
		partyTO.setLedgerGroupId(resultSet.getString("LEDGER_GRP_ID"));
		partyTO.setStreetName(resultSet.getString("STREET_NAME"));
		partyTO.setCity(resultSet.getString("CITY"));
		partyTO.setTelephone(resultSet.getString("PHONE"));
		partyTO.setCreationDate(resultSet.getString("created_date"));
		partyTO.setModifiedDate(resultSet.getString("modified_date"));
		partyTO.setState(resultSet.getString("STATE"));
		partyTO.setPincode(resultSet.getInt("PINCODE"));
		partyTO.setEmail(resultSet.getString("EMAIL"));
		return partyTO;
	}

}
