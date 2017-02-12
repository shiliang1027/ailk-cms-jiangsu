package com.linkage.module.cms.gsscene.view.components.performanceindex.dao
{
	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-7-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */

	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;

	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	public class PerformanceIndexDao implements IPerformanceIndexDao
	{
		private var log:ILogger = Log.getLoggerByClass(PerformanceIndexDao);

		private var _destination:String;
		private var _endpoint:String;

		[Inject("user")]
		public var user:IUser;

		private var rmtObj:RemoteObject;

		public function init():void
		{
			if (rmtObj == null)
			{
				rmtObj = new RemoteObject(_destination);
				rmtObj.endpoint = _endpoint;
				rmtObj.showBusyCursor = false;
			}
		}

		//GIS网元 区域缩略图悬浮信息
		public function loadData():AsyncToken
		{
			init();
			log.info(user);
			return rmtObj.getScene(user);
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

