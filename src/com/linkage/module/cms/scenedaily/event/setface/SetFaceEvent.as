package com.linkage.module.cms.scenedaily.event.setface
{
	import flash.events.Event;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-9-3
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SetFaceEvent extends Event
	{
		public var param:Object=new Object();

		//加载数据
		public static const LOAD_BASESET_DATA:String="loadBaseSetData";

		//加载数据成功
		public static const LOAD_BASESET_DATA_COMP:String="loadBaseSetDataComp";

		//保存数据
		public static const SAVE_BASESET_DATA:String="saveBaseSetData";

		//保存数据完成
		public static const SAVE_BASESET_DATA_COMP:String="saveBaseSetDataComp";

		//加载健康算法数据
		public static const LOAD_HEALTHSET_DATA:String="loadHealthSetData";

		//加载健康算法设置数据成功
		public static const LOAD_HEALTHSET_DATA_COMP:String="loadHealthSetDataComp";

		//保存健康算法设置数据
		public static const SAVE_HEALTHSET_DATA:String="saveHealthSetData";

		//保存健康算法设置数据
		public static const SAVE_HEALTHSET_DATA_COMP:String="saveHealthSetDataComp";

		public function SetFaceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}