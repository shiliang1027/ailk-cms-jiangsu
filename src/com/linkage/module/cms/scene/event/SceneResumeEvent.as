package com.linkage.module.cms.scene.event
{
	import flash.events.Event;
	
	/**
	 * 
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-8-1
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneResumeEvent extends Event
	{
		
		public static const LOAD_SCENERESUME_DATA:String = "LOAD_SCENERESUME_DATA";
		
		public static const CREATE_SCENERESUME_LAYOUT:String = "CREATE_SCENERESUME_LAYOUT";
		
		public function SceneResumeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}