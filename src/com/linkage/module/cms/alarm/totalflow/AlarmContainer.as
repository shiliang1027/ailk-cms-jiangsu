package com.linkage.module.cms.alarm.totalflow
{

	public class AlarmContainer
	{
		/**
		 * 参数KEY: 传入参数信息
		 */
		public static const PARAMKEY_MAPINFO:String="mapInfo";
		/**
		 * 参数KEY: 上下文路径
		 */
		public static const PARAMKEY_CONTEXT:String="context";
		/**
		 * 参数KEY: 权限内属地json
		 */
		public static const PARAMKEY_CITYJSON:String="cityJson";
		/**
		 * 参数KEY: 权限内专业json
		 */
		public static const PARAMKEY_SPECJSON:String="specJson";
		/**
		 * 参数KEY: 区域XML
		 */
		public static const PARAMKEY_AREAXML:String="areaXml";
		/**
		 * 参数KEY: 功能图XML
		 */
		public static const PARAMKEY_FUNCXML:String="funcXml";
		/**
		 * 参数KEY: 省份
		 */
		public static const PARAMKEY_PROVICE:String="provice";
		/**
		 * 参数KEY: 告警过滤器
		 */
		public static const PARAMKEY_ALARMFILTER:String="alarmfilter";
		/**
		 * 参数KEY: 告警概览json
		 */
		public static const PARAMKEY_GENERAJSON:String="generaJson";
		/**
		 * 统计用到的key: 告警总数
		 */
		public static const STATKEY_ALARM_ALL:String="alarm_all";
		/**
		 * 参数KEY: 模块规则内容
		 */
		public static const PARAMKEY_RULECONTENT:String="ruleContent";
		/**
		 * 统计用到的key: 工程告警总数
		 */
		public static const STATKEY_LOCATE_NE_NUM:String="alarm_LocateNeStatus";
		/**
		 * 统计用到的key: 告警关联数
		 */
		public static const STATKEY_RELATED_NUM:String="alarm_RelatedFlag";
		/**
		 * 统计用到的key: 一级告警
		 */
		public static const STATKEY_ALARM_LEVEL1:String="alarm_level1";
		/**
		 * 统计用到的key: 二级告警
		 */
		public static const STATKEY_ALARM_LEVEL2:String="alarm_level2";
		/**
		 * 统计用到的key: 三级告警
		 */
		public static const STATKEY_ALARM_LEVEL3:String="alarm_level3";
		/**
		 * 统计用到的key: 四级告警
		 */
		public static const STATKEY_ALARM_LEVEL4:String="alarm_level4";
		/**
		 * 统计用到的key: 工单数
		 */
		public static const STATKEY_SHEET_NUM:String="alarm_SheetNo";
		/**
		 * 统计用到的key: 影响客户数
		 */
		public static const STATKEY_CUSTOMER_NUM:String="alarm_GroupCustomer";
		/**
		 * 参数：告警关联数属性
		 */
		public static const STATKEY_CHILDREN:String="parentflag";
		/**
		 *已派发工单数
		 */
		public static const STATKEY_ALARM_SEND:String="alarm_Send";
		/**
		 *在处理工单数
		 */
		public static const STATKEY_ALARM_DEAL:String="alarm_Deal";
		/**
		 * 参数：超时工单数
		 */
		public static const STATKEY_SUPERSHEETNO:String="alarm_SuperSheetNo";
		/**
		 * 统计用到的key: 省份：广东
		 */
		public static const STATKEY_PROVICE_GUANGDONG:String="guangdong";
		/**
		 * 统计用到的key: 省份：江苏
		 */
		public static const STATKEY_PROVICE_JIANGSU:String="jiangsu";
		/**
		 * 参数：超时工单
		 */
		public static const STATKEY_SUPERSHEET:String="superSheet";
		/**
		 * 统计用到的key: 全省
		 */
		public static const STATKEY_CITY_TOTAL:String="00";
		/**
		 * 统计用到的key: 关联关系moduleKey
		 */
		public static const MODULEKEY_RELATIONALARM:String="totalflowrelationalarm";
		/**
		 * 工单统计详情页面
		 */
		public static const SHEETTOTAL_DETAILURL:String="http://10.40.9.225:9081/eoms4/LogonServlet?u=lianchuang&p=123456Lc!&url=/eoms4/tBnsFaultTaskAction!centerHandle2.ilf?formNo=";
	}
}