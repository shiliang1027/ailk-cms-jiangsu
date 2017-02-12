package com.linkage.module.cms.gsscene.view.components.neroom.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.neroom.NeRoomDM;
	import com.linkage.module.cms.gsscene.view.components.neroom.dao.NeRoomDao;
	import com.linkage.module.cms.gsscene.view.components.neroom.event.NeRoomEvent;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

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
	public class LoadNeRoomDataCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadNeRoomDataCmd);

		[Inject("neRoomDao")]
		public var dao:NeRoomDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		[Inject("neRoomDM")]
		public var dm:NeRoomDM;

		public function execute(e:NeRoomEvent):AsyncToken
		{
			log.info("获取 机房信息~! " + e.data);
			return dao.getRoomInfoById(e.data.roomId);
		}

		public function result(data:Object):void
		{
			log.info("获取 机房信息~ success!");
			log.debug(data);
			dm.dataList.removeAll();
			dm.dataList.addAll(data as IList);
			dm.dataList.refresh();
			msgDispatcher(new NeRoomEvent(NeRoomEvent.LOAD_NEROOM_DATA_COMP));
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("加载 机房信息~ error:" + f.faultString + "\n" + f.faultDetail);
		}
	}
}