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
	 * @date 2012-8-31
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class PickOffMedalCmd
	{

		private var log:ILogger = Log.getLoggerByClass(PickOffMedalCmd);

		[Inject("medalDetailDM")]
		public var medalDetailDM:MedalDetailDM;
		[Inject("medalDao")]
		public var medalDao:MedalDao;
		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:GedalDetailEvent):AsyncToken
		{
			log.debug("[摘牌页面]:摘牌页面cmd捕获事件...");
			return medalDao.queryDelisted(e.startTime, e.endTime);
		}

		public function result(data:Object):void
		{
			log.debug("[摘牌页面] result info...");
			log.debug(data);
			medalDetailDM.pickOffMedalInfo.removeAll();
			medalDetailDM.pickOffMedalInfo.addAll(data as IList);
			medalDetailDM.pickOffMedalInfo.refresh();
			log.debug("[摘牌页面] 基本信息...");
			log.debug(medalDetailDM.pickOffMedalInfo);

			medalDetailDM.pickOffMedalChar.removeAll();
			medalDetailDM.pickOffMedalChar.addAll(data as IList);
			medalDetailDM.pickOffMedalChar.refresh();
			log.debug("[摘牌页面] 图表信息...");
			log.debug(medalDetailDM.pickOffMedalChar);
			if (medalDetailDM.pickOffMedalChar.length > 0)
			{
				medalDetailDM.pickOffMedalChar.removeItemAt(medalDetailDM.pickOffMedalChar.length - 1);
			}
			var e:GedalDetailEvent = new GedalDetailEvent(GedalDetailEvent.SHOW_PICK_OFF_CHAR_INFO);
			msgDispatcher(e);
		}

		public function error(f:Fault):void
		{
			log.error("[摘牌页面]:cmd返回失败..." + f.faultString + "," + f.faultDetail);
		}
	}
}

