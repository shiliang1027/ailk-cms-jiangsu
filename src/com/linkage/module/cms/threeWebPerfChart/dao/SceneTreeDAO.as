package com.linkage.module.cms.threeWebPerfChart.dao
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;

	import flash.utils.ByteArray;

	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-7-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneTreeDAO implements ISceneTreeDAO
	{
		private var log:ILogger = Log.getLoggerByClass(SceneTreeDAO);

		private var _destination:String;
		private var _endpoint:String;

		private var rmtObj:RemoteObject;

		public function init(param:Object = null):void
		{
			if (rmtObj == null)
			{
				rmtObj = new RemoteObject(_destination);
				rmtObj.endpoint = _endpoint;
				rmtObj.showBusyCursor = false;
			}
			
//			if (param != null)
//			{
//				user.getImportParamsForRemoteObject(param);
//			}
		}

		[Inject]
		public var user:IUser;

		/**
		 * 获取场景导航tree
		 * */
		public function getSceneAreaList(param:Object = null):AsyncToken
		{
			log.info("获取场景导航tree 调用java接口getSceneAreaList，参数如下");
			param.flag = "0";
			param.level = "1";
			param.logicalType = "1";
			param.sceneTypeId = "6";
			param.sceneId = "1006";
			param.areaId = "1";
			param.cityId = "00";
			return rmtObj.getSceneAreaList(param);
		}
		/**
		 * 获取场景导航tree
		 * */
		public function getSceneTree(param:Object = null):AsyncToken
		{
			
			Alert.show("444");
			log.info("获取场景导航tree 调用java接口getSceneTree，参数如下");
			param.level = "1";
			param.logicalType = "1";
			param.sceneTypeId = "6";
			param.sceneId = "1006";
			param.areaId = "1";
			param.cityId = "00";
//			init(param);
			return rmtObj.getSceneTree(param);
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

