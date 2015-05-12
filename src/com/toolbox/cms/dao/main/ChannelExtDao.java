package com.toolbox.cms.dao.main;

import com.toolbox.cms.entity.main.ChannelExt;
import com.toolbox.common.hibernate3.Updater;

public interface ChannelExtDao {
	public ChannelExt save(ChannelExt bean);

	public ChannelExt updateByUpdater(Updater<ChannelExt> updater);
}