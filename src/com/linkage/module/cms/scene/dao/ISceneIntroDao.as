package com.linkage.module.cms.scene.dao
{
	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-7-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */

	import mx.rpc.AsyncToken;

	public interface ISceneIntroDao
	{
		function loadData():AsyncToken; //这个借口的名称问写java代码的人
		/**
		 *网元级列表指标详细信息
		 */
		function getMoTypeBadKpiList():AsyncToken;
	}

}