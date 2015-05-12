package com.toolbox.core.dao.impl;

import org.springframework.stereotype.Repository;

import com.toolbox.common.hibernate3.HibernateBaseDao;
import com.toolbox.core.dao.CmsUserResumeDao;
import com.toolbox.core.entity.CmsUserResume;

@Repository
public class CmsUserResumeDaoImpl extends HibernateBaseDao<CmsUserResume, Integer> implements CmsUserResumeDao {
	public CmsUserResume findById(Integer id) {
		CmsUserResume entity = get(id);
		return entity;
	}

	public CmsUserResume save(CmsUserResume bean) {
		getSession().save(bean);
		return bean;
	}
	
	@Override
	protected Class<CmsUserResume> getEntityClass() {
		return CmsUserResume.class;
	}
}