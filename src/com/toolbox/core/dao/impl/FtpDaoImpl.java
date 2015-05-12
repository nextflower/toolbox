package com.toolbox.core.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.toolbox.common.hibernate3.HibernateBaseDao;
import com.toolbox.core.dao.FtpDao;
import com.toolbox.core.entity.Ftp;

@Repository
public class FtpDaoImpl extends HibernateBaseDao<Ftp, Integer> implements
		FtpDao {
	@SuppressWarnings("unchecked")
	public List<Ftp> getList() {
		String hql = "from Ftp bean";
		return find(hql);
	}

	public Ftp findById(Integer id) {
		Ftp entity = get(id);
		return entity;
	}

	public Ftp save(Ftp bean) {
		getSession().save(bean);
		return bean;
	}

	public Ftp deleteById(Integer id) {
		Ftp entity = super.get(id);
		if (entity != null) {
			getSession().delete(entity);
		}
		return entity;
	}

	@Override
	protected Class<Ftp> getEntityClass() {
		return Ftp.class;
	}
}