package com.linkage.module.cms.scenedaily.view.components.functionchain
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.functionchain.FunctionChainDM;
	import com.linkage.module.cms.scenedaily.event.functionchain.FunctionChainEvent;
	import com.linkage.module.cms.scenedaily.view.components.leaderattention.LeaderAttentionPanelPM;

	public class FunctionChainPM
	{
		private var log:ILogger = Log.getLoggerByClass(LeaderAttentionPanelPM);
		
		[Inject("functionChainDM")]
		[Bindable]
		public var functionChainDM:FunctionChainDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		
		public function loadData(param:Object):void
		{
			log.info("加载功能链接模块！");
			
			var e:FunctionChainEvent = new FunctionChainEvent(FunctionChainEvent.SHOW_IMG_URL);
			
			log.info("加载功能链接模块 event！" +　e);
			e.param = param;
			dispatchMsg(e);
		}
	}
}