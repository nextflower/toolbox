package com.toolbox.core.manager;

import com.toolbox.core.entity.CmsSite;
import com.toolbox.core.entity.CmsSiteCompany;

public interface CmsSiteCompanyMng {
	public CmsSiteCompany save(CmsSite site,CmsSiteCompany bean);

	public CmsSiteCompany update(CmsSiteCompany bean);
}