package com.linkage.module.cms.quitstatnew.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.quitstatnew.dao.IQuotaConfigDAO;
	import com.linkage.module.cms.quitstatnew.domain.QuitStatDM;
	import com.linkage.module.cms.quitstatnew.event.QuitStatEvent;
	
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
	public class QuotaConfigDataCMD
	{
		private var log:ILogger = Log.getLoggerByClass(QuotaConfigDataCMD);
		
		[Inject("quotaConfigDAO")]
		public var dao:IQuotaConfigDAO;
		
		[Inject("quitStatDM")]
		public var dm:QuitStatDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		public function execute(e:QuitStatEvent):AsyncToken
		{
			return dao.getShConfig();
		}
		
		public function result(obj:Object):void
		{
			log.info("[指标显隐配置]调用接口获取数据结果 success!");
			log.debug(obj);
			dm.selList = obj.selList;
			dm.unselList = obj.unselList;
			log.debug(dm.selList);
			log.debug(dm.unselList);
			var evt:QuitStatEvent = new QuitStatEvent(QuitStatEvent.LOAD_QUOTASH_CONFIGDATA_COMPLETE);
			dispatchMsg(evt);
			
		}
		
		public function error(f:Fault):void
		{
			log.info("加载[指标显隐配置]数据错误：" + f.faultString);
			dm.selList.removeAll();
			dm.unselList.removeAll();
		}
	}
}