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
	public class GetImpKpiIsSelectCmd
	{

		private var log:ILogger = Log.getLoggerByClass(GetImpKpiIsSelectCmd);
		[Inject("impProKpiDM")]
		public var impProKpiDM:ImpProKpiDM;
		[Inject("impProKpiDao")]
		public var impProKpiDao:ImpProKpiDao;

		public function execute(e:ImpProKpiEvent):AsyncToken
		{
			log.debug("[重点指标性能]:已选择列表cmd捕获事件...");
			return impProKpiDao.getImpKpiCfgInfo(e.status);
		}

		public function result(data:Object):void
		{
			log.debug("[重点指标性能]result  info ...");
			log.debug(data);
			impProKpiDM.kpiResultIsSelect.removeAll();
			impProKpiDM.kpiResultIsSelect.addAll(data as IList);
			impProKpiDM.kpiResultIsSelect.refresh();
			log.debug(impProKpiDM.kpiResultIsSelect);
		}

		public function error(f:Fault):void
		{
			log.error("[重点指标性能]:已选择列表cmd返回失败..." + f.faultString + "," + f.faultDetail);
		}
	}
}