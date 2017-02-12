package com.linkage.module.cms.gsscene.view.components.quitservice.dao
{
	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-7-26
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

	public class QuitServiceDao implements IQuitServiceDao
	{
		private var _destination:String;
		private var _endpoint:String;

		private var log:ILogger = Log.getLoggerByClass(QuitServiceDao);

		[Inject("user")]
		public var user:IUser;

		private var rmtObj:RemoteObject;

		public function init(param:Object = null):void
		{
			if (rmtObj == null)
			{
				rmtObj = new RemoteObject(_destination);
				rmtObj.endpoint = _endpoint;
				rmtObj.showBusyCursor = false;
			}
			if (param != null)
			{
				user.getImportParamsForRemoteObject(param);
			}
		}
		
		public function getSceneQuitSvs():AsyncToken
		{
			log.info("退服统计  调用远程方法！");
			init();
			return rmtObj.getSceneQuitSvs(user); //getSceneQuitSvs---java的方法
		}

		//概括统计
		public function querySceneDevSheet():AsyncToken
		{
			log.info("概括统计调用远程方法！");
			init();
			return rmtObj.querySceneDevSheet(user);
		}

		public function queryCityQuitDataDetail(param:Object):AsyncToken
		{
			log.info("获取退服统计中地市查询的详情信息");
			init();
			param.level = user.level;
			param.logicalType = user.logicalType;
			param.sceneId = user.sceneId;
			param.areaId = user.areaId;
			log.info(param);
			return rmtObj.queryCityQuitDataDetail(param);
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

