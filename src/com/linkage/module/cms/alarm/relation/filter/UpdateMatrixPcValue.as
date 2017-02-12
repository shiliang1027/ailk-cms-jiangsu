package com.linkage.module.cms.alarm.relation.filter
{
	import com.linkage.module.cms.alarm.relation.util.RelationUtil;

	/**
	 *更新矩阵值
	 * @author mengqiang
	 *
	 */
	public class UpdateMatrixPcValue extends UpdateMatrix
	{
		public function UpdateMatrixPcValue(key:String, alarm:Object, pAlarm:Object)
		{
			super(key, alarm, pAlarm);
		}

		override public function updateMatrixInfo(data:Object):Boolean
		{
			if (value)
			{
				if (RelationUtil.checkValueNull(data[key]))
				{
					data[key]=value;
				}
				else
				{
					data[key]+="," + value;
				}
			}
			return true;
		}

		//初始化key对应的值
		override public function initValue(alarm:Object, pAlarm:Object):void
		{
			//key为空返回valuepc=
			if (RelationUtil.checkValueNull(key))
			{
				return;
			}
			var alarmKey:String=key.substr(8);
			if (pAlarm != null && pAlarm[alarmKey] != null)
			{
				value=pAlarm[alarmKey];
			}
			if (alarm != null && alarm[alarmKey] != null)
			{
				if (RelationUtil.checkValueNull(value))
				{
					value=alarm[alarmKey];
				}
				else
				{
					value+="," + alarm[alarmKey];
				}
			}
		}
	}
}