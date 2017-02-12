package com.linkage.module.cms.groupclientalarm.relation.filter
{
	import com.linkage.module.cms.alarm.framework.common.param.ColumnConstants;
	import com.linkage.module.cms.groupclientalarm.relation.util.RelationUtil;


	/**
	 *更新矩阵统计
	 * @author mengqiang
	 *
	 */
	public class UpdateMatrixSubject extends UpdateMatrix
	{
		/**
		 *告警等级
		 */
		protected var level:String=null;

		public function UpdateMatrixSubject(key:String, alarm:Object, pAlarm:Object)
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
			var alarmKey:String=key.substr(8);
			var keyArr:Array=alarmKey.split("/");
			//keyArr长度不对返回
			if (keyArr == null || keyArr.length != 2)
			{
				return;
			}
			//匹配到值值为1
			if (alarm != null && alarm[keyArr[0]] == keyArr[1])
			{
				value="1";
				level=alarm[ColumnConstants.KEY_AlarmSeverity];
			}
		}
	}
}