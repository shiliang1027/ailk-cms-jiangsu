package com.linkage.module.cms.utils
{
	/**
	 * 服务暂停开启接口
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-7-25
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IServerPauseResume
	{
		function start():void;
		
		function stop():void;
		
		function get running():Boolean;
		
	}
}