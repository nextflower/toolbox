package com.toolbox.cms.dao.main.impl;

import org.springframework.stereotype.Repository;

import com.toolbox.cms.dao.main.ContentExtDao;
import com.toolbox.cms.entity.main.ContentExt;
import com.toolbox.common.hibernate3.HibernateBaseDao;

@Repository
public class ContentExtDaoImpl extends HibernateBaseDao<ContentExt, Integer>
		implements ContentExtDao {
	public ContentExt findById(Integer id) {
		ContentExt entity = get(id);
		return entity;
	}

	public ContentExt save(ContentExt bean) {
		getSession().save(bean);
		return bean;
	}

	@Override
	protected Class<ContentExt> getEntityClass() {
		return ContentExt.class;
	}
}