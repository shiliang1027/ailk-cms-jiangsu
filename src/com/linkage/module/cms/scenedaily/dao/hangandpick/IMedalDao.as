package com.linkage.module.cms.scenedaily.dao.hangandpick
{
	import mx.rpc.AsyncToken;

	/**
	 *
	 *
	 *  @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-9-13
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public interface IMedalDao
	{
		/**
		 *查询摘牌信息
		 */
		function queryDelisted(startTime:String, endTime:String):AsyncToken;
		/**
		 *查询摘牌网元详情
		 */
		function queryDelistedDetail(moId:String):AsyncToken;
		/**
		 *查询挂牌网元详情
		 */
		function queryListedDetail(moId:String):AsyncToken;
		/**
		 *查询历史网元信息
		 */
		function queryHisList(moId:String):AsyncToken;
	}
}