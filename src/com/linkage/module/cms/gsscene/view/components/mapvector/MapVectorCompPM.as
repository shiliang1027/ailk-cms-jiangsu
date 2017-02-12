package com.linkage.module.cms.gsscene.view.components.mapvector
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.gsscene.view.components.mapvector.MapVectorDM;
	import com.linkage.module.cms.gsscene.view.components.mapvector.event.MapVectorEvent;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-10-14
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MapVectorCompPM
	{
		private var log:ILogger = Log.getLoggerByClass(MapVectorCompPM);

		[Inject("mapVectorDM")]
		[Bindable]
		public var dm:MapVectorDM;
		
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;

		[MessageDispatcher]
		public var msgDispatch:Function;

		public function getDyeMap():void
		{
//			msgDispatch(new MapVectorEvent(MapVectorEvent.CMS_SCENE_GENERAL_MAPVECTOR_LOADMAP));
			requestServerUtil.addRequest(new MapVectorEvent(MapVectorEvent.CMS_SCENE_GENERAL_MAPVECTOR_LOADMAP));
		}

	}
}