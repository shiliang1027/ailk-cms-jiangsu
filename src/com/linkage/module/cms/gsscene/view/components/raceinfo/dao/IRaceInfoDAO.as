package com.linkage.module.cms.gsscene.view.components.raceinfo.dao
{
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2013-7-25
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IRaceInfoDAO
	{


		/**
		 * 保存赛事详细信息
		 * @param param
		 * @return
		 */
		function saveRaceInfos(param:Object):AsyncToken;

		/**
		 *批量修改赛事详细信息
		 * @param param
		 * @return
		 */
		function modifyRaceInfos(param:Object):AsyncToken;

		/**
		 *删除赛事信息
		 * @param param
		 * @return
		 */
		function deleteRaceInfos(param:Object):AsyncToken;
	}
}