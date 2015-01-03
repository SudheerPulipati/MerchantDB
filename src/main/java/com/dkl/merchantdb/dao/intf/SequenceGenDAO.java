package com.dkl.merchantdb.dao.intf;

public interface SequenceGenDAO{
	
	public long getSequenceID(String column, String table);

	String getSequenceID(String column, String table, String intitalLetters);

}
