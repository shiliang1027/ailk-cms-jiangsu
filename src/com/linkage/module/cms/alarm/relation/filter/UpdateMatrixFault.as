package com.linkage.module.cms.alarm.relation.filter
{
	import com.linkage.module.cms.alarm.relation.RelationContainer;
	import com.linkage.module.cms.alarm.relation.util.RelationUtil;

	/**
	 *故障根源
	 * @author mengqiang
	 *
	 */
	public class UpdateMatrixFault extends UpdateMatrix
	{
		//大面积基站退服值
		private var btsOutValue:String=null;

		//大面积基站退服告警
		//如果有一次下电、市电有无、直流欠压的告警，故障根源就加一个“停电”
		//如果有传输中断，故障根源就加一个“传输中断”
		//或则就加一个“无线” 上述上个原因不能重复
		//非大面积基站退服告警
		//如果有一次下电、市电有无、直流欠压的告警，故障根源就为：停电
		//如果有传输中断，故障根源就就为：传输中断
		//或则就就为：无线
		public function UpdateMatrixFault(key:String, alarm:Object, pAlarm:Object)
		{
			super(key, alarm, pAlarm);
		}

		override public function updateMatrixInfo(data:Object):Boolean
		{
			//是否是大面积基站退服
			if (RelationUtil.checkIsBigBtsOut(data))
			{
				if (data[key] == null)
				{
					data[key]=btsOutValue;
				}
				else if (!RelationUtil.checkIsHave(data[key], btsOutValue))
				{
					data[key]+="," + btsOutValue;
				}
				return true;
			}
			//其他专题告警
			if (value && data[key] != RelationContainer.stopPower)
			{
				if (value == RelationContainer.stopPower || value == RelationContainer.tranAlarm || data[key] == null)
				{
					data[key]=value;
				}
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
			var alarmKey:String=key.substr(12);
			//匹配到值值为1
			if (alarm != null)
			{
				var alarmContent:String=alarm[alarmKey];
				if (alarmContent == RelationContainer.powerCut1 || alarmContent == RelationContainer.powerCut2 || alarmContent == RelationContainer.powerCut3)
				{
					value=RelationContainer.stopPower;
					btsOutValue=RelationContainer.stopPower;
				}
				else if (alarmContent == RelationContainer.tranAlarm)
				{
					value=RelationContainer.tranAlarm;
					btsOutValue=RelationContainer.alarmTran;
				}
				else
				{
					value=RelationContainer.wireLess;
					btsOutValue=RelationContainer.wireLess;
				}
			}
		}
	}
}