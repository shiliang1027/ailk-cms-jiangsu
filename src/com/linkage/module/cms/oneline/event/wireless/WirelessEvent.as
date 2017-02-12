package com.linkage.module.cms.oneline.event.wireless
{
	import flash.events.Event;
	
	/**
	 * 
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-11-22
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class WirelessEvent extends Event
	{
		public var param:Object;
		public static const WIRELESSVIEWSHOW:String = "WIRELESSVIEWSHOW";
		
		/**
		 * 事件：加载指标列表 
		 */		
		public static const LOADKPIS:String = "LOADKPIS";
		public static const LOADKPISCOMPLETE:String = "LOADKPISCOMPLETE";
		public static const LOADKPISERROR:String = "LOADKPISERROR";
		/**
		 * 事件：加载指标汇总趋势数据 
		 */		
		public static const DOLOADKPICOLLECTDATA:String = "DOLOADKPICOLLECTDATA";
		public static const LOADKPICOLLECTDATA:String = "LOADKPICOLLECTDATA";
		public static const LOADKPICOLLECTDATACOMPLETE:String = "LOADKPICOLLECTDATACOMPLETE";
		public static const LOADKPICOLLECTDATAERROR:String = "LOADKPICOLLECTDATAERROR";
		
		/**
		 * 事件：加载劣化指标颜色列表 
		 */		
		public static const DOLOADKPICOLORDATA:String = "DOLOADKPICOLORDATA";
		public static const LOADKPICOLORDATA:String = "LOADKPICOLORDATA";
		public static const LOADKPICOLORDATACOMPLETE:String = "LOADKPICOLORDATACOMPLETE";
		public static const LOADKPICOLORDATAERROR:String = "LOADKPICOLORDATAERROR";
		/**
		 * 事件：加载指标表格数据 
		 */		
		public static const LOADKPIDGDATA:String = "LOADKPIDGDATA";
		public static const LOADKPIDGDATACOMPLETE:String = "LOADKPIDGDATACOMPLETE";
		public static const LOADKPIDGDATAERROR:String = "LOADKPIDGDATAERROR";
		public function WirelessEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}