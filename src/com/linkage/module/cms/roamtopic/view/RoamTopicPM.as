package com.linkage.module.cms.roamtopic.view
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.roamtopic.domain.RoamTopicDM;
	import com.linkage.module.cms.roamtopic.event.RoamTopicEvent;
	
	/**
	 *
	 *
	 * @author gengsan (71951)
	 * @version 1.0
	 * @date 2014-12-19
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class RoamTopicPM
	{
		private var log:ILogger=Log.getLoggerByClass(RoamTopicPM);
		
		[Inject("roamTopicDM")]
		[Bindable]
		public var dm:RoamTopicDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		public function RoamTopicPM()
		{
		}
		
		public function loadConfigParam()
		{
			var e:RoamTopicEvent = new RoamTopicEvent(RoamTopicEvent.ROAMTOPIC_CONFIG_INIT);
			dispatchMsg(e);
		}
		public function saveConfigParam(param:Object)
		{
			var e:RoamTopicEvent = new RoamTopicEvent(RoamTopicEvent.ROAMTOPIC_CONFIG_SAVE);
			e.param  = param;
			e.param.type = dm.roamTopicType;
			e.param.selectIndex = dm.selectIndex;
			dispatchMsg(e);
		}
	}
}