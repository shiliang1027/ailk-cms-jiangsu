package com.linkage.module.cms.scenedaily.dao.healthreport
{
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 *  @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-9-18
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IHealthReportSetDao
	{
		/**
		 * 查询健康分类设置左侧树信息
		 */
		function getHealthTreeInfo():AsyncToken;
		/**
		 *根据树节点ID和指标类别查询健康指标配置信息
		 */
		function getHealthKpiByCond(treeNodeId:String, kpiTypeId:String):AsyncToken;
		/**
		 * 保存健康报告分类信息
		 */
		function saveHealthReportInfo(saveObj:Object):AsyncToken;
	}
}