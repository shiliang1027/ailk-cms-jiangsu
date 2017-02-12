package com.linkage.module.cms.groupclientalarm.relation.filter
{
	import com.linkage.module.cms.alarm.framework.common.param.ColumnConstants;
	import com.linkage.module.cms.groupclientalarm.relation.util.RelationUtil;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;

	public class UpdateMatrixMainAlarm extends UpdateMatrix
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.alarm.relation.filter.UpdateMatrixMainAlarm");
		/**
		 *告警等级
		 */
		protected var level:String=null;

		/**
		 *更新矩阵BTS
		 * @mengqiang
		 */
		public function UpdateMatrixMainAlarm(key:String, alarm:Object, pAlarm:Object)
		{
			super(key, alarm, pAlarm);
		}

		override public function updateMatrixInfo(data:Object):Boolean
		{
			if (value)
			{
				data[key]=value;
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
			//匹配到值值为1
			if (pAlarm != null)
			{
				value="1";
				level=pAlarm[ColumnConstants.KEY_AlarmSeverity];
			}
		}
	}
}