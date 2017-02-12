package com.linkage.module.cms.general.monitor.datamanager
{
	public interface ImageServ
	{
		/**
		 * 查询所有图标信息
		 * @return
		 */
		function getAllTopoIconInfo(success:Function, complete:Function = null, error:Function = null):void;
	}
}