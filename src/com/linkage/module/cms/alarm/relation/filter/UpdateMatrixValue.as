package com.linkage.module.cms.alarm.relation.filter
{
	import com.linkage.module.cms.alarm.framework.common.param.ColumnConstants;
	import com.linkage.module.cms.alarm.relation.RelationContainer;
	import com.linkage.module.cms.alarm.relation.util.RelationUtil;

	/**
	 *更新矩阵值
	 * @author mengqiang
	 *
	 */
	public class UpdateMatrixValue extends UpdateMatrix
	{
		/**
		 *矩阵告警ID
		 */
		private var matrixId:String=null;

		public function UpdateMatrixValue(key:String, alarm:Object, pAlarm:Object)
		{
			super(key, alarm, pAlarm);
		}

		override public function updateMatrixInfo(data:Object):Boolean
		{
			if (value)
			{
				data[key]=value;
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
			var alarmKey:String=key.substr(6);
			var keyArr:Array=alarmKey.split(">");
			//keyArr长度为1直接取值
			if (keyArr.length == 1)
			{
				if (pAlarm != null && pAlarm[alarmKey] != null)
				{
					value=pAlarm[alarmKey];
					matrixId=pAlarm[ColumnConstants.KEY_AlarmUniqueId];
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
				matrixId=pAlarm[ColumnConstants.KEY_AlarmUniqueId];
			}
			else if (alarm != null && alarm[filterArr[0]] == filterArr[1])
			{
				value=alarm[valueKey];
				matrixId=alarm[ColumnConstants.KEY_AlarmUniqueId];
			}
		}
	}
}