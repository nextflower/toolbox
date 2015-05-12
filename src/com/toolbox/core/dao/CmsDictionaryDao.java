package com.toolbox.core.dao;

import java.util.List;

import com.toolbox.common.hibernate3.Updater;
import com.toolbox.common.page.Pagination;
import com.toolbox.core.entity.CmsDictionary;

public interface CmsDictionaryDao {
	public Pagination getPage(String queryType,int pageNo, int pageSize);
	
	public List<CmsDictionary> getList(String type);
	
	public List<String> getTypeList();

	public CmsDictionary findById(Integer id);
	
	public CmsDictionary findByValue(String type,String value);

	public CmsDictionary save(CmsDictionary bean);

	public CmsDictionary updateByUpdater(Updater<CmsDictionary> updater);

	public CmsDictionary deleteById(Integer id);

	public int countByValue(String value, String type);
}