package com.linkage.module.cms.gsscene.view.components.mapvector.dao
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.mapvector.dao.IMapVectorDAO;
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;

	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-10-14
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MapVectorDAO implements IMapVectorDAO
	{
		private var log:ILogger = Log.getLoggerByClass(MapVectorDAO);

		private var _destination:String;
		private var _endpoint:String;

		private var rmtObj:RemoteObject;

		[Inject("user")]
		public var user:IUser;

		public function init():void
		{
			if (rmtObj == null)
			{
				rmtObj = new RemoteObject(_destination);
				rmtObj.endpoint = _endpoint;
				rmtObj.showBusyCursor = false;
			}
		}

		public function queryCityAlarmNum():AsyncToken
		{
			log.info("[矢量地图]渲染数据[设备，性能告警网元数]获取，参数如下");
			init();
			log.info(user);
			return rmtObj.queryCityAlarmNum(user);
		}
		
		public function queryCityQuitNum():AsyncToken
		{
			log.info("[矢量地图]渲染数据[退服的2G，3G，4G网元数]获取，参数如下");
			init();
			log.info(user);
			return rmtObj.queryCityQuitNum(user);
		}	
		
		public function queryCityAreaNum():AsyncToken
		{
			log.info("[矢量地图]渲染数据[区域相关信息]获取，参数如下");
			init();
			log.info(user);
			return rmtObj.queryCityAreaNum(user);
		}	
		
		public function queryCityKpiValue():AsyncToken
		{
			log.info("[矢量地图]渲染数据[查询某项 指标的数据]获取，参数如下");
			init();
			log.info(user);
			return rmtObj.queryCityKpiValue(user);
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

