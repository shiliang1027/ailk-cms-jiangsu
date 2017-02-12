package com.linkage.module.cms.alarm.countflow.filter
{
	import com.linkage.module.cms.alarm.countflow.param.StatContainer;
	import com.linkage.module.cms.alarm.framework.common.param.ColumnConstants;

	public class StatFilter
	{
		//获取列过滤器
		public static function getColumnFilter(columnKey:String):String
		{
			var result:String=null;
			switch (columnKey)
			{
				case StatContainer.PARAMKEY_STATONEEQUIPMENTALARM: //一级设备告警
					result=ColumnConstants.KEY_AlarmSeverity + "=1&" + ColumnConstants.KEY_NmsAlarmType + "=1";
					break;
				case StatContainer.PARAMKEY_STATONECAPABILITYALARM: //一级性能告警
					result=ColumnConstants.KEY_AlarmSeverity + "=1&(" + ColumnConstants.KEY_NmsAlarmType + "=2|" + ColumnConstants.KEY_NmsAlarmType + "=3)";
					break;
				case StatContainer.PARAMKEY_STATEFFECTUSER: //影响客户数
					result=ColumnConstants.KEY_EffectUser + ">0";
					break;
				case StatContainer.PARAMKEY_STATDISPATCH: //派单数
					result="(" + ColumnConstants.KEY_SheetSendStatus + "=5|" + ColumnConstants.KEY_SheetSendStatus + "=6)";
					break;
				case StatContainer.PARAMKEY_STATPROCESS: //在处理工单数
					result="(" + ColumnConstants.KEY_SheetStatus + "=1|" + ColumnConstants.KEY_SheetStatus + "=2|" + ColumnConstants.KEY_SheetStatus + "=3|" + ColumnConstants.KEY_SheetStatus + "=4|" + ColumnConstants.KEY_SheetStatus + "=5|" + ColumnConstants.KEY_SheetStatus + "=6)";
					break;
				case StatContainer.PARAMKEY_STATOVERTIME: //超时工单数
					result=ColumnConstants.KEY_SheetStatus + "=9";
					break;
				case StatContainer.PARAMKEY_STATBNUM: //关联前告警数
				case StatContainer.PARAMKEY_STATANUM: //关联后告警数
					result="";
					break;
				case StatContainer.PARAMKEY_STATPYNUM: //工程抑制派单数
					result="";
					//result=ColumnConstants.KEY_SheetSendStatus + "=3&" + ColumnConstants.KEY_LocateNeStatus + "=1";
					break;
				case StatContainer.PARAMKEY_STATWAITNUM: //等待派单数
					result="";
					//result=ColumnConstants.KEY_SheetSendStatus + "=1";
					break;
				case StatContainer.PARAMKEY_STATSENDNUM: //关联派单数
					result="";
					//result="(" + ColumnConstants.KEY_SheetSendStatus + "=5|" + ColumnConstants.KEY_SheetSendStatus + "=6)&" + ColumnConstants.KEY_ParentFlag + "=2";
					break;
			}
			return result;
		}
	}
}