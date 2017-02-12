package com.linkage.module.cms.alarm.relation.filter
{
	import com.linkage.module.cms.alarm.framework.common.param.ColumnConstants;
	import com.linkage.module.cms.alarm.relation.RelationContainer;
	import com.linkage.module.cms.alarm.relation.util.RelationUtil;


	/**
	 *更新矩阵统计
	 * @author mengqiang
	 *
	 */
	public class UpdateMatrixWireLess extends UpdateMatrix
	{
		/**
		 *告警等级
		 */
		protected var level:String=null;

		public function UpdateMatrixWireLess(key:String, alarm:Object, pAlarm:Object)
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
			var alarmKey:String=key.substr(9);
			if (alarm != null && alarm[alarmKey] != RelationContainer.wireLessTrans && alarm[alarmKey] != RelationContainer.tranAlarm && alarm[alarmKey] != RelationContainer.powerCut1 && alarm[alarmKey] != RelationContainer.powerCut2 && alarm[alarmKey] != RelationContainer.powerCut3)
			{
				value="1";
				level=alarm[ColumnConstants.KEY_AlarmSeverity];
			}
		}
	}
}