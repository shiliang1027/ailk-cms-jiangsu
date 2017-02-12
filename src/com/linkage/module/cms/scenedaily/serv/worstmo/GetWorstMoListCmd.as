package com.linkage.module.cms.scenedaily.serv.worstmo
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.worstmo.WorstMoDao;
	import com.linkage.module.cms.scenedaily.domain.worstmo.WorstMoSetDM;
	import com.linkage.module.cms.scenedaily.event.worstmo.WorstMoSetEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-9-5
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class GetWorstMoListCmd
	{
		private var log:ILogger = Log.getLoggerByClass(GetWorstMoListCmd);
		[Inject("worstMoSetDM")]
		public var worstMoSetDM:WorstMoSetDM;
		[Inject("worstMoDao")]
		public var worstMoDao:WorstMoDao;
		[MessageDispatcher]
		public var msgDispatcher:Function;
		//类型名称
		private var typeName:String;

		public function execute(e:WorstMoSetEvent):AsyncToken
		{
			log.debug("[最差网元设置]:查询列表cmd捕获事件...");
			log.debug(e.typeName);
			this.typeName = e.typeName;
			return worstMoDao.getWorstType(e.typeName);
		}

		public function result(data:Object):void
		{
			log.debug("最差网元设置 result info ...");
			log.debug(data);
			worstMoSetDM.worstMoList.removeAll();
			worstMoSetDM.worstMoList.addAll(data.datas as IList);
			worstMoSetDM.worstMoList.refresh();

			worstMoSetDM.worstPerMoList.removeAll();
			worstMoSetDM.worstPerMoList.addAll(data.perfmolist as IList);
			worstMoSetDM.worstPerMoList.refresh();

			worstMoSetDM.perMoType = data.perfmo_type_id;
			worstMoSetDM.relationShip = data.relationship;

			log.debug(worstMoSetDM.worstMoList);
			log.debug(worstMoSetDM.worstPerMoList);
			log.debug(worstMoSetDM.perMoType);
			log.debug(worstMoSetDM.relationShip);

			var e1:WorstMoSetEvent = new WorstMoSetEvent(WorstMoSetEvent.SHOW_WORST_KPI_SHIP_INFO);
			e1.typeName = this.typeName;
			log.debug("最差网元设置 派发事件...type=" + typeName);
			msgDispatcher(e1);
		}

		public function error(f:Fault):void
		{
			log.error("[最差网元设置]:查询列表cmd返回失败..." + f.faultString + "," + f.faultDetail);
		}
	}
}