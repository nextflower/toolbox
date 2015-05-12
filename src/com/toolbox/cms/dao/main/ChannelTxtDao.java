package com.toolbox.cms.dao.main;

import com.toolbox.cms.entity.main.ChannelTxt;
import com.toolbox.common.hibernate3.Updater;

public interface ChannelTxtDao {
	public ChannelTxt findById(Integer id);

	public ChannelTxt save(ChannelTxt bean);

	public ChannelTxt updateByUpdater(Updater<ChannelTxt> updater);
}