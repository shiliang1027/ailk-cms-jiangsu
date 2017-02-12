package com.linkage.module.cms.alarm.relation.filter
{

	public class UpdateMatrix implements IUpdateMatrix
	{
		//key对应的值key格式：value=alarmtitle;value=nename>specialty/1;count=specialty/1;subject=alarmtitle/传输中断
		protected var key:String=null;
		//key对应的值
		protected var value:String=null;

		public function UpdateMatrix(key:String, alarm:Object, pAlarm:Object)
		{
			this.key=key;
			initValue(alarm, pAlarm);
		}

		public function updateMatrixInfo(data:Object):Boolean
		{
			throw new Error("method <updateMatrixInfo> must be implements in subclass");
		}

		//初始化key对应的值
		public function initValue(alarm:Object, pAlarm:Object):void
		{
			throw new Error("method <initValue> must be implements in subclass");
		}
	}
}