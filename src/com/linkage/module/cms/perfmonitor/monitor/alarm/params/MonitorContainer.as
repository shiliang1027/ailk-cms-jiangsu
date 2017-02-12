package com.linkage.module.cms.perfmonitor.monitor.alarm.params
{

	public class MonitorContainer
	{
		/**
		 * 参数KEY: 本地调试
		 */
		public static const PARAMKEY_LOCAL:String="local";
		/**
		 * 参数KEY: 传入参数信息
		 */
		public static const PARAMKEY_MAPINFO:String="mapInfo";
		/**
		 * 参数KEY: 上下文路径
		 */
		public static const PARAMKEY_CONTEXT:String="context";
		/**
		 * 参数KEY: 统计展示列
		 */
		public static const PARAMKEY_STATCOLUMNS:String="statColumns";
		/**
		 * 参数KEY: 设备性能菜单
		 */
		public static const PARAMKEY_DEVPREFMENU:String="devPerfMenu";
		/**
		 * 参数KEY: 业务性能菜单
		 */
		public static const PARAMKEY_SERVPREFMENU:String="servPerfMenu";
		/**
		 * 参数KEY: 属地名称和ID映射
		 */
		public static const PARAMKEY_CITYIDOBJECT:String="cityJson";
		/**
		 * 参数KEY: 设备性能
		 */
		public static const PARAMKEY_DEVPREF:String="devPref";
		/**
		 * 参数KEY: 业务性能
		 */
		public static const PARAMKEY_SERVPREF:String="servPref";
		/**
		 * 参数KEY: 专题监控
		 */
		public static const PARAMKEY_SUBMONITOR:String="subMonitor";
		/**
		 * 展示列: ID
		 */
		public static const PARAMKEY_ID:String="id";
		/**
		 * 展示列: 名称
		 */
		public static const PARAMKEY_NAME:String="name";
		/**
		 * 展示列: 告警等级1
		 */
		public static const PARAMKEY_LEVEL1:String="level1";
		/**
		 * 展示列: 告警等级2
		 */
		public static const PARAMKEY_LEVEL2:String="level2";
		/**
		 * 展示列: 指标超标
		 */
		public static const PARAMKEY_TOTAL:String="total";
		/**
		 *设备性能windowKey
		 */
		public static const PARAMKEY_DEVICEPMFLOWALARM:String="devicepmflowalarm";
		/**
		 *设备性能windowKey
		 */
		public static const PARAMKEY_DEVICEPMFLOWRULE:String="nmsalarmtype=3&alarmlogicclass=\"综合监控_设备性能告警\"";
		/**
		 *业务性能windowKey
		 */
		public static const PARAMKEY_BUSSPMFLOWALARM:String="busspmflowalarm";
		/**
		 *业务性能windowKey
		 */
		public static const PARAMKEY_BUSSPMFLOWRULE:String="nmsalarmtype=3&alarmlogicclass=\"综合监控_业务性能告警\"";
		/**
		 *专题监控windowKey
		 */
		public static const PARAMKEY_SPECMONITORFLOWALARM:String="specmonitorflowalarm";
		/**
		 *专题监控windowKey
		 */
		public static const PARAMKEY_SPECMONITORFLOWRULE:String="nmsalarmtype=3&alarmlogicclass=\"综合监控_专题监控告警\"";
	}
}