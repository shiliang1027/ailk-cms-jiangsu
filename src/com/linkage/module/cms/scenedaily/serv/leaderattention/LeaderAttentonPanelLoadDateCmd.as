package com.linkage.module.cms.scenedaily.serv.leaderattention
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.leaderattention.LeaderAttentionPanelDao;
	import com.linkage.module.cms.scenedaily.domain.leaderattention.LeaderAttentionPanelDM;
	import com.linkage.module.cms.scenedaily.domain.common.IUser;
	import com.linkage.module.cms.scenedaily.event.leaderattention.LeaderAttentionPanelEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.utils.ObjectUtil;

	/**
	 *
	 *
	 * @author xudx (Ailk No.69291)
	 * @version 1.0
	 * @date 2012-8-20
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LeaderAttentonPanelLoadDateCmd
	{
		private var log:ILogger = Log.getLoggerByClass(LeaderAttentonPanelLoadDateCmd);

		[Inject("leaderAttentionPanelDao")]
		public var leaderAttentionPanelDao:LeaderAttentionPanelDao;

		[Inject("user")]
		public var user:IUser;

		[Inject("leaderAttentionPanelDM")]
		public var dm:LeaderAttentionPanelDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:LeaderAttentionPanelEvent):AsyncToken
		{
			log.info("领导介绍 加载数据！");
			return leaderAttentionPanelDao.loadData(e.param);
		}

		public function result(data:Object):void
		{
			log.info("领导关注 cmd 加载数据成功！");
			log.debug(ObjectUtil.copy(data['impKpisCount']) + "_" + ObjectUtil.copy(data['unhealthKpisCount']) + "_" + ObjectUtil.copy(data['subhealthKpisCount']));


//			//重点指标超出健康门限
//			dm.importantIndexList.removeAll();
//			dm.importantIndexList.addAll(data['impKpis'] as IList);
//			dm.importantIndexList.refresh();
//			log.info("=====================impKpis:" + dm.importantIndexList.length);
//
//			dm.enUnhealthyList.removeAll();
//			dm.enUnhealthyList.addAll(data['unhealthKpis'] as IList);
//			dm.enUnhealthyList.refresh();
//			log.info("=====================unhealthKpis:" + dm.enUnhealthyList.length);
//
//			dm.enSubhealthyList.removeAll();
//			dm.enSubhealthyList.addAll(data['subhealthKpis'] as IList);
//			dm.enSubhealthyList.refresh();
//			log.info("=====================subhealthKpis:" + dm.enSubhealthyList.length);


			if (data.hasOwnProperty("impKpisCount"))
				dm.importantIndexCount = "共有" + data['impKpisCount'] + "个重要性能指标超出健康门限";
			else
				dm.importantIndexCount = "共有0个重要性能指标超出健康门限";
//				dm.importantIndexCount = "共有" + dm.importantIndexList.length + "个重要性能指标超出健康门限";

			if (data.hasOwnProperty("unhealthKpisCount"))
				dm.enUnhealthyCount = "共有" + data['unhealthKpisCount'] + "个网元处于不健康状态";
			else
				dm.enUnhealthyCount = "共有0个网元处于不健康状态";
//				dm.enUnhealthyCount = "共有" + dm.enUnhealthyList.length + "个网元处于不健康状态";

			if (data.hasOwnProperty("subhealthKpisCount"))
				dm.enSubhealthyCount = "共有" + data['subhealthKpisCount'] + "个网元处于亚健康状态";
			else
				dm.enSubhealthyCount = "共有0个网元处于亚健康状态";
//				dm.enSubhealthyCount = "共有" + dm.enSubhealthyList.length + "个网元处于亚健康状态";
		}

		public function error(f:Fault):void
		{
			var importantIndexList:ArrayCollection = new ArrayCollection();

			var enUnhealthyList:ArrayCollection = new ArrayCollection();

			var enSubhealthyList:ArrayCollection = new ArrayCollection();


			dm.importantIndexCount = "共有0个重要性能指标超出健康门限";
			dm.enUnhealthyCount = "共有0个网元处于不健康状态";
			dm.enSubhealthyCount = "共有0个网元处于亚健康状态";

			dm.importantIndexList = importantIndexList;
			dm.enUnhealthyList = enUnhealthyList;
			dm.enSubhealthyList = enSubhealthyList;

			log.error("领导关注cmd 加载数据错误：" + f.faultString + "," + f.faultDetail);
		}
	}
}

