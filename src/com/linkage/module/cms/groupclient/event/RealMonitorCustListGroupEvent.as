package com.linkage.module.cms.groupclient.event
{
	import flash.events.Event;
	
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-11-1 下午01:33:45
	 * @category com.linkage.module.cms.groupclient.event
	 * @copyright 南京联创科技 网管开发部
	 */
	public class RealMonitorCustListGroupEvent extends Event
	{
		public static const QUERYALLCUST:String = "queryAllCust";
		public static const QUERYALARMCUST:String = "queryAlarmCust";
		public static const DATACHANGE:String = "dataChange";
		public static const CUSTSELECTED:String = "custSelected";
		public static const REFRESH:String = "refresh";
		public static const CUSTNUMCHANGE:String = "custNumChange";
		public static const CUSTNUMQUERY:String = "custNumQuery";
		public var param:Object;
		public function RealMonitorCustListGroupEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}