package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.gis.core.metry.GisPoint;
	
	import com.linkage.module.cms.scene.dao.IScenePanelDao;
	import com.linkage.module.cms.scene.domain.MapViewDM;
	import com.linkage.module.cms.scene.event.SceneEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class TyphoonMsgLoadCmd
	{
		private var log:ILogger = Log.getLoggerByClass(TyphoonMsgLoadCmd);

		[Inject("scenePanelDao")]
		public var panelDao:IScenePanelDao;

		[Inject("mapViewDM")]
		public var mapViewDM:MapViewDM;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:SceneEvent):AsyncToken
		{
			log.info("typhoon cmd load data!");
			return panelDao.getSceneTyphoonInfo(); //这个方法还不知道叫什么
		}

		public function result(data:Object):void
		{
			log.info("typhoon cmd load data success!" + data.length);
			mapViewDM.typhoonMsgList.removeAll();
			mapViewDM.typhoonMsgList.addAll(data as IList);
			mapViewDM.typhoonMsgList.refresh();

			mapViewDM.allTyphoonPoints = new Array;
//			mapViewDM.allTyphoonPointsSmooth = new Array;

			for each (var msg:Object in data)
			{
				mapViewDM.allTyphoonPoints.push(new GisPoint(Number(msg.longitude), Number(msg.latitude)));

				var ds:ArrayCollection = new ArrayCollection;
				ds.addItem({'key': '时间', 'value': msg.time});
				ds.addItem({'key': '气压', 'value': msg.air_pressure});
				ds.addItem({'key': '经度', 'value': msg.longitude});
				ds.addItem({'key': '纬度', 'value': msg.latitude});
				ds.addItem({'key': '风速', 'value': msg.windpower});
				mapViewDM.typhoonTimeMsgMap[msg.time] = ds;
			}


//			log.debug("typhoon cmd 处理轨迹点前:" + mapViewDM.allTyphoonPoints.length);
//			var p1:GisPoint;
//			var p2:GisPoint;
//			var x1:Number;
//			var x2:Number;
//			var y1:Number;
//			var y2:Number;
//
//			for(var index:Object in mapViewDM.allTyphoonPoints)
//			{
//				if(int(index) >= mapViewDM.allTyphoonPoints.length - 2)
//					break;
//
//				var nums:int = 0;
//				p1 = mapViewDM.allTyphoonPoints[index] as GisPoint;
//				p2 = mapViewDM.allTyphoonPoints[int(index) + 1] as GisPoint;
//
//				x1 = p1.x;
//				y1 = p1.y;
//				x2 = p2.x;
//				y2 = p2.y;
//
//				mapViewDM.allTyphoonPointsSmooth.push(p1);
//				var pn:GisPoint;
//
//				while(nums++ < 3)
//				{
//					pn = new GisPoint(x1 + (x2 - x1) * nums / 10, y1 + (y2 - y1) * nums / 10);
//					mapViewDM.allTyphoonPointsSmooth.push(pn);
//				}
//				mapViewDM.allTyphoonPointsSmooth.push(p2);
//			}
//
//			log.debug("typhoon cmd 处理轨迹点后:" + mapViewDM.allTyphoonPointsSmooth.length);
			log.info("typhoon cmd dispatch show event SHOW_TYPHOON!");
			msgDispatcher(new SceneEvent(SceneEvent.SHOW_TYPHOON));
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("typhoon cmd load data error:" + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}