package org.academy.service;

import java.util.List;

import org.academy.domain.Criteria;
import org.academy.domain.InqueryVO;

public interface InqueryService {
	
	public InqueryVO get(String oi_code);
	
	//public List<InqueryVO> getList();
	
    public List<InqueryVO> getList(Criteria cri);
    
    public int getTotal(Criteria cri);
}
