package com.linkage.module.cms.scenedaily.dao.leaderattention
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.common.IUser;

	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	/**
	 *
	 *
	 * @author xudx (Ailk No.69291)
	 * @version 1.0
	 * @date 2012-8-17
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LeaderAttentionPanelDao implements ILeaderAttentionPanelDao
	{
		private var _destination:String;
		private var _endpoint:String;

		private var log:ILogger = Log.getLoggerByClass(LeaderAttentionPanelDao);

		[Inject("user")]
		public var user:IUser;

		private var rmtObj:RemoteObject; //RemoteObject 类使您可以访问远程应用程序服务器上的类。

		[Init]
		public function init():void
		{
			log.info("LeaderAttentionPanelDao  init begin!");
			rmtObj = new RemoteObject(_destination);
			rmtObj.endpoint = _endpoint;
			log.info("LeaderAttentionPanelDao  init end!");
		}

		public function loadData(param:Object):AsyncToken
		{

			log.info("LeaderAttentionPanelDao 领导关注方法！");
			param.cityId = user.cityId;
			param.interval = user.interval;
			param.isHealthOrThreshold = user.isHealthOrThreshold;
			param.gatherTime = user.gatherTime;
			param.viewType = user.viewType;
			log.info(param);
			return rmtObj.getLeaderAttention(param); //这个方法有待于需求
		}

		/**
		 * 查询领导视图详细信息
		 */
		public function getCaseDetail(param:Object):AsyncToken
		{
			log.debug("传入参数：");
			log.debug(param);
			return rmtObj.getCaseDetail(param);
		}

		//type 类型 1：重要性能指标  2：不健康网元 3：亚健康网元
		public function getLeaderAttentionDetail(param:Object):AsyncToken
		{
			log.info("LeaderAttentionPanelDao 获取[领导关注]数据详情！");
			param.cityId = user.cityId;
			param.interval = user.interval;
			param.isHealthOrThreshold = user.isHealthOrThreshold;
			param.gatherTime = user.gatherTime;
			param.viewType = user.viewType;
			param.resId = user.resId;
			param.resType = user.resType;
			log.info(param);

			return rmtObj.getLeaderAttention(param); //TODO 有待于进一步确认
		}

		public function set destination(value:String):void
		{
			_destination = value;
		}

		public function set endpoint(value:String):void
		{
			_endpoint = value;
		}
	}
}

