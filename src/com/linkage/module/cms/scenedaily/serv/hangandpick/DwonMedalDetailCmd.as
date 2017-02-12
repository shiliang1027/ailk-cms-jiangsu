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
	public class DwonMedalDetailCmd
	{
		private var log:ILogger = Log.getLoggerByClass(DwonMedalDetailCmd);

		[Inject("medalDetailDM")]
		public var hangMedalDetailDM:MedalDetailDM;
		[Inject("medalDao")]
		public var medalDao:MedalDao;

		public function execute(e:GedalDetailEvent):AsyncToken
		{
			log.debug("[摘牌详情]:摘牌详情cmd捕获事件...");
			return medalDao.queryDelistedDetail(e.id);
		}

		public function result(data:Object):void
		{
			log.debug("[摘牌详情]result info.....");
			log.debug(data);
			hangMedalDetailDM.baseInfoData.removeAll();
			hangMedalDetailDM.baseInfoData.addAll(data.delist as IList);
			hangMedalDetailDM.baseInfoData.refresh();
			log.debug("[摘牌详情]基本信息");
			log.debug(hangMedalDetailDM.baseInfoData);

			hangMedalDetailDM.propertyInfoData.removeAll();
			hangMedalDetailDM.propertyInfoData.addAll(data.kpi as IList);
			hangMedalDetailDM.propertyInfoData.refresh();
			log.debug("[摘牌详情]性能信息");
			log.debug(hangMedalDetailDM.propertyInfoData);

			hangMedalDetailDM.workOrderInfoData.removeAll();
			hangMedalDetailDM.workOrderInfoData.addAll(data.order as IList);
			hangMedalDetailDM.workOrderInfoData.refresh();
			log.debug("[摘牌详情]工单信息");
			log.debug(hangMedalDetailDM.workOrderInfoData);

		}

		public function error(f:Fault):void
		{
			log.error("[摘牌详情]:cmd返回失败..." + f.faultString + "," + f.faultDetail);
		}
	}
}