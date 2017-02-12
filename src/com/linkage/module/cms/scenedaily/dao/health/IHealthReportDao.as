package com.linkage.module.cms.scenedaily.dao.health
{
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-8-29
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IHealthReportDao
	{
		/**
		 *加载健康报告数据
		 */
		function getHealthReport(param:Object):AsyncToken;

		/**
		 *加载病历卡数据
		 */
		function getCaseCard(param:Object):AsyncToken;
	}
}