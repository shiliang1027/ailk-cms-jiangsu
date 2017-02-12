package com.linkage.module.cms.gsscene.view.components.neroom.dao
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;

	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

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
	public class NeRoomDao implements INeRoomDao
	{
		private var _destination:String;
		private var _endpoint:String;

		private var log:ILogger = Log.getLoggerByClass(NeRoomDao);

		[Inject("user")]
		public var user:IUser;

		private var rmtObj:RemoteObject;

		[Init]
		public function init():void
		{
			if (rmtObj == null)
			{
				rmtObj = new RemoteObject(_destination);
				rmtObj.endpoint = _endpoint;
				rmtObj.showBusyCursor = false;
			}
		}

		public function getRoomInfoById(roomId:String):AsyncToken
		{
			return rmtObj.getRoomInfoById(roomId);
		}

		public function set destination(value:String):void
		{
			_destination = value;
		}

		public function set endpoint(value:String):void
		{
			_endpoint = value;
		}
	}
}