package com.linkage.module.cms.scenedaily.serv.leaderattention
{

	/**
	 *获取领导关注详情
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-12-10
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.leaderattention.LeaderAttentionPanelDao;
	import com.linkage.module.cms.scenedaily.domain.common.IUser;
	import com.linkage.module.cms.scenedaily.domain.leaderattention.LeaderAttentionPanelDM;
	import com.linkage.module.cms.scenedaily.event.leaderattention.LeaderAttentionPanelEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.utils.ObjectUtil;

	public class LeaderAttentionDetailCmd
	{
		private var log:ILogger = Log.getLoggerByClass(LeaderAttentionDetailCmd);

		[Inject("leaderAttentionPanelDao")]
		public var dao:LeaderAttentionPanelDao;

		[Inject("user")]
		public var user:IUser;

		[Inject("leaderAttentionPanelDM")]
		public var dm:LeaderAttentionPanelDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:LeaderAttentionPanelEvent):AsyncToken
		{
			log.info("领导关注详情 加载数据！");
			return dao.getLeaderAttentionDetail(e.param);
		}

		public function result(data:Object):void
		{

			var e:LeaderAttentionPanelEvent = new LeaderAttentionPanelEvent(LeaderAttentionPanelEvent.CMS_SCENEDAILY_LEADERATTENTIONPANEL_LEADERATTENTIONDETAILCMD);
			e.param = new Object();
			//重点指标超出健康门限
			dm.importantIndexList.removeAll();
			if (data.hasOwnProperty("impKpis"))
			{
				dm.importantIndexList.addAll(data['impKpis'] as IList);
				e.param.type = "1";
				e.param.totalRowCount = data['impKpisCount'];
				log.info("=====================impKpis:" + data['impKpisCount']);
			}
			dm.importantIndexList.refresh();

			dm.enUnhealthyList.removeAll();
			if (data.hasOwnProperty("unhealthKpis"))
			{
				dm.enUnhealthyList.addAll(data['unhealthKpis'] as IList);
				e.param.type = "2";
				e.param.totalRowCount = data['unhealthKpisCount'];
				log.info("=====================unhealthKpis:" + data['unhealthKpisCount']);
			}
			dm.enUnhealthyList.refresh();

			dm.enSubhealthyList.removeAll();
			if (data.hasOwnProperty("subhealthKpis"))
			{
				dm.enSubhealthyList.addAll(data['subhealthKpis'] as IList);
				e.param.type = "3";
				e.param.totalRowCount = data['subhealthKpisCount'];
				log.info("=====================subhealthKpis:" + data['subhealthKpisCount']);
			}
			dm.enSubhealthyList.refresh();

			dispatchMsg(e);
		}

		public function error(f:Fault):void
		{
			var importantIndexList:ArrayCollection = new ArrayCollection();

			var enUnhealthyList:ArrayCollection = new ArrayCollection();

			var enSubhealthyList:ArrayCollection = new ArrayCollection();


			dm.importantIndexList = importantIndexList;
			dm.enUnhealthyList = enUnhealthyList;
			dm.enSubhealthyList = enSubhealthyList;

			log.error("领导关注详情 加载数据错误：" + f.faultString + "," + f.faultDetail);
		}
	}
}