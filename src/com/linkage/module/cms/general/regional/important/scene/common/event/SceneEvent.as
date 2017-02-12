package com.linkage.module.cms.general.regional.important.scene.common.event
{
	import flash.events.Event;

	/**
	 *场景事件
	 * @author mengqiang
	 *
	 */
	public class SceneEvent extends Event
	{
		/**
		 * 场景点击
		 */
		public static const SCENE_CLICK:String="scene_click";
		/**
		 * 场景ID
		 */
		private var _venueId:String=null;
		/**
		 * 场景URL
		 */
		private var _venueURL:String=null;
		/**
		 * 历史时间
		 */
		private var _histroyTime:String=null;

		public function SceneEvent(type:String, venueId:String, venueURL:String, historyTime:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_venueId=venueId;
			_venueURL=venueURL;
			_histroyTime=historyTime;

		}

		public function get venueId():String
		{
			return _venueId;
		}

		public function get venueURL():String
		{
			return _venueURL;
		}

		public function get histroyTime():String
		{
			if (_histroyTime == null || _histroyTime == "null")
			{
				return "-1";
			}
			return _histroyTime;
		}
	}
}