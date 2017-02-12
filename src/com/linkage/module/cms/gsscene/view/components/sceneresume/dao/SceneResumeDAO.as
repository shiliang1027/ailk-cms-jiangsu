package com.linkage.module.cms.gsscene.view.components.sceneresume.dao
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-8-1
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneResumeDAO implements ISceneResumeDAO
	{
		private var log:ILogger = Log.getLoggerByClass(SceneResumeDAO);


		[Inject("user")]
		public var user:IUser;

		private var _destination:String;
		private var _endpoint:String;
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

		public function getSceneGeneralInfo():AsyncToken
		{
			log.info("获取场景概要调用java接口getSceneGeneralInfo(user)，参数如下:");
			init();
			return rmtObj.getSceneGeneralInfo(user);
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

