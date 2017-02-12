package com.linkage.module.cms.scenedaily.serv.leaderattention
{
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
	public class ImpLeaderDetailInfoCmd
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
			log.debug("cmd begin.....");
			return leaderAttentionPanelDao.getCaseDetail(e.param);
		}

		public function result(data:Object):void
		{
			log.debug("加载数据成功！");
			log.debug(data);
			dm.leaderDetailData.removeAll();
			dm.leaderDetailData.addAll(data as IList);
			dm.leaderDetailData.refresh();
			log.debug(dm.leaderDetailData);
		}

		public function error(f:Fault):void
		{
			log.error("加载数据错误：" + f.faultString + "," + f.faultDetail);
		}
	}
}

