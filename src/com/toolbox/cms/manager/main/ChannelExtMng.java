package com.toolbox.cms.manager.main;

import com.toolbox.cms.entity.main.Channel;
import com.toolbox.cms.entity.main.ChannelExt;

public interface ChannelExtMng {
	public ChannelExt save(ChannelExt ext, Channel channel);

	public ChannelExt update(ChannelExt ext);
}