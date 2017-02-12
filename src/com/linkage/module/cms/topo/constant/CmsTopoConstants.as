package com.linkage.module.cms.topo.constant
{

	/**
	 * CMS拓扑的常量类
	 * @author duangr
	 *
	 */
	public class CmsTopoConstants
	{
		// --------------------- 默认值 -----------------------
		/**
		 * 默认值: 拓扑数据源名称
		 */
		public static const DEFAULT_TOPONAME_JTKH:String = "default-topo-jtkh";

		// --------------------- 参数 -----------------------
		/**
		 * 页面传入参数: 告警的参数
		 */
		public static const PARAM_ALARM_PARAM:String = "alarmParam";
		/**
		 * 页面传入参数: 集客拓扑的拓扑名称过滤的正则表达式
		 */
		public static const PARAM_JK_TOPONAMES_REGEX:String = "jkTopoNamesRegex";
		/**
		 * 页面传入参数: 页面搜索拓扑名称过滤的正则表达式
		 */
		public static const PARAM_SEARCH_TOPONAMES_REGEX:String = "searchTopoNamesRegex";
		/**
		 * 菜单URL参数
		 */
		public static const PARAM_MENUURL:String = "menuUrl";

		// --------------------- 交互 -----------------------
		/**
		 * 与后台交互xml中的KEY: 域id
		 */
		public static const XML_KEY_AREA_ID:String = "area_id";
		/**
		 * 与后台交互xml中的KEY: 网元id
		 */
		public static const XML_KEY_MO_ID:String = "mo_id";
		/**
		 * 与后台交互xml中的KEY: 网元类型id
		 */
		public static const XML_KEY_MO_TYPE_ID:String = "mo_type_id";
		/**
		 * 与后台交互xml中的KEY: 属地id(本地网)
		 */
		public static const XML_KEY_CITY_ID:String = "city_id";
		/**
		 * 与后台交互xml中的KEY: 服务级别 (钻石服务,金牌服务,银牌服务,铜牌服务,标准服务)
		 */
		public static const XML_KEY_SERV_LEVEL:String = "serv_level";
		/**
		 * 与后台交互xml中的KEY: 属地id(区县)
		 */
		public static const XML_KEY_SUB_CITY_ID:String = "sub_city_id";
		/**
		 * 与后台交互xml中的KEY: 客户id
		 */
		public static const XML_KEY_CUST_ID:String = "cust_id";
		/**
		 * 与后台交互xml中的KEY: 专线id
		 */
		public static const XML_KEY_PRODUCT_NO:String = "prod_no";
		
		public static const XML_KEY_TOPO_TYPE:String = "topoType";
		
		public static const XML_KEY_TOPO_ID:String = "topoId";

		public static const XML_KEY_CIRC_CODE:String = "circuit_code";
	}
}