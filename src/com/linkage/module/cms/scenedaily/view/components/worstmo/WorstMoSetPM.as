package com.linkage.module.cms.scenedaily.view.components.worstmo
{
	import com.linkage.module.cms.scenedaily.domain.worstmo.WorstMoSetDM;
	import com.linkage.module.cms.scenedaily.event.worstmo.WorstMoSetEvent;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-9-5
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class WorstMoSetPM
	{
		[Inject("worstMoSetDM")]
		[Bindable]
		public var worstMoSetDM:WorstMoSetDM;
		[MessageDispatcher]
		public var msgDispatcher:Function;

		/**
		 *根据网元类型 获取最差网元列表信息
		 */
		public function getWorstMoListByType(typeName:String):void
		{
			var e:WorstMoSetEvent = new WorstMoSetEvent(WorstMoSetEvent.GET_WORST_MO_LIST);
			e.typeName = typeName;
			msgDispatcher(e);
		}

		public function saveWorstMo(saveObj:Object):void
		{
			var e:WorstMoSetEvent = new WorstMoSetEvent(WorstMoSetEvent.SAVE_WORST_MO_INFO);
			e.saveWorstInfo = saveObj;
			msgDispatcher(e);
		}
	}
}