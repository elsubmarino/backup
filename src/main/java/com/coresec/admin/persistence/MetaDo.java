package com.coresec.admin.persistence;

import java.util.List;

import com.coresec.admin.domain.Meta;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.domain.SetBoard;

public interface MetaDo {
	//selectOne
	public Meta selectOne();
	
	//modify
	public void update(Meta meta);
	
	
	//new badge
	public int getBadge();
}
