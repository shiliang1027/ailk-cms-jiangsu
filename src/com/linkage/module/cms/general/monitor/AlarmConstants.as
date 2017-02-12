package com.linkage.module.cms.general.monitor
{

	/**
	 * 告警相关常量
	 * @author duangr
	 *
	 */
	public class AlarmConstants
	{
		/**
		 * 日志颜色: 异常
		 */
		public static const LOG_COLOR_ERROR:uint = 0xFF0000;
		/**
		 * 日志颜色: 警告
		 */
		public static const LOG_COLOR_WARN:uint = 0xFF00FF;
		/**
		 * 日志颜色: 强调
		 */
		public static const LOG_COLOR_ACCENT:uint = 0x0000FF;

		/**
		 * 第一次获取告警的数量
		 */
		public static const FIRST_PICK_NUM:int = 500;
		/**
		 * 菜单类型: 外部事件 URL型
		 */
		public static const MENU_TYPE_URL:String = "url";
		/**
		 * 菜单类型: 外部事件 消息通知型
		 */
		public static const MENU_TYPE_MSG:String = "msg";
		/**
		 * 菜单类型: 内部事件or内部+外部事件 关键字型
		 */
		public static const MENU_TYPE_KEY:String = "key";

		/**
		 * 属性: 一级告警
		 */
		public static const PROPERTY_LEVEL1:int = 1;
		/**
		 * 属性: 二级告警
		 */
		public static const PROPERTY_LEVEL2:int = 2;
		/**
		 * 属性: 三级告警
		 */
		public static const PROPERTY_LEVEL3:int = 3;
		/**
		 * 属性: 四级告警
		 */
		public static const PROPERTY_LEVEL4:int = 4;
		/**
		 * 颜色: 默认告警颜色
		 */
		public static const DEFAULT_ALARM_COLOR:String = "0x93ff43";

		//******************************************/
		/**
		 * 视图标记类型: 一级视图设备告警
		 */
		public static const VIEW_LEVEL1_TYPE1:String = "1";
		/**
		 * 视图标记类型: 一级视图性能告警
		 */
		public static const VIEW_LEVEL1_TYPE2:String = "2";
		/**
		 * 视图标记类型: 一级视图投诉工单
		 */
		public static const VIEW_LEVEL1_TYPE3:String = "3";
		/**
		 * 视图标记类型: 一级视图重大新闻
		 */
		public static const VIEW_LEVEL1_TYPE4:String = "4";
		/**
		 * 视图标记类型: 二级视图交换设备告警
		 */
		public static const VIEW_LEVEL2_TYPE5:String = "5";
		/**
		 * 视图标记类型: 二级视图动环设备告警
		 */
		public static const VIEW_LEVEL2_TYPE6:String = "6";
		/**
		 * 视图标记类型: 二级视图数据设备告警
		 */
		public static const VIEW_LEVEL2_TYPE7:String = "7";
		/**
		 * 视图标记类型: 二级视图传输设备告警
		 */
		public static const VIEW_LEVEL2_TYPE8:String = "8";
		/**
		 * 视图标记类型: 二级视图2G无线告警
		 */
		public static const VIEW_LEVEL2_TYPE9:String = "9";
		/**
		 * 视图标记类型: 二级视图TD无线告警
		 */
		public static const VIEW_LEVEL2_TYPE10:String = "10";
		/**
		 * 视图标记类型: 二级视图2g无线性能告警
		 */
		public static const VIEW_LEVEL2_TYPE11:String = "11";
		/**
		 * 视图标记类型: 二级视图td无线性能告警
		 */
		public static const VIEW_LEVEL2_TYPE12:String = "12";
		/**
		 * 视图标记类型: 二级视图交换性能告警
		 */
		public static const VIEW_LEVEL2_TYPE13:String = "13";
		/**
		 * 视图标记类型: 二级视图数据性能告警
		 */
		public static const VIEW_LEVEL2_TYPE14:String = "14";
		//******************************************/
		/**
		 * 视图颜色: 绿色
		 */
		public static const VIEW_COLOR_GREEN:String = "0x93ff43";
		/**
		 * 视图颜色: 黄色
		 */
		public static const VIEW_COLOR_YELLOW:String = "0xffff33";
		/**
		 * 视图颜色: 橙色
		 */
		public static const VIEW_COLOR_ORANGE:String = "0xff4f0b";
		/**
		 * 视图颜色: 红色
		 */
		public static const VIEW_COLOR_RED:String = "0xff0000";

		//******************************************/
		/**
		 * 统计用到的key: 告警总数
		 */
		public static const STATKEY_ALARM_ALL:String = "alarm_all";
		/**
		 * 统计用到的key: 工程告警总数
		 */
		public static const STATKEY_LOCATE_NE_NUM:String = "alarm_LocateNeStatus";
		/**
		 * 统计用到的key: 告警关联数
		 */
		public static const STATKEY_RELATED_NUM:String = "alarm_RelatedFlag";
		/**
		 * 统计用到的key: 一级告警
		 */
		public static const STATKEY_ALARM_LEVEL1:String = "alarm_level1";
		/**
		 * 统计用到的key: 二级告警
		 */
		public static const STATKEY_ALARM_LEVEL2:String = "alarm_level2";
		/**
		 * 统计用到的key: 三级告警
		 */
		public static const STATKEY_ALARM_LEVEL3:String = "alarm_level3";
		/**
		 * 统计用到的key: 四级告警
		 */
		public static const STATKEY_ALARM_LEVEL4:String = "alarm_level4";
		/**
		 * 统计用到的key: 工单数
		 */
		public static const STATKEY_SHEET_NUM:String = "alarm_SheetNo";
		/**
		 * 统计用到的key: 影响客户数
		 */
		public static const STATKEY_CUSTOMER_NUM:String = "alarm_GroupCustomer";
		//*******************************************/
		/**
		 * 退服基站统计key: 2G退服基站数
		 */
		public static const QUITBTS_GG_NUM:String = "gg_num";
		/**
		 * 退服基站统计key: TD退服基站数
		 */
		public static const QUITBTS_TD_NUM:String = "td_num";
		/**
		 * 退服基站统计key: 2G基站退服率
		 */
		public static const QUITBTS_GG_PER:String = "gg_per";
		/**
		 * 退服基站统计key: TD基站退服率
		 */
		public static const QUITBTS_TD_PER:String = "td_per";
		/**
		 * 退服基站统计key: 停电基站数
		 */
		public static const QUITBTS_POWER_CUT_NUM:String = "power_cut_num";
		/**
		 * 退服基站统计key: 直流欠压基站数
		 */
		public static const QUITBTS_LACK_NUM:String = "lack_num";
		/**
		 * 退服基站统计key: 直传输中断基站数
		 */
		public static const QUITBTS_SUSPEND_NUM:String = "suspend_num";
		//******************************************/
		// 参数key
		/**
		 * 参数KEY: 用户信息
		 */
		public static const PARAMKEY_USER:String = "user";
		/**
		 * 参数KEY: 首次加载提取告警数量
		 */
		public static const PARAMKEY_PICKNUM:String = "pickNum";
		/**
		 * 参数KEY: 页面保留最大告警数量
		 */
		public static const PARAMKEY_MAXNUM:String = "maxNum";
		/**
		 * 参数KEY: 会话id
		 */
		public static const PARAMKEY_SESSIONID:String = "sessionId";
		/**
		 * 参数KEY: 用户账号
		 */
		public static const PARAMKEY_ACCOUNT:String = "account";
		/**
		 * 参数KEY: 域id
		 */
		public static const PARAMKEY_AREAID:String = "areaId";
		/**
		 * 参数KEY: 角色id
		 */
		public static const PARAMKEY_ROLEID:String = "roleId";
		/**
		 * 参数KEY: 远程ip
		 */
		public static const PARAMKEY_REMOTEADDR:String = "remoteAddr";
		/**
		 * 参数KEY: 权限内属地json
		 */
		public static const PARAMKEY_CITYJSON:String = "cityJson";
		/**
		 * 参数KEY: 权限内专业json
		 */
		public static const PARAMKEY_SPECJSON:String = "specJson";
		/**
		 * 参数KEY: 权限内菜单json
		 */
		public static const PARAMKEY_MENUXML:String = "menuXml";
		/**
		 * 参数KEY: 权限内告警字段列json
		 */
		public static const PARAMKEY_ALARMCOLUMNJSON:String = "alarmColumnJson";
		/**
		 * 参数KEY: 上下文路径
		 */
		public static const PARAMKEY_CONTEXT:String = "context";
		/**
		 * 参数KEY: 属地ID-名称映射json
		 */
		public static const PARAMKEY_MAP_CITYLABEL:String = "cityLabelMap";
		/**
		 * 参数KEY: 告警等级-颜色映射json
		 */
		public static const PARAMKEY_MAP_LEVELCOLOR:String = "levelColorMap";
		/**
		 * 参数KEY: 告警专业-展示名称映射json
		 */
		public static const PARAMKEY_MAP_SPECLABEL:String = "specLabelMap";
		/**
		 * 参数KEY: 告警等级-展示名称映射json
		 */
		public static const PARAMKEY_MAP_LEVELLABEL:String = "levelLabelMap";
		/**
		 * 参数KEY: 告警状态-展示名称映射json
		 */
		public static const PARAMKEY_MAP_STATUSLABEL:String = "statusLabelMap";
		/**
		 *综合视图KEY：设备告警
		 */
		public static const GENERAL_DEVICEWARN:String = "1";
		/**
		 *综合视图KEY：性能告警
		 */
		public static const GENERAL_PERFORMWARN:String = "2";
		/**
		 *综合视图KEY：故障工单
		 */
		public static const GENERAL_FAULTFLOW:String = "faultFlow";
		/**
		 *综合视图KEY：重大新闻
		 */
		public static const GENERAL_MAJORNEWS:String = "majorNews";
		/**
		 *视图平均数MAP
		 */
		public static const VIEWCOLUMN_AVE_MAP:Array = ["drop_rate", "congestion_rate", "paging_sucess_rate", "cp_load"];
	}
}