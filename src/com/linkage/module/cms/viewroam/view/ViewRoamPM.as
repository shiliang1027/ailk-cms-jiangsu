package com.linkage.module.cms.viewroam.view
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.viewroam.domain.ViewRoamDM;
	import com.linkage.module.cms.viewroam.event.ViewRoamEvent;
	
	/**
	 *
	 *
	 * @author gengsan (71951)
	 * @version 1.0
	 * @date 2014-11-03
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ViewRoamPM
	{
		private var log:ILogger=Log.getLoggerByClass(ViewRoamPM);
		
		[Inject("viewRoamDM")]
		[Bindable]
		public var dm:ViewRoamDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		public function loadData():void
		{
			if (log.infoEnabled)
				log.info("加载性能数据！");
			var e:ViewRoamEvent = new ViewRoamEvent(ViewRoamEvent.LOAD_DATA);
			dispatchMsg(e);
		}
	}
}