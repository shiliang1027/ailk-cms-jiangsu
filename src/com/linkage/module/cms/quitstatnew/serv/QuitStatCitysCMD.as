package com.linkage.module.cms.quitstatnew.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.quitstatnew.dao.IQuitStatDAO;
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
	 * @date 2012-10-22
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class QuitStatCitysCMD
	{
		private var log:ILogger = Log.getLoggerByClass(QuitStatCitysCMD);
		
		[Inject("quitStatDAO")]
		public var dao:IQuitStatDAO;
		
		
		public function QuitStatCitysCMD()
		{
		}
		
		[Inject("quitStatDM")]
		public var dm:QuitStatDM;
		
		[MessageDispatcher]
		public var dispatchMsg:Function;
		
		private var now:Number=0;
		
		public function execute(e:QuitStatEvent):AsyncToken
		{
			log.debug("[获取地市列表]");
			now = new Date().getMilliseconds();
			return dao.getcitys();
			
		}
		
		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
			log.debug("[获取地市列表]调用接口获取数据结果 success! 耗时：{0}ms",(new Date().getMilliseconds()-now));
			log.debug(obj);
			dm.citys.addAll(ArrayCollection(obj));
			dispatchMsg(new QuitStatEvent(QuitStatEvent.LOADCITYSCOMPLETE));
		}
		
		public function error(f:Fault):void
		{
			log.error("[获取地市列表]失败：" + f.faultString);
		}
	}
}