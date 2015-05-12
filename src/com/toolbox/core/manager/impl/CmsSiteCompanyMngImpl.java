package com.toolbox.core.manager.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.toolbox.common.hibernate3.Updater;
import com.toolbox.core.dao.CmsSiteCompanyDao;
import com.toolbox.core.entity.CmsSite;
import com.toolbox.core.entity.CmsSiteCompany;
import com.toolbox.core.manager.CmsSiteCompanyMng;

@Service
@Transactional
public class CmsSiteCompanyMngImpl implements CmsSiteCompanyMng {
	public CmsSiteCompany save(CmsSite site,CmsSiteCompany bean) {
		site.setSiteCompany(bean);
		bean.setSite(site);
		dao.save(bean);
		return bean;
	}

	public CmsSiteCompany update(CmsSiteCompany bean) {
		Updater<CmsSiteCompany> updater = new Updater<CmsSiteCompany>(bean);
		bean = dao.updateByUpdater(updater);
		return bean;
	}

	private CmsSiteCompanyDao dao;

	@Autowired
	public void setDao(CmsSiteCompanyDao dao) {
		this.dao = dao;
	}
}