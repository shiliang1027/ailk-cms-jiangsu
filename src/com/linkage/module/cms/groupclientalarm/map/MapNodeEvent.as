package com.linkage.module.cms.groupclientalarm.map
{
	import flash.events.Event;
	
	public class MapNodeEvent extends Event
	{
		public var mapNode:MapNode;
		public static const MAPNODE_CLICK:String="mapNode_click";
		public static const MAPNODE_MOUSEOVER:String="mapNode_mouseOver";
		public static const MAPNODE_MOUSEOUT:String="mapNode_mouseOut";
		public function MapNodeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}