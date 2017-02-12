package com.linkage.module.cms.alarm.countflow.param
{

	public class StatContainer
	{
		/**
		 * 参数KEY: 本地调试
		 */
		public static const PARAMKEY_LOCAL:String = "local";
		/**
		 * 参数KEY: 传入参数信息
		 */
		public static const PARAMKEY_MAPINFO:String = "mapInfo";
		/**
		 * 参数KEY: 上下文路径
		 */
		public static const PARAMKEY_CONTEXT:String = "context";
		/**
		 * 参数KEY: ID
		 */
		public static const PARAMKEY_ID:String = "id";
		/**
		 * 参数KEY: 专业ID
		 */
		public static const PARAMKEY_SPECID:String = "spec_id";
		/**
		 * 参数KEY: 子专业名称
		 */
		public static const PARAMKEY_SUBSPECNAME:String = "totalspecialname";
		/**
		 * 参数KEY: 专业名称
		 */
		public static const PARAMKEY_SPECNAME:String = "spec_name";
		/**
		 * 参数KEY: 规则内容
		 */
		public static const PARAMKEY_RULECONTEXT:String = "rule_context";
		/**
		 * 参数KEY: 告警统计列
		 */
		public static const PARAMKEY_WARNCOLUMNS:String = "warnColumns";
		/**
		 * 参数KEY: 告警统计列
		 */
		public static const PARAMKEY_WARNCOLUMNS_NEW:String = "warnColumnsNew";
		/**
		 * 参数KEY: 工单统计列
		 */
		public static const PARAMKEY_SHEETCOLUMNS:String = "sheetColumns";
		/**
		 * 参数KEY: 关联告警统计列
		 */
		public static const PARAMKEY_RELATIONCOLUMNS:String = "relationColumns";
		/**
		 * 参数KEY: 地市一级告警统计列
		 */
		public static const PARAMKEY_CITYALARMCOLUMNS:String = "cityAlarmColumns";
		/**
		 * 统计列KEY:一级设备告警
		 */
		public static const PARAMKEY_STATONEEQUIPMENTALARM:String = "oneequipmentalarm";
		/**
		 * 统计列KEY:一级性能告警
		 */
		public static const PARAMKEY_STATONECAPABILITYALARM:String = "onecapabilityalarm";
		/**
		 * KEY: 告警发现时间
		 */
		public static const KEY_DalTime:String = "daltime";
		/**
		 * 统计列KEY:影响客户数
		 */
		public static const PARAMKEY_STATEFFECTUSER:String = "effectuser";
		/**
		 * 统计列KEY:派单数
		 */
		public static const PARAMKEY_STATDISPATCH:String = "dispatch";
		/**
		 * 统计列KEY:在处理工单数
		 */
		public static const PARAMKEY_STATPROCESS:String = "process";
		/**
		 * 统计列KEY:超时工单数
		 */
		public static const PARAMKEY_STATOVERTIME:String = "overtime";
		/**
		 * 统计列KEY:关联前告警数
		 */
		public static const PARAMKEY_STATBNUM:String = "bnum";
		/**
		 * 统计列KEY:关联后告警数
		 */
		public static const PARAMKEY_STATANUM:String = "anum";
		/**
		 * 统计列KEY:工程抑制派单数
		 */
		public static const PARAMKEY_STATPYNUM:String = "pynum";
		/**
		 * 统计列KEY:等待派单数
		 */
		public static const PARAMKEY_STATWAITNUM:String = "waitnum";
		/**
		 * 统计列KEY:关联派单数
		 */
		public static const PARAMKEY_STATSENDNUM:String = "sendnum";
		/**
		 * 统计列KEY:关联告警解决数
		 */
		public static const PARAMKEY_STATCANCELNUM:String = "cancelnum";
		/**
		 * 统计用到的key: 集客告警moduleKey
		 */
		public static const MODULEKEY_AFGMALARM:String = "afgmalarm";
		/**
		 * 统计用到的key: 故障预判moduleKey
		 */
		public static const MODULEKEY_AFFPALARM:String = "affpalarm";
		/**
		 * 统计用到的key: 基站跨专业moduleKey
		 */
		public static const MODULEKEY_AFBTSALARM:String = "afbtsalarm";
		/**
		 * 统计趋势图类型:一级设备告警
		 */
		public static const STATLINETYPE_LEVEL1:String = "1";
		/**
		 * 统计趋势图类型:所有等级设备告警
		 */
		public static const STATLINETYPE_ALL:String = "2";
		/**
		 * 统计趋势图类型:派单数
		 */
		public static const STATLINETYPE_SENDNUM:String = "3";
		/**
		 * 统计趋势图类型:关联后告警数
		 */
		public static const STATLINETYPE_RELATIONNUM:String = "4";
		/**
		 * 工单统计详情页面
		 */
		public static const SHEETTOTAL_DETAILURL:String = "http://10.40.9.225:9081/eoms4/LogonServlet?u=lianchuang&p=123456Lc!&url=/eoms4/tBnsFaultTaskAction!centerHandle2.ilf?formNo=";

		/**
		 * 原始告警数
		 */
		public static const NUM_TOTAL_ALARM:String = "num_total_alarm";
		/**
		 * 标准化告警数
		 */
		public static const NUM_STANDARD_ALARM:String = "num_standard_alarm";
		/**
		 * 非工程告警数
		 */
		public static const NUM_UNLOCATE_ALARM:String = "num_unlocate_alarm";
		/**
		 * 符合派单规则告警数
		 */
		public static const NUM_SHEETSEND_ALARM:String = "num_sheetsend_alarm";
		/**
		 * 符合派单延时告警数
		 */
		public static const NUM_SHEETSENDDELAY_ALARM:String = "num_sheetsenddelay_alarm";
	}
}

