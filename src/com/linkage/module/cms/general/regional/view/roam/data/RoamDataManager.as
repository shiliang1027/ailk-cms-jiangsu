package com.linkage.module.cms.general.regional.view.roam.data
{
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-7-2 下午09:20:51
	 * @category com.linkage.module.cms.general.regional.view.roam.data
	 * @copyright 南京联创科技 网管开发部
	 */
	public interface RoamDataManager
	{
		/**
		 * 分页查询漫游数据
		 * @param param
		 * @param success
		 * @param complete
		 * @param error
		 * 
		 */		
		function roamQuery(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 *不分页查询漫游视图 
		 * @param param
		 * @param success
		 * @param complete
		 * @param error
		 * 
		 */		
		function roamQueryNoPage(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 *查询漫游统计数据 
		 * @param param
		 * @param success
		 * @param complete
		 * @param error
		 * 
		 */		
		function roamStatQuery(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 *查询漫游图例 
		 * @param param
		 * @param success
		 * @param complete
		 * @param error
		 * 
		 */		
		function roamLegendQuery(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 *保存图例 
		 * @param param
		 * @param success
		 * @param complete
		 * @param error
		 * 
		 */		
		function saveLegend(param:Object,success:Function,complete:Function=null,error:Function=null):void;
	}
}