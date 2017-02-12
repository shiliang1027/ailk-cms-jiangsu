package com.linkage.module.cms.general.regional.important.venue.common.util
{

	/**
	 *场景工具类
	 * @author mengqiang
	 *
	 */
	public class VenueUtil
	{
		/**
		 *获取告警等级颜色
		 * @param level 告警等级
		 * @return
		 *
		 */
		public static function alarmLevelColor(level:String):uint
		{
			if (level == '1')
			{
				return 0xFF0000;
			}
			else if (level == '2')
			{
				return 0xFFA500;

			}
			else if (level == '3')
			{
				return 0xFFFF00;

			}
			else if (level == '4')
			{
				return 0x4169E1;
			}
			return 0;
		}
	}
}