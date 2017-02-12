package com.linkage.module.cms.gsscene.view.components.mapview.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
	import com.linkage.module.cms.gsscene.view.components.common.event.SceneEvent;
	import com.linkage.module.cms.gsscene.view.components.mapview.MapViewDM;
	import com.linkage.module.cms.gsscene.view.components.mapview.dao.IMapViewDao;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.utils.ObjectUtil;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-10-19
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MoGisGetCmd
	{
		private var log:ILogger = Log.getLoggerByClass(MoGisGetCmd);

		[Inject("mapViewDao")]
		public var mapViewDao:IMapViewDao;

		[Inject("mapViewDM")]
		public var mapViewDM:MapViewDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		[Inject("user")]
		public var user:IUser;

		public function execute(e:SceneEvent):AsyncToken
		{
			log.info("获取网元gis定位数据~!");
			log.info(user);
			e.param.sceneId = user.sceneId;
			e.param.areaId = user.areaId;
			e.param.level = user.level;
			e.param.cityId = user.cityId;
			log.info(e.param);
			return mapViewDao.getMoLatitudeByMoId(e.param);
		}

		public function result(data:Object):void
		{
			log.info("获取网元gis定位数据~ success!");
			log.info(data);
			for(var k:* in data){
				log.info(k+"------->"+data[k]);
			}
			if (data != null)
			{
//				var temp:Object = clone(data);
//				log.info(temp);
				mapViewDM.gisPositionList.removeAll();
				mapViewDM.gisPositionList.addItem(data);
				mapViewDM.gisPositionList.refresh();
//				log.info(mapViewDM.gisPositionList);
				var evt:SceneEvent = new SceneEvent(SceneEvent.SEARCH_MOGIS_LAYER);
				msgDispatcher(evt);
			}
			else
			{
				log.info("data is null!");
			}
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("获取网元gis定位数据~ error:" + f.faultString + "\n" + f.faultDetail);
		}

		private function clone(source:Object):*
		{
			var copy:ByteArray = new ByteArray();
			copy.writeObject(source);
			copy.position = 0;
			return (copy.readObject());
		}
	}
}

