package com.linkage.module.cms.scenedaily.dao
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.domain.common.IUser;

	import mx.collections.ArrayList;
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-8-20
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class DailySheetFlowDAO implements IDailySheetFlowDAO
	{
		private var log:ILogger = Log.getLoggerByClass(DailySheetFlowDAO);

		private var _destination:String;
		private var _endpoint:String;
		private var rmtObj:RemoteObject;

		[Inject("user")]
		public var user:IUser;

		[Init]
		public function init():void
		{
			log.debug("[DailySheetFlowpDAO]:开始初始化...");
			rmtObj = new RemoteObject(this._destination);
			rmtObj.endpoint = this._endpoint;
			log.debug("[DailySheetFlowpDAO]:初始化成功");
		}

		/**
		 * 获取地图giskpi
		 */
		public function getSheetFlowData():AsyncToken
		{
			log.info("[DailySheetFlowpDAO]调用接口." + user.cityId);

			var param:ArrayList = new ArrayList();
			param.addItem("1")
			param.addItem("2")
			param.addItem("3")
			param.addItem("4")
			param.addItem("5")
			param.addItem("6")

			if(user.cityId == "00")
				return rmtObj.getAllProvinceCurrDispachWithName(param, "日常管理场景");
			else
				return  rmtObj.getFilterDispatchInfoWithName(user.cityId, "2", "", "日常管理场景");
		}

		public function get destination():String
		{
			return _destination;
		}

		public function set destination(value:String):void
		{
			_destination = value;
		}

		public function get endpoint():String
		{
			return _endpoint;
		}

		public function set endpoint(value:String):void
		{
			_endpoint = value;
		}

	}
}

