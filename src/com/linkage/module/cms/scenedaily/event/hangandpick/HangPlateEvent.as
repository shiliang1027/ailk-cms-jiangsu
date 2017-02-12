package com.linkage.module.cms.scenedaily.event.hangandpick
{
	import flash.events.Event;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-9-7
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class HangPlateEvent extends Event
	{

		public static const LOAD_HANGPLATE_DATA:String = "LOAD_HANGPLATE_DATA"; //加载挂牌数据

		public static const CREATE_HANGPLATE_PAGEHANDLER:String = "CREATE_HANGPLATE_PAGEHANDLER"; //根据获取的数据创建挂牌页面

		public static const PICKPLATE_HANDLER:String = "PICKPLATE_HANDLER"; //摘牌功能

		public static const HANGPLATE_MO_DETAILHANDLER:String = "HANGPLATE_MO_DETAILHANDLER"; //挂牌网元详情

		public static const CMS_SCENEDAILY_HANGMEDALDETAIL_BASEDATAGRID_ITEMCLICKHANDLER:String = "CMS_SCENEDAILY_HANGMEDALDETAIL_BASEDATAGRID_ITEMCLICKHANDLER";

		private var _param:Object;

		public function HangPlateEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}

		public function get param():Object
		{
			return _param;
		}

		public function set param(value:Object):void
		{
			_param = value;
		}

	}
}