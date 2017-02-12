package com.linkage.module.cms.gsscene.view.components.quitservice
{
	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-7-26
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */

	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.gsscene.view.components.quitservice.event.QuitServiceEvent;
	

	public class QuitServicePM
	{
		private var log:ILogger = Log.getLoggerByClass(QuitServicePM);

		[Inject("quitServiceDM")]
		[Bindable]
		public var quitServiceDM:QuitServiceDM;
		
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function loadData():void
		{
			if (log.infoEnabled)
				log.info("加载退服统计数据！");
			var e:QuitServiceEvent = new QuitServiceEvent(QuitServiceEvent.LOAD_QUIT_DATA);
//			dispatchMsg(e);
			requestServerUtil.addRequest(e);
		}

		/**
		 * 新增概括统计
		 */
		public function loadGKTJData():void
		{
			log.debug("加载概括统计数据！");
			var e:QuitServiceEvent = new QuitServiceEvent(QuitServiceEvent.LOAD_GKTJ_DATA);
//			dispatchMsg(e);
			requestServerUtil.addRequest(e);
		}
	}
}