package com.linkage.module.cms.quitstatnew.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.quitstatnew.dao.IThresHoldDyeDAO;
	import com.linkage.module.cms.quitstatnew.domain.QuitStatDM;
	import com.linkage.module.cms.quitstatnew.event.QuitStatEvent;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 * 
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-10-24
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class ThresHoldDyeDataCMD
	{
		private var log:ILogger = Log.getLoggerByClass(ThresHoldDyeDataCMD);
		
		[Inject("thresHoldDyeDAO")]
		public var dao:IThresHoldDyeDAO;
		
		[Inject("quitStatDM")]
		public var dm:QuitStatDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		public function execute(e:QuitStatEvent):AsyncToken
		{
			log.info("[指标阈值配置]获取指定指标数据");
			return dao.getThresHoldConfig();
		}
		
		public function result(obj:Object):void
		{
			log.info("[指标阈值配置]调用接口获取数据结果:");
			log.debug(obj);
			dm.thresHoldDyes = ArrayCollection(obj);
			var e:QuitStatEvent = new QuitStatEvent(QuitStatEvent.LOAD_THRESHOLD_DATA_COMPLETE);
			dispatchMsg(e);
		}
		
		public function error(f:Fault):void
		{
			log.info("加载[指标阈值配置]数据错误：" + f.faultString);
		}
	}
}