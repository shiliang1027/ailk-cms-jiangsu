package com.linkage.module.cms.alarm.relation.filter
{
	import com.linkage.module.cms.alarm.framework.common.param.ColumnConstants;
	import com.linkage.module.cms.alarm.relation.RelationContainer;
	import com.linkage.module.cms.alarm.relation.util.RelationUtil;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;

	/**
	 *更新矩阵值
	 * @author mengqiang
	 *
	 */
	public class UpdateMatrixValueh extends UpdateMatrix
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.alarm.relation.core.UpdateMatrixValueh");
		/**
		 *告警等级
		 */
		protected var level:String=null;
		/**
		 *矩阵告警ID
		 */
		private var matrixId:String=null;

		public function UpdateMatrixValueh(key:String, alarm:Object, pAlarm:Object)
		{
			super(key, alarm, pAlarm);
		}

		override public function updateMatrixInfo(data:Object):Boolean
		{

			log.warn(matrixId + "," + data[RelationContainer.MATRIXALARMID] + "," + key + "," + RelationUtil.compAlarmLevel(level, data["value_level"]) + "," + level + "," + data["value_level"] + "," + value);
			if (RelationUtil.compAlarmLevel(level, data["value_level"]) || data[RelationContainer.MATRIXALARMID] == matrixId)
			{
				data[key]=value;
				data["value_level"]=level;
				data[RelationContainer.MATRIXALARMID]=matrixId;
			}
			return true;
		}

		//初始化key对应的值
		override public function initValue(alarm:Object, pAlarm:Object):void
		{
			//key为空返回value=nename>specialty/2
			if (RelationUtil.checkValueNull(key))
			{
				return;
			}
			var cLevel:String=null;
			var alarmKey:String=key.substr(7);
			var keyArr:Array=alarmKey.split(">");
			//keyArr长度为1直接取值
			if (keyArr.length == 1)
			{
				if (pAlarm != null)
				{
					value=pAlarm[alarmKey];
					level=pAlarm[ColumnConstants.KEY_AlarmSeverity];
					matrixId=pAlarm[ColumnConstants.KEY_AlarmUniqueId];
				}
				if (alarm != null)
				{
					cLevel=alarm[ColumnConstants.KEY_AlarmSeverity];
					if (RelationUtil.compAlarmLevel(cLevel, level))
					{
						value=alarm[alarmKey];
						level=cLevel;
						matrixId=alarm[ColumnConstants.KEY_AlarmUniqueId];
					}
				}
				return;
			}
			var valueKey:String=keyArr[0];
			var filterArr:Array=keyArr[1].split("/");
			//keyArr长度不对返回
			if (filterArr == null || filterArr.length != 2)
			{
				return;
			}
			//匹配到直接赋值
			if (pAlarm != null && pAlarm[filterArr[0]] == filterArr[1])
			{
				value=pAlarm[valueKey];
				level=pAlarm[ColumnConstants.KEY_AlarmSeverity];
				matrixId=pAlarm[ColumnConstants.KEY_AlarmUniqueId];
			}
			if (alarm != null && alarm[filterArr[0]] == filterArr[1])
			{
				cLevel=alarm[ColumnConstants.KEY_AlarmSeverity];
				if (RelationUtil.compAlarmLevel(cLevel, level))
				{
					value=alarm[valueKey];
					level=cLevel;
					matrixId=alarm[ColumnConstants.KEY_AlarmUniqueId];
				}
			}
		}
	}
}