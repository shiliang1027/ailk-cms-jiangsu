package com.linkage.module.cms.scenedaily.serv.impkpi
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.impkpi.ImpProKpiDao;
	import com.linkage.module.cms.scenedaily.domain.impkpi.ImpProKpiDM;
	import com.linkage.module.cms.scenedaily.event.impkpi.ImpProKpiEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-8-21
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class AddImpKpiDataCmd
	{
		private var log:ILogger = Log.getLoggerByClass(AddImpKpiDataCmd);
		[Inject("impProKpiDM")]
		public var impProKpiDM:ImpProKpiDM;
		[Inject("impProKpiDao")]
		public var impProKpiDao:ImpProKpiDao;
		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:ImpProKpiEvent):AsyncToken
		{
			log.debug("[重点指标性能]:设置性能指标cmd捕获事件...");
			return impProKpiDao.saveImpKpiCfgInfo(e.isSelectDataList);
		}

		public function result(data:Object):void
		{
			log.debug(data);
			impProKpiDM.saveResultString = data as String;
			var e:ImpProKpiEvent = new ImpProKpiEvent(ImpProKpiEvent.RELOAD_IMP_PRO_KPI_DATA);
			msgDispatcher(e);
			log.debug("[重点指标性能]:重新加载重点指标数据 ...");

		}

		public function error(f:Fault):void
		{
			log.error("[重点指标性能]:cmd返回失败..." + f.faultString + "," + f.faultDetail);
		}
	}
}