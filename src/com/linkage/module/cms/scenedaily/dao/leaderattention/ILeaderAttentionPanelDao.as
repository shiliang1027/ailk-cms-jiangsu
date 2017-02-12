package com.linkage.module.cms.scenedaily.dao.leaderattention
{
	import mx.rpc.AsyncToken;

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
	public interface ILeaderAttentionPanelDao
	{
		function loadData(param:Object):AsyncToken;
		/**
		 * 查询领导视图详细信息
		 */
		function getCaseDetail(param:Object):AsyncToken;

		/**
		 * 领导关注详情
		 * param.type 类型 1：重要性能指标  2：不健康网元 3：亚健康网元
		 */
		function getLeaderAttentionDetail(param:Object):AsyncToken;
	}
}