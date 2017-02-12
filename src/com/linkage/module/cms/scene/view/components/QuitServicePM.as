package com.linkage.module.cms.scene.view.components
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
	import com.linkage.module.cms.scene.domain.QuitServiceDM;
	import com.linkage.module.cms.scene.event.compenent.QuitServiceEvent;
	
	import org.spicefactory.lib.reflect.types.Void;


	public class QuitServicePM
	{
		private var log:ILogger = Log.getLoggerByClass(QuitServicePM);

		[Inject("quitServiceDM")]
		[Bindable]
		public var quitServiceDM:QuitServiceDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
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