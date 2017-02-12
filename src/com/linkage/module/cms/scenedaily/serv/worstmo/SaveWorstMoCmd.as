package com.linkage.module.cms.scenedaily.serv.worstmo
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.worstmo.WorstMoDao;
	import com.linkage.module.cms.scenedaily.domain.worstmo.WorstMoSetDM;
	import com.linkage.module.cms.scenedaily.event.worstmo.WorstMoSetEvent;

	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-9-6
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SaveWorstMoCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SaveWorstMoCmd);
		[Inject("worstMoSetDM")]
		public var worstMoSetDM:WorstMoSetDM;
		[Inject("worstMoDao")]
		public var worstMoDao:WorstMoDao;
		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:WorstMoSetEvent):AsyncToken
		{
			log.debug("[最差网元设置]:保存最差网元cmd捕获事件...");
			log.debug(e.saveWorstInfo);
			return worstMoDao.saveWorstMoSetList(e.saveWorstInfo);

		}

		public function result(data:Object):void
		{
			log.debug("最差网元设置 result info...");
			log.debug(data);
			worstMoSetDM.worstMoResultStr = data as String;
			var e1:WorstMoSetEvent = new WorstMoSetEvent(WorstMoSetEvent.RETURN_WORST_MO_STR);
			msgDispatcher(e1);
		}

		public function error(f:Fault):void
		{
			log.error("[最差网元设置]:保存最差网元cmd返回失败..." + f.faultString + "," + f.faultDetail);
		}
	}
}