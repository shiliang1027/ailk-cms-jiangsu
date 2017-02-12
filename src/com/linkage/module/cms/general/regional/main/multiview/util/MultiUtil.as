package com.linkage.module.cms.general.regional.main.multiview.util
{
	import com.adobe.serialization.json.JSON;
	import com.linkage.module.cms.alarm.framework.common.param.ColumnConstants;
	import com.linkage.module.cms.general.regional.main.multiview.param.MultiContainer;

	/**
	 *多维工具类
	 * @author mengqiang
	 *
	 */
	public class MultiUtil
	{
		/**
		 *字符串转换为JSON对象
		 * @param str 字符串
		 * @return JSON对象
		 *
		 */
		public static function jsonDecode(str:String):Object
		{
			return JSON.decode(str.replace(/\'/g, "\""));
		}

		/**
		 *获取告警等级颜色
		 * @param label 告警等级标签
		 * @return
		 *
		 */
		public static function getAlarmSeverityColor(label:String):uint
		{
			var result:uint=0xffffff;
			switch (label)
			{
				case MultiContainer.PARAMKEY_LEVEL1_LABEL:
					result=MultiContainer.PARAMKEY_LEVEL1_COLOR;
					break;
				case MultiContainer.PARAMKEY_LEVEL2_LABEL:
					result=MultiContainer.PARAMKEY_LEVEL2_COLOR;
					break;
				case MultiContainer.PARAMKEY_LEVEL3_LABEL:
					result=MultiContainer.PARAMKEY_LEVEL3_COLOR;
					break;
				case MultiContainer.PARAMKEY_LEVEL4_LABEL:
				default:
					result=MultiContainer.PARAMKEY_LEVEL4_COLOR;
			}
			return result;
		}

		/**
		 * 验证是否是设备告警
		 * @return
		 *
		 */
		public static function checkDevAlarm():String
		{
			return ColumnConstants.KEY_NmsAlarmType + "=1";
		}

		/**
		 * 验证是否是性能告警
		 * @return
		 *
		 */
		public static function checkProAlarm():String
		{
			return ColumnConstants.KEY_NmsAlarmType + "=2";
		}
	}
}