package com.linkage.module.cms.gsscene.view.components.kpicustom.dao
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	/**
	 *
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-11-14
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class KpiCustomDAO implements IKpiCustomDAO
	{
		private var log:ILogger = Log.getLoggerByClass(KpiCustomDAO);

		public var rmtObj:RemoteObject;

		private var _destination:String;
		private var _endpoint:String;
		
		[Inject("user")]
		public var user:IUser;
		
		[Init]
		public function init(param:Object = null):void
		{
			if (rmtObj == null)
			{
				rmtObj = new RemoteObject(_destination);
				rmtObj.endpoint = _endpoint;
				rmtObj.showBusyCursor = false;
				log.info("KpiCustomDAO.init" + _destination + "" + _endpoint);
			}
			if (param != null)
			{
				user.getImportParamsForRemoteObject(param);
			}
		}
		
		/**
		 * 查询场景区域列表
		 * @param param
		 * @return
		 *
		 */		
		public function getSceneAreas(param:Object):AsyncToken{
			init(param);
			return rmtObj.getSceneAreas(param);
		}
		/**
		 * 查询场景指标列表
		 * @param param
		 * @return
		 *
		 */		
		public function getSceneKpis(param:Object):AsyncToken{
			init(param);
			log.info("KpiCustomDAO.getSceneKpis");
			log.info(param);
			return rmtObj.getSceneKpis(param);
		}
		/**
		 * 查询场景网元列表
		 * @param param
		 * @return
		 *
		 */		
		public function getSceneMos(param:Object):AsyncToken{
			init(param);
			log.info("KpiCustomDAO.getSceneMos");
			log.info(param);
			return rmtObj.getSceneMos(param);
		}
		/**
		 * 查询场景网元类型
		 * @param param
		 * @return
		 *
		 */		
		public function getSceneMoTypes(param:Object):AsyncToken{
			init(param);
			return rmtObj.getSceneMoTypes(param);
		}

		/**
		 * 查询指标数据
		 * @param param
		 * @return
		 *
		 */		
		public function getSceneKpiData(param:Object):AsyncToken{
			init(param);
			return rmtObj.getSceneKpiData(param);
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

