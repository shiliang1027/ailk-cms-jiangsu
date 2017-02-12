package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.IMapVectorDAO;
	import com.linkage.module.cms.scene.domain.MapVectorDM;
	import com.linkage.module.cms.scene.event.MapVectorEvent;
	
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
			log.info("[矢量地图]获取渲染数据cmd：");
			return dao.getRendedcolorAndAreaNums();
		}

		public function result(obj:Object):void
		{
			log.info("调用[矢量地图]接口获取数据结果 success!");
			dm.dyeMap = obj;

			//抛出事件，加载获取的数据	
			dispatchMsg(new MapVectorEvent(MapVectorEvent.CMS_SCENE_GENERAL_MAPVECTOR_DYEMAP));
			
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("加载[矢量地图]数据错误：" + f.faultString + "\n" + f.faultDetail);
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

	}
}

