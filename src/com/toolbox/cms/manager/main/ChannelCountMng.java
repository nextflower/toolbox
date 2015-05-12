package com.toolbox.cms.manager.main;

import net.sf.ehcache.Ehcache;

import com.toolbox.cms.entity.main.Channel;
import com.toolbox.cms.entity.main.ChannelCount;

/**
 * 栏目计数Manager接口
 * 
 * '栏目'数据存在则'栏目计数'数据必须存在。
 */
public interface ChannelCountMng {

	public int freshCacheToDB(Ehcache cache);

	public ChannelCount findById(Integer id);

	public ChannelCount save(ChannelCount count, Channel channel);

	public ChannelCount update(ChannelCount bean);
}