package com.dkl.merchantdb.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dkl.merchantdb.dao.impl.SequenseGenDAO;
import com.dkl.merchantdb.dao.intf.IRemarksDAO;
import com.dkl.merchantdb.to.RemarksTO;

@Component
public class RemarksBO {

	@Autowired
	private IRemarksDAO remarksDAO;
	
	@Autowired
	private SequenseGenDAO sequenseGenDAO;

	public int createRemark(RemarksTO remarksTO) {
		remarksTO.setRemarksID(sequenseGenDAO.getSequenceID("REMARKS_ID", "REMARKS","RM"));
		return remarksDAO.create(remarksTO);
	}

	public List<RemarksTO> readAllByFk(Long companyId) {
		return remarksDAO.readAllByFK(companyId);
	}

	public int update(RemarksTO remarksTO) {
		return remarksDAO.update(remarksTO);
	}

	public int delete(String remarksID) {
		return remarksDAO.delete(remarksID);
	}

}
