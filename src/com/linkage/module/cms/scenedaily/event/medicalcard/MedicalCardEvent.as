package com.linkage.module.cms.scenedaily.event.medicalcard
{
	import flash.events.Event;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-8-20
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MedicalCardEvent extends Event
	{
		public var param:Object=new Object();

		//加载数据
		public static const LOAD_MEDICALCARD_DATA:String="loadMedicalCardData";
		
		//导出
		public static const EXPORT_MEDICALCARD_DATA:String="exportMedicalCardData";

		public function MedicalCardEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}