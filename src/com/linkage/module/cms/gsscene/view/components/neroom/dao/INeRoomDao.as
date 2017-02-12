package com.linkage.module.cms.gsscene.view.components.neroom.dao
{
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-11-29
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface INeRoomDao
	{
		function getRoomInfoById(roomId:String):AsyncToken;
	}
}