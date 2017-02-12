package com.linkage.module.cms.gsscene.view.components.mapvector.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.util.GsSceneConts;
	import com.linkage.module.cms.gsscene.view.components.mapvector.MapVectorDM;
	import com.linkage.module.cms.gsscene.view.components.mapvector.dao.IMapVectorDAO;
	import com.linkage.module.cms.gsscene.view.components.mapvector.demo.DemoDatas;
	import com.linkage.module.cms.gsscene.view.components.mapvector.event.MapVectorEvent;
	
	import flash.events.Event;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-10-14
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class MapVectorDyeCmd
	{
		private var log:ILogger = Log.getLoggerByClass(MapVectorDyeCmd);

		[Inject("mapVectorDAO")]
		public var dao:IMapVectorDAO;

		[Inject("mapVectorDM")]
		public var dm:MapVectorDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:MapVectorEvent):AsyncToken
		{
			log.info("[矢量地图]获取渲染数据MapVectorDyeCmd：dm:");
			log.info(dm);
			switch(dm.loadMapInfoType)
			{
				case GsSceneConts.loadMapInfoType_alarm:
				{
					//1-表示查询设备，性能告警网元数；
					return dao.queryCityAlarmNum();
					break;
				}
				case GsSceneConts.loadMapInfoType_quit:
				{
					//2-表示退服的2G，3G，4G网元数；
					return dao.queryCityQuitNum();
					break;
				}
				case GsSceneConts.loadMapInfoType_area:
				{
					//3-表示查询区域相关信息;
					return dao.queryCityAreaNum();
					break;
				}
				case GsSceneConts.loadMapInfoType_kpi:
				{
					//4-表示查询某项 指标的值。
					return dao.queryCityKpiValue();
					break;
				}
				default:
				{
					return dao.queryCityAlarmNum();
					break;
				}
			}
		}

		public function result(obj:Object):void
		{
			log.info("调用[矢量地图]接口获取数据结果 success!");
			log.info(obj);
			dm.dyeMap = obj;

			//抛出事件，加载获取的数据	
			dispatchMsg(new MapVectorEvent(MapVectorEvent.CMS_SCENE_GENERAL_MAPVECTOR_DYEMAP));
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			dispatchMsg(new Event("REQUEST_COMPLETE"));
			log.info("测试MapVectorDyeCmd：");
//			dm.dyeMap = DemoDatas._initMapData;
			log.error("加载[矢量地图]数据错误：" + f.faultString + "\n" + f.faultDetail);
		}

	}
}

