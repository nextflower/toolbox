package com.toolbox.cms.manager.assist.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.toolbox.common.hibernate3.Updater;
import com.toolbox.common.page.Pagination;
import com.toolbox.cms.dao.assist.CmsScoreItemDao;
import com.toolbox.cms.entity.assist.CmsScoreItem;
import com.toolbox.cms.manager.assist.CmsScoreItemMng;

@Service
@Transactional
public class CmsScoreItemMngImpl implements CmsScoreItemMng {
	@Transactional(readOnly = true)
	public Pagination getPage(Integer groupId,int pageNo, int pageSize) {
		Pagination page = dao.getPage(groupId,pageNo, pageSize);
		return page;
	}

	@Transactional(readOnly = true)
	public CmsScoreItem findById(Integer id) {
		CmsScoreItem entity = dao.findById(id);
		return entity;
	}

	public CmsScoreItem save(CmsScoreItem bean) {
		dao.save(bean);
		return bean;
	}

	public CmsScoreItem update(CmsScoreItem bean) {
		Updater<CmsScoreItem> updater = new Updater<CmsScoreItem>(bean);
		bean = dao.updateByUpdater(updater);
		return bean;
	}

	public CmsScoreItem deleteById(Integer id) {
		CmsScoreItem bean = dao.deleteById(id);
		return bean;
	}
	
	public CmsScoreItem[] deleteByIds(Integer[] ids) {
		CmsScoreItem[] beans = new CmsScoreItem[ids.length];
		for (int i = 0,len = ids.length; i < len; i++) {
			beans[i] = deleteById(ids[i]);
		}
		return beans;
	}

	private CmsScoreItemDao dao;

	@Autowired
	public void setDao(CmsScoreItemDao dao) {
		this.dao = dao;
	}
}