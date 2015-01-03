package com.dkl.merchantdb.dao.intf;

public interface IsequenceGenDAO {
	long getSequenceID(String column, String table);
	String getSequenceID(String column, String table, String intitalLetters);
}
