package com.linkage.module.cms.alarm.relation.filter
{
	import com.linkage.module.cms.alarm.framework.common.param.ColumnConstants;
	import com.linkage.module.cms.alarm.relation.RelationContainer;
	import com.linkage.module.cms.alarm.relation.util.RelationUtil;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;

	public class UpdateMatrixOutBTS extends UpdateMatrix
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.alarm.relation.filter.UpdateMatrixOutBTS");
		/**
		 *告警等级
		 */
		protected var level:String=null;

		/**
		 *更新矩阵BTS
		 * @mengqiang
		 */
		public function UpdateMatrixOutBTS(key:String, alarm:Object, pAlarm:Object)
		{
			super(key, alarm, pAlarm);
		}

		override public function updateMatrixInfo(data:Object):Boolean
		{
			if (value)
			{
				data[key]=int(data[key]) + int(value);
				data[key + "_level"]=RelationUtil.maxAlarmLevel(data[key + "_level"], level);
			}
			return true;
		}

		//初始化key对应的值
		override public function initValue(alarm:Object, pAlarm:Object):void
		{
			//key为空返回
			if (RelationUtil.checkValueNull(key))
			{
				return;
			}
			var alarmKey:String=key.substr(7);
			//匹配到值值为1
			if (pAlarm != null && (pAlarm[alarmKey] == RelationContainer.Alarm_Column_OutBtsValue1 || pAlarm[alarmKey] == RelationContainer.Alarm_Column_OutBtsValue2))
			{
				value="1";
				level=pAlarm[ColumnConstants.KEY_AlarmSeverity];
			}
			//匹配到值值为1
			if (alarm != null && (alarm[alarmKey] == RelationContainer.Alarm_Column_OutBtsValue1 || alarm[alarmKey] == RelationContainer.Alarm_Column_OutBtsValue2))
			{
				value=(value == "1") ? "2" : "1";
				var cLevel:String=alarm[ColumnConstants.KEY_AlarmSeverity];
				level=String(RelationUtil.maxAlarmLevel(cLevel, level));
			}
		}
	}
}