package com.toolbox.core.dao;

import com.toolbox.common.hibernate3.Updater;
import com.toolbox.core.entity.DbFile;

public interface DbFileDao {
	public DbFile findById(String id);

	public DbFile save(DbFile bean);

	public DbFile updateByUpdater(Updater<DbFile> updater);

	public DbFile deleteById(String id);
}