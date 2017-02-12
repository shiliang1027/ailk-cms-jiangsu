package com.linkage.module.cms.gsscene.view.components.mapview.dao
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;

	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	public class MapViewDao implements IMapViewDao
	{
		private var log:ILogger = Log.getLoggerByClass(MapViewDao);

		private var _destination:String;
		private var _endpoint:String;

		private var rmtObj:RemoteObject;

		[Inject("user")]
		public var user:IUser;

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

		//区域缩略图
		public function getRegionImgs():AsyncToken
		{
			init();
			return rmtObj.getSceneImg(user);
		}

		//泰森多边形
		public function getScenePolygonData():AsyncToken
		{
			init();
			return rmtObj.getScenePolygon(user);
		}

		//地市图层
		public function getCityGisId():AsyncToken
		{
			init();
			return rmtObj.getCityGisId();
		}

		//重点指标
		public function getSceneImpKpi():AsyncToken
		{
			init();
			return rmtObj.getImpKpi(user);
		}

		//加载退服原因
		public function getOutServerReason():AsyncToken
		{
			init();
			return rmtObj.getOutServerReason(user);
		}

		//加载道路场景 区域的劣化情况。
		public function getCityRoadIndicatorLight():AsyncToken
		{
			init();
			return rmtObj.getCityRoadIndicatorLight(user);
		}

		//网元gis定位
		public function getMoLatitudeByMoId(param:Object):AsyncToken
		{
			init(param);
			log.info("getMoLatitudeByMoId:参数");
			log.info(param);
			return rmtObj.getMoLatitudeByMoId(param);
		}

		public function queryMoByCon(param:Object):AsyncToken
		{
			init(param);
			log.info("queryMoByCon接口:参数");
			log.info(param);
			return rmtObj.queryMoByCon(param);
		}
		
		public function queryMoContains(param:Object):AsyncToken
		{
			init(param);
			log.info("queryMoContains接口:参数");
			log.info(param);
			return rmtObj.queryMoContainsMo(param);
		}
		//网元gis定位
		public function getMultiMoLatitudeByMoId(param:Object):AsyncToken
		{
			init();
			log.info("getMultiMoLatitudeByMoId:参数");
			if (param)
			{
				for each (var obj:Object in param)
				{
					obj.level = user.level;
					obj.sceneId = user.sceneId;
					obj.areaId = user.areaId;
					obj.cityId = user.cityId;
					obj.logicalType = user.logicalType;
				}
			}
			log.info(param);
			return rmtObj.getMultiMoLatitudeByMoId(param);
		}

		public function get destination():String
		{
			init();
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

