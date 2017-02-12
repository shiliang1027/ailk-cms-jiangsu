package com.linkage.module.cms.quitstatnew.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.quitstatnew.dao.IMultKpiDAO;
	import com.linkage.module.cms.quitstatnew.domain.QuitStatDM;
	import com.linkage.module.cms.quitstatnew.event.QuitStatEvent;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 * 
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-10-25
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MultKpiRenderDataCMD
	{
		private var log:ILogger = Log.getLoggerByClass(MultKpiRenderDataCMD);
		
		[Inject("multKpiDAO")]
		public var dao:IMultKpiDAO;
		[Inject("quitStatDM")]
		public var dm:QuitStatDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		private var now:Number=0;
		
		public function MultKpiRenderDataCMD()
		{
		}
		
		public function execute(e:QuitStatEvent):AsyncToken
		{
			log.debug("[获取多指标渲染配置列表]");
			now = new Date().getMilliseconds();
			return dao.getThresHoldRenderConfig(null);
			
		}
		
		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			log.debug("[获取多指标渲染配置列表]调用接口获取数据结果 success! 耗时：{0}ms",(new Date().getMilliseconds()-now));
			log.debug(obj);
			dm.renders = obj.renders;
			dm.unRenders = obj.unRenders;
			log.debug(dm.renders); 
			log.debug(dm.unRenders);
			var evt:QuitStatEvent = new QuitStatEvent(QuitStatEvent.LOAD_MULTKPI_CONFIGDATA_COMPLETE);
			dispatchMsg(evt);
		}
		
		public function error(f:Fault):void
		{
			log.error("[获取多指标渲染配置列表]失败：" + f.faultString);
		}
	}
}