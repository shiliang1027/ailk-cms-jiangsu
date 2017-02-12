package com.linkage.module.cms.scene.kpicustom.event
{
	import flash.events.Event;

	/**
	 *
	 * 指标定制事件类
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-11-14
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class KpiCustomEvent extends Event
	{
		public var param:Object;
		/**
		 * 事件：初始化 
		 */
		public static const INIT:String="INIT";
		/**
		 * 事件：显示视图 
		 */
		public static const VIEWSHOW:String="VIEWSHOW";
		/**
		 * 事件：加载网元类型列表 
		 */
		public static const LOADMOTYPES:String="LOADMOTYPES";
		/**
		 * 事件：加载网元类型列表完成
		 */
		public static const LOADMOTYPESCOMPLETE:String = "LOADMOTYPESCOMPLETE";
		
		/**
		 * 事件：加载网元类型列表失败
		 */
		public static const LOADMOTYPESERROR:String = "LOADMOTYPESERROR";
		/**
		 * 事件：加载指标列表 
		 */
		public static const LOADKPIS:String="LOADKPIS";
		
		/**
		 * 事件：加载指标列表完成 
		 */
		public static const LOADKPISCOMPLETE:String="LOADKPISCOMPLETE";
		/**
		 * 事件：加载指标列表失败 
		 */
		public static const LOADKPISERROR:String="LOADKPISERROR";
		/**
		 * 事件：加载网元列表 
		 */		
		public static const LOADMOS:String="LOADMOS";
		/**
		 * 事件：加载网元列表完成
		 */		
		public static const LOADMOSCOMPLETE:String="LOADMOSCOMPLETE";
		/**
		 * 事件：加载网元列表失败
		 */		
		public static const LOADMOSERROR:String="LOADMOSERROR";
		/**
		 * 事件：加载区域列表 
		 */		
		public static const LOADAREAS:String="LOADAREAS";
		/**
		 * 事件：加载区域列表完成 
		 */		
		public static const LOADAREASCOMPLETE:String="LOADAREASCOMPLETE";
		
		/**
		 * 事件：加载区域列表失败 
		 */		
		public static const LOADAREASERROR:String="LOADAREASERROR";
		
		/**
		 * 事件：加载网元指标数据 
		 */		
		public static const LOADKPIDATA:String="LOADKPIDATA";
		/**
		 * 事件：加载网元指标数据完成 
		 */
		public static const LOADKPIDATACOMPLETE:String="LOADKPIDATACOMPLETE";
		/**
		 * 事件：加载网元指标数据失败 
		 */
		public static const LOADKPIDATAERROR:String="LOADKPIDATAERROR";
		/**
		 * 事件：外部查询某网元或区域指标数据 
		 */		
		public static const QUERYKPI:String = "QUERYKPI";


		public function KpiCustomEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}