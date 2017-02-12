package com.linkage.module.cms.alarm.totalflow.util
{
	import com.linkage.module.cms.alarm.framework.common.param.ColumnConstants;
	import com.linkage.module.cms.alarm.totalflow.AlarmContainer;

	/**
	 *流水Util
	 * @author mengqiang
	 *
	 */
	public class TotalUtil
	{
		/**
		 *验证概况专业
		 * @param alarm
		 * @return
		 *
		 */
		public static function getGeneralSpecFilter(xIdValue:String):String
		{
			var result:String=null;
			switch (xIdValue)
			{
				case AlarmContainer.STATKEY_LOCATE_NE_NUM:
					result=ColumnConstants.KEY_LocateNeStatus + "=1";
					break;
				case AlarmContainer.STATKEY_RELATED_NUM:
					result=AlarmContainer.MODULEKEY_RELATIONALARM;
					break;
				case AlarmContainer.STATKEY_ALARM_LEVEL1:
					result=ColumnConstants.KEY_AlarmSeverity + "=1";
					break;
				case AlarmContainer.STATKEY_ALARM_LEVEL2:
					result=ColumnConstants.KEY_AlarmSeverity + "=2";
					break;
				case AlarmContainer.STATKEY_ALARM_LEVEL3:
					result=ColumnConstants.KEY_AlarmSeverity + "=3";
					break;
				case AlarmContainer.STATKEY_ALARM_LEVEL4:
					result=ColumnConstants.KEY_AlarmSeverity + "=4";
					break;
				case AlarmContainer.STATKEY_SHEET_NUM:
					result="(" + ColumnConstants.KEY_SheetSendStatus + "=5|" + ColumnConstants.KEY_SheetSendStatus + "=6)";
					break;
				case AlarmContainer.STATKEY_CUSTOMER_NUM:
					result=ColumnConstants.KEY_CustomerFlag + "=1";
					break;
				case AlarmContainer.STATKEY_SUPERSHEETNO:
					result=ColumnConstants.KEY_SheetStatus + "=9";
					break;
			}
			return result;
		}

		/**
		 *获取提示信息
		 * @param tip
		 *
		 */
		public static function getToopTipInfo(tip:String, specId:String):String
		{
			if (tip.indexOf("/") != -1)
			{
				var arr:Array=tip.split("/");
				if (specId == "2")
				{
					return "数据网管:" + arr[0] + "/WLAN网管:" + arr[1];
				}
				else if (specId == "3")
				{
					return "核心侧:" + arr[0] + "/接入和城域侧:" + arr[1];
				}
			}
			return null;
		}
	}
}