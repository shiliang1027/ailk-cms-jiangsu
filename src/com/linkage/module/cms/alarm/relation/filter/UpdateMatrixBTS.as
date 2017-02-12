package com.linkage.module.cms.alarm.relation.filter
{
	import com.linkage.module.cms.alarm.framework.common.util.AlarmUtil;
	import com.linkage.module.cms.alarm.relation.util.RelationUtil;

	public class UpdateMatrixBTS extends UpdateMatrix
	{
		/**
		 *更新矩阵BTS
		 * @mengqiang
		 */
		public function UpdateMatrixBTS(key:String, alarm:Object, pAlarm:Object)
		{
			super(key, alarm, pAlarm);
		}

		override public function updateMatrixInfo(data:Object):Boolean
		{
			if (value)
			{
				data[key]=value;
			}
			return true;
		}

		//初始化key对应的值
		override public function initValue(alarm:Object, pAlarm:Object):void
		{
			//key为空返回bts=nename
			if (RelationUtil.checkValueNull(key))
			{
				return;
			}
			var alarmKey:String=key.substr(4);
			//匹配到直接赋值
			if (pAlarm != null && AlarmUtil.checkBtsType(pAlarm))
			{
				value=pAlarm[alarmKey];
			}
			else if (alarm != null && AlarmUtil.checkBtsType(alarm))
			{
				value=alarm[alarmKey];
			}
		}
	}
}