package com.toolbox.core.dao;

import com.toolbox.common.hibernate3.Updater;
import com.toolbox.core.entity.CmsSiteCompany;

public interface CmsSiteCompanyDao {

	public CmsSiteCompany save(CmsSiteCompany bean);

	public CmsSiteCompany updateByUpdater(Updater<CmsSiteCompany> updater);
}