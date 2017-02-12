package com.linkage.module.cms.gsscene.view.components.sceneintro.dao
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

	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;

	import mx.rpc.AsyncToken;

	public interface ISceneToolTipDao
	{
		function updateSceneInfo(params:Object):AsyncToken;
		function sceneIntroduction(obj:Object):AsyncToken;
	}

}