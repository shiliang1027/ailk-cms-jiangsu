package com.linkage.module.cms.groupmonitor.custscene.event
{
	import flash.events.Event;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-10-11
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class CustSceneEvent extends Event
	{
		public var param:Object=new Object;

		//提供加载流水所需要的大客户对应使用客户
		public static const LOADA_LARM_CUSTS_SQL:String="LOADA_LARM_CUSTS_SQL";

		//模糊查询大客户选择列表
		public static const MODIFY_COLOR:String = "MODIFY_COLOR";

		//模糊查询大客户选择列表
		public static const LOAD_SELECTLIST_BYNAME:String = "LOAD_SELECTLIST_BYNAME";

		//修改名字
		public static const LOAD_OVERAREA_SPECS:String="LOAD_OVERAREA_SPECS";

		//修改名字
		public static const LOAD_OVERAREA_SPECS_COMP:String="LOAD_OVERAREA_SPECS_COMP";

		//修改名字
		public static const MODIFY_CUST_NAME:String="MODIFY_CUST_NAME";

		//保存位置
		public static const SAVE_CUST_LOCATION:String="SAVE_CUST_LOCATION";

		//加载省级跨地市专线
		public static const LOAD_PRO_SPEC_BYCUSTID:String="LOAD_PRO_SPEC_BYCUSTID";

		//加载省级跨地市专线完成
		public static const LOAD_PRO_SPEC_BYCUSTID_COMP:String="LOAD_PRO_SPEC_BYCUSTID_COMP";

		//保存配置的客户
		public static const SAVE_SET_CUSTS:String="SAVE_SET_CUSTS";

		//根据条件查询配置客户
		public static const QUERY_CUST_BY_CONDITION:String="QUERY_CUST_BY_CONDITION";

		//加载选择条件
		public static const LOAD_SELECT_CONDITION:String="LOAD_SELECT_CONDITION";

		//查看趋势图
		public static const SHOW_CHART:String="SHOW_CHART";

		//保存图例信息结果
		public static const LOAS_BASE_TREE_DATA:String="loadBaseTreeData";

		//加载分页树
		public static const LOAD_PAGE_TREE_DATA:String="loadPageTreeData";

		//加载分页树完成
		public static const LOAD_PAGE_TREE_DATA_COMP:String="loadPageTreeDataComp";

		//查询大客户对应使用客户信息
		public static const LOAS_BIG_CUST_DATA:String="loadBigCustData";

		//查询使用客户分布信息
		public static const LOAS_USER_CUST_DATA:String="LOAS_USER_CUST_DATA";

		//查询使用客户分布信息完成
		public static const LOAS_USER_CUST_DATA_COMP:String="LOAS_USER_CUST_DATA_COMP";

		//查询大客户对应使用客户信息完成
		public static const LOAS_BIG_CUST_DATA_COMP:String="loadBigCustDataComp";

		//根据客户ID 加载故障工单投诉工单信息
		public static const LOAD_OTHER_DATA_BYCUSTBYID:String="loadOtherDataByCustId";

		//点击TOP图 根据客户ID 加载故障工单投诉工单信息
		public static const LOAD_OTHER_DATA_BYCUSTBYID_BY_TOPU:String="loadOtherDataByCustIdByTopu";

		//根据客户ID加载 配置服务类型
		public static const LOAD_SERVER_TYPE_BY_CUSTID:String="loadServerTypeByCustId";

		//根据客户ID加载 配置服务类型
		public static const LOAD_SERVER_TYPE_BY_CUSTID_COMP:String="loadServerTypeByCustIdComp";

		//查询指标
		public static const LOAD_KPI_GROUP_BY_CUST_ID:String="loadKpiGroupByCustId";

		//查询指标完成
		public static const LOAD_KPI_GROUP_BY_CUST_ID_COMP:String="loadKpiGroupByCustIdComp";

		//查询趋势图数据
		public static const LOAD_PREF_CHART_DATA:String="loadPrefChartData";

		//查询趋势图数据完成
		public static const LOAD_PREF_CHART_DATA_COMP:String="loadPrefChartDataComp";

		//查询趋势图数据完成
		public static const COMPLETE:String="creatComplete";

		//查询趋势图数据完成
		public static const DATAQUERY:String="dataQuery";

		public static const DATACHANGE:String="dataChange";

		public static const SELECTCHANGE:String="selectChange";

		//查询是否有告警
		public static const QUERY_HAS_ALARM:String="queryHasAlarm";

		//查询是否有告警完成
		public static const QUERY_HAS_ALARM_COMP:String="queryHasAlarmComp";

		//初始化面板
		public static const CUST_PANEL_INIT_DATA:String="custPanelInitData";

		//初始化面板完成
		public static const CUST_PANEL_INIT_DATA_COMP:String="CUST_PANEL_INIT_DATA_COMP";

		//点击操作
		public static const CLICK_OPTION:String="CLICK_OPTION";

		//根据大客户查性能面板的使用客户
		public static const LOAD_USER_CUST_BY_BIGCUST:String="LOAD_USER_CUST_BY_BIGCUST";

		//根据服务类型加载性能面板的指标
		public static const LOAD_KPIS_BY_SERVTYPE:String="LOAD_KPIS_BY_SERVTYPE";

		//根据服务类型加载性能面板的指标
		public static const CREATE_KPI_COLUMS:String="CREATE_KPI_COLUMS";

		//初始化故障工单
		public static const LOAD_FAULT_ORDER_INIT:String="LOAD_FAULT_ORDER_INIT";
		//初始化投诉工单
		public static const LOAD_COMPLAINTS_ORDER_INIT:String="LOAD_COMPLAINTS_ORDER_INIT";

		//加载地图左边面板
		public static const LOAD_PANEL_DATA_BY_CUSTID:String="loadPanelDataByCustId";

		//加载地图左边面板
		public static const LOAD_PANEL_DATA_BY_CITYID:String="LOAD_PANEL_DATA_BY_CITYID";

		//加载区县下专线数量
		public static const LOAD_SPECOUNT_INDISTRICT:String="LOAD_SPECOUNT_INDISTRICT";

		//加载区县下专线数量完成
		public static const LOAD_SPECOUNT_INDISTRICT_COMP:String="LOAD_SPECOUNT_INDISTRICT_COMP";

		//加载区县下专线数量完成
		public static const CLICKSPEC:String="CLICKSPEC";

		//加载区县下专线数量完成
		public static const SHOWPERFPANEL:String="SHOWPERFPANEL";

		//加载专线下的性能数据
		public static const CREATE_KPI_COLUMS_RUN:String="CREATE_KPI_COLUMS_RUN";
		
		//导出数据
		public static const EXPORT_DATA:String="EXPORT_DATA";
		
		public static const LOAD_SPE_LINE_FAULT_ANALYSIS:String="LOAD_SPE_LINE_FAULT_ANALYSIS";
		
		public static const LOAD_SPE_LINE_COMP_ANALYSIS:String="LOAD_SPE_LINE_COMP_ANALYSIS";
		
		public static const SHOW_SPE_LINE_FAULT_ANALYSIS_DATA:String="SHOW_SPE_LINE_FAULT_ANALYSIS_DATA";
		
		public static const SHOW_SPE_LINE_COMP_ANALYSIS_DATA:String="SHOW_SPE_LINE_COMP_ANALYSIS_DATA";
		
		public static const FINISH_CHART:String="FINISH_CHART";


		public function CustSceneEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}