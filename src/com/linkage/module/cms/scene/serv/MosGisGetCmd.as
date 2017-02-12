package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.IMapViewDao;
	import com.linkage.module.cms.scene.domain.common.IUser;
	import com.linkage.module.cms.scene.event.SceneEvent;
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-12-28
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MosGisGetCmd
	{
		private var log:ILogger = Log.getLoggerByClass(MosGisGetCmd);

		[Inject("mapViewDao")]
		public var mapViewDao:IMapViewDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		[Inject("user")]
		public var user:IUser;

		public function execute(e:SceneEvent):AsyncToken
		{
			log.info("获取多网元gis定位数据~!");
			if (e.param)
			{
				var ac:ArrayCollection = new ArrayCollection();
				for each (var obj:Object in e.param)
				{
					obj.sceneId = user.sceneId;
					obj.level = user.level;
					obj.cityId = user.cityId;
					ac.addItem(obj);
				}
				e.param = ac;
			}
			return mapViewDao.getMultiMoLatitudeByMoId(e.param);
		}

		public function result(data:Object):void
		{
			log.info("获取多网元gis定位数据~ success!");
			if (data != null)
			{
				var temp:Object = clone(data);
				log.info(temp);

				//log.info("获取网元gis定位数据success，抛出事件向地图上撒相应网元~SHOW_MOGIS_LAYER!");
				var evt:SceneEvent = new SceneEvent(SceneEvent.SHOW_MOGIS_LAYER);
				evt.param = temp;
				msgDispatcher(evt);

//				log.info("获取网元gis定位数据success，抛出事件向地图上撒相应网元~SHOW_MULT_MOGIS_LAYER!");
//				var evt:SceneEvent = new SceneEvent(SceneEvent.SHOW_MULT_MOGIS_LAYER);
//
//				evt.param = temp;
//				msgDispatcher(evt);
			}
			else
			{
				log.info("data is null!");
			}
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("获取多网元gis定位数据~ error:" + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
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