package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import com.linkage.module.cms.scene.dao.AreaQuickConfigDao;
	import com.linkage.module.cms.scene.dao.MapViewDao;
	import com.linkage.module.cms.scene.domain.MapViewDM;
	import com.linkage.module.cms.scene.event.SceneEvent;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2013-3-11
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadSourceByPointsCmd
	{
		private var log:ILogger = Log.getLoggerByClass(LoadSourceByPointsCmd);

		[Inject("mapViewDao")]
		public var dao:MapViewDao;
		[Inject("mapViewDM")]
		public var mapViewDM:MapViewDM;
		[MessageDispatcher]
		public var msgDispatcher:Function;


		public function execute(e:SceneEvent):AsyncToken
		{
			log.debug("比例尺加载MO参数");
			log.info(e.param);
			return dao.queryMoContains(e.param);
		}

		public function result(data:Object):void
		{
			log.debug("大于8000比例尺返回网元信息....");
			log.debug(data);
			mapViewDM.bilichiList.removeAll();
			mapViewDM.bilichiList.addAll(data as IList);
			mapViewDM.bilichiList.refresh();
			log.debug("比例尺返回数据集...");
			log.debug(mapViewDM.bilichiList);

//			log.debug(new XML(data.xmlStr));
//			mapViewDM.bilichiList.removeAll();
//			forEachTree(new XML(data.xmlStr), function(node:XML):void
//				{
//					var temp:Object = new Object;
//					if (node.hasOwnProperty('@isSave'))
//					{
//						if (node.@type == "jz_16" || node.@type == "jz_28" || node.@type == "cell_101" || node.@type == "cell_102")
//						{
//							temp.longitude = String(node.@x);
//							temp.latitude = String(node.@y);
//							temp.typePic = String(node.@type);
//							temp.id = String(node.@id);
//							temp.name = String(node.@label);
//							mapViewDM.bilichiList.addItem(temp);
//						}
//					}
//				});
//			mapViewDM.bilichiList.refresh();

			var evt:SceneEvent = new SceneEvent(SceneEvent.CMS_SCENE_SCENEVIEW_SOURCEBYPOINTS_COMP);
			msgDispatcher(evt);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

//
//		//向下迭代
//		private function forEachTree(node:XML, callback:Function = null):void
//		{
//			for each (var child:XML in node.children())
//			{
//				if (callback is Function)
//				{
//					callback.call(null, child);
//				}
//
//				if (child.hasComplexContent())
//				{
//					forEachTree(child, callback);
//				}
//			}
//		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString + "," + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}