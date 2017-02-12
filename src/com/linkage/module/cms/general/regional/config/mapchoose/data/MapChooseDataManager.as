package com.linkage.module.cms.general.regional.config.mapchoose.data
{
	/**
	 * 该as的描述信息
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2011-6-30 下午02:35:23
	 * @category com.linkage.module.cms.general.regional.config.mapchoose.data
	 * @copyright 南京联创科技 网管开发部
	 */
	public interface MapChooseDataManager
	{
		function queryMapContainsMo(param:Object, index:Object, success:Function,complete:Function=null,error:Function=null):void;
		function queryHasMapMo(monitorId:Object, index:Object, success:Function,complete:Function=null,error:Function=null):void;
		function getAreaBorder(param:Object, index:Object, success:Function,complete:Function=null,error:Function=null):void;
	}
}