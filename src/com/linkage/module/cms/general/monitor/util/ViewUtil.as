package com.linkage.module.cms.general.monitor.util
{
	import com.linkage.module.cms.general.monitor.AlarmConstants;

	public class ViewUtil
	{
		/**
		 *通过对应的列KEY获取视图ID
		 * @param column 列KEY
		 * @return
		 *
		 */
		public static function getMajorEventViewColor(value:int):String
		{
			if (value > 0)
			{
				return AlarmConstants.VIEW_COLOR_RED;
			}
			return AlarmConstants.VIEW_COLOR_GREEN;
		}

		/**
		 *通过对应的列KEY获取视图ID
		 * @param column 列KEY
		 * @return
		 *
		 */
		public static function getMajorEventViewStaute(value:int):int
		{
			if (value > 0)
			{
				return 2;
			}
			return 0;
		}

		/**
		 *通过对应的列KEY获取视图ID
		 * @param column 列KEY
		 * @return
		 *
		 */
		public static function getViewIdByViewColumn(column:String):String
		{
			if (AlarmConstants.QUITBTS_GG_NUM == column)
			{
				return AlarmConstants.VIEW_LEVEL2_TYPE9;
			}
			else if (AlarmConstants.QUITBTS_TD_NUM == column)
			{
				return AlarmConstants.VIEW_LEVEL2_TYPE10;
			}
			return null;
		}

		/**
		 *通过对应的值获取视图对应的颜色值
		 * @param vlue 值
		 * @return
		 *
		 */
		public static function getViewColorByVlue(vlue:int):String
		{
			if (vlue >= 20)
			{
				return AlarmConstants.VIEW_COLOR_RED;
			}
			else if (vlue >= 10)
			{
				return AlarmConstants.VIEW_COLOR_ORANGE;
			}
			else if (vlue >= 1)
			{
				return AlarmConstants.VIEW_COLOR_YELLOW;
			}
			return AlarmConstants.VIEW_COLOR_GREEN;
		}

		/**
		 *发光状态
		 * @param vlue 值
		 * @return
		 *
		 */
		public static function shineLightStatue(vlue:int):int
		{
			if (vlue >= 20)
			{
				return 2;
			}
			else if (vlue >= 10)
			{
				return 1;
			}
			else if (vlue >= 1)
			{
				return 1;
			}
			return 0;
		}

		/**
		 *是否有次属地权限
		 * @param cityId 属地ID
		 * @param cityMap 属地权限
		 * @return
		 *
		 */
		public static function isHaveCityRole(cityId:String, cityMap:Object):Boolean
		{
			var flag:Boolean = false;
			var curCityId:String = null;
			for each (curCityId in cityMap)
			{
				if (cityId == curCityId)
				{
					flag = true;
					break;
				}
			}
			return flag;
		}

		/**
		 *是否有次专业权限
		 * @param specId 专业ID
		 * @param specArray 专业权限
		 * @return
		 *
		 */
		public static function isHaveSpecRole(specId:String, specArray:Object):Boolean
		{
			//专业为-1为有权限
			if (specId == "-1")
			{
				return true;
			}
			var flag:Boolean = false;
			var curSpec:Object = null;
			for each (curSpec in specArray)
			{
				if (curSpec["id"] == specId)
				{
					flag = true;
					break;
				}
			}
			return flag;
		}
	}
}