package com.toolbox.cms.statistic;

import java.util.Map;

import com.toolbox.cms.statistic.CmsStatistic.TimeRange;

public interface CmsStatisticDao {
	public long memberStatistic(TimeRange timeRange);

	public long contentStatistic(TimeRange timeRange,
			Map<String, Object> restrictions);

	public long commentStatistic(TimeRange timeRange,
			Map<String, Object> restrictions);

	public long guestbookStatistic(TimeRange timeRange,
			Map<String, Object> restrictions);
}
