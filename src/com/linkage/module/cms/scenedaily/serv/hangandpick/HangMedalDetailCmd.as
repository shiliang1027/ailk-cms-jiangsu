package com.linkage.module.cms.scenedaily.serv.hangandpick
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.hangandpick.MedalDao;
	import com.linkage.module.cms.scenedaily.domain.hangandpick.MedalDetailDM;
	import com.linkage.module.cms.scenedaily.event.hangandpick.GedalDetailEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-8-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class HangMedalDetailCmd
	{
		private var log:ILogger = Log.getLoggerByClass(HangMedalDetailCmd);

		[Inject("medalDetailDM")]
		public var hangMedalDetailDM:MedalDetailDM;
		[Inject("medalDao")]
		public var medalDao:MedalDao;

		public function execute(e:GedalDetailEvent):AsyncToken
		{
			log.debug("[挂牌详情]:挂牌详情cmd捕获事件...");
			return medalDao.queryListedDetail(e.id);
		}

		public function result(data:Object):void
		{
			log.debug("[挂牌详情]返回数据信息....");
			log.debug(data);
			//基本信息
			hangMedalDetailDM.baseInfoData.removeAll();
			hangMedalDetailDM.baseInfoData.addAll(data.list as IList);
			hangMedalDetailDM.baseInfoData.refresh();
			log.debug("[挂牌详情]基本信息....");
			log.debug(hangMedalDetailDM.baseInfoData);
			//历史信息
			hangMedalDetailDM.historyInfoData.removeAll();
			hangMedalDetailDM.historyInfoData.addAll(data.his as IList);
			hangMedalDetailDM.historyInfoData.refresh();
			log.debug("[挂牌详情]历史信息....");
			log.debug(hangMedalDetailDM.historyInfoData);
			//指标信息
			hangMedalDetailDM.propertyInfoData.removeAll();
			hangMedalDetailDM.propertyInfoData.addAll(data.kpi as IList);
			hangMedalDetailDM.propertyInfoData.refresh();
			log.debug("[挂牌详情]指标信息....");
			log.debug(hangMedalDetailDM.propertyInfoData);
			//订单信息
			hangMedalDetailDM.workOrderInfoData.removeAll();
			hangMedalDetailDM.workOrderInfoData.addAll(data.order as IList);
			hangMedalDetailDM.workOrderInfoData.refresh();
			log.debug("[挂牌详情]订单信息....");
			log.debug(hangMedalDetailDM.workOrderInfoData);
		}

		public function error(f:Fault):void
		{
			log.error("[挂牌详情]:cmd返回失败..." + f.faultString + "," + f.faultDetail);
		}
	}
}