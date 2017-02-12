package com.linkage.module.cms.general.regional.data
{
	public interface MajorFailureServ
	{
		/**
		 * 获取业务影响范围
		 * 
		 * @param paramMap
		 *            {"monitor_id":"场景ID"}
		 * 
		 * @return 
		 *         {"vip_num":"VIP基站数量","not_vip_num":"非VIP基站数量","supper_vip_num":"超级基站数量"
		 *         }
		 */
		function getServScopeData(paramMap:Object,success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 获取影响通讯能力数据
		 * 
		 * @param paramMap
		 *            {"monitor_id":"场景ID","rate":"系数比","avg_tel_num":"平均通话数"}
		 * @return {"ability_num":"影响的通讯能力","user_num":"影响的用户数"}
		 */
		function getAbilityData(paramMap:Object,success:Function, complete:Function = null, error:Function = null):void;
	}
}