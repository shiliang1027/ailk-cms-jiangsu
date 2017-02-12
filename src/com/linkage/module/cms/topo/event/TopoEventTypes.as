package com.linkage.module.cms.topo.event
{

	/**
	 * CMS拓扑图自有的事件名称
	 * @author duangr
	 *
	 */
	public class TopoEventTypes
	{
		/**
		 * 事件类型: 导入设备
		 */
		public static const IMPORT_DEVICES:String = "TopoEvent_CMS_IMPORT_DEVICES";
		/**
		 * 事件类型: 导入设备(视图中导入)
		 */
		public static const IMPORT_DEVICES_INVIEW:String = "TopoEvent_CMS_IMPORT_DEVICES_INVIEW";
		/**
		 * 事件类型: 自动生成链路
		 */
		public static const AUTOCREATE_LINKS:String = "TopoEvent_CMS_AUTOCREATE_LINKS";
		/**
		 * 事件类型: 自动生成拓扑(接入网)
		 */
		public static const AUTOCREATE_ACCESS_TOPO:String = "TopoEvent_CMS_AUTOCREATE_ACCESS_TOPO";
		/**
		 * 事件类型: 生成指定网元的链路
		 */
		public static const FIND_LINKS:String = "TopoEvent_CMS_FIND_LINKS";

		/**
		 * 事件类型: (根据两端设备名称)显示传输电路列表
		 */
		public static const SHOW_CIRCUIT:String = "TopoEvent_CMS_SHOW_CIRCUIT";
		/**
		 * 事件类型: 根据电路编号显示传输电路列表
		 */
		public static const SHOW_CIRCUIT_BY_CIRCCODE:String = "TopoEvent_CMS_SHOW_CIRCUIT_BY_CIRCCODE";

		/**
		 * 事件类型: 加载电路关联的拓扑
		 */
		public static const LOADTOPO_CIRCUIT:String = "TopoEvent_CMS_LOADTOPO_CIRCUIT";
		/**
		 * 事件类型: 显示传输光路列表
		 */
		public static const SHOW_OPTIC:String = "TopoEvent_CMS_SHOW_OPTIC";
		/**
		 * 事件类型: 显示网元的属性信息
		 */
		public static const SHOW_ATTRIBUTE:String = "TopoEvent_CMS_SHOW_ATTRIBUTE";
		/**
		 * 事件类型: 显示通道路由拓扑
		 */
		public static const CHANNEL_VIEW:String = "TopoEvent_CMS_GO_CHANNEL_VIEW";
		/**
		 * 事件类型: 定位到传输拓扑
		 */
		public static const LOCATE_TRAN_TOPO:String = "TopoEvent_CMS_LOCATE_TRAN_TOPO";
		/**
		 * 事件类型: 搜索有告警的传输电路
		 */
		public static const SEARCH_ALARMED_CIRCUIT:String = "TopoEvent_CMS_SEARCH_ALARMED_CIRCUIT";
		/**
		 * 事件类型: 查看性能趋势图
		 */
		public static const SHOW_CHART_COMPONENT:String = "TopoEvent_VIEW_CHART";

	}
}