package com.linkage.module.cms.scene.serv.roam
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.roam.RoamDAO;
	import com.linkage.module.cms.scene.domain.roam.RoamDM;
	import com.linkage.module.cms.scene.event.roam.RoamEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class LoadRoamChartDataCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadLegendDataCmd);

		[Inject("roamDM")]
		public var dm:RoamDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject("roamDAO")]
		public var dao:RoamDAO;

		public function execute(e:RoamEvent):AsyncToken
		{
			log.info("【趋势图】传入参数");
			log.info(e.param);
//			var result:Object=new ArrayCollection([{"time": "17:00", "roamNum": "100"}, {"time": "16:00", "roamNum": "200"}, {"time": "15:00", "roamNum": "30"}, {"time": "14:00", "roamNum": "300"}]);
//			test(result);
//			return null;
			return dao.getSceneTrains(e.param);
		}

		public function test(data:Object):void
		{
			log.info("【趋势图】返回结果");
			log.info(data);
			dm.chartDataList.removeAll();
			dm.chartDataList.addAll(data as IList);
			dm.chartDataList.refresh();
			dispatchMsg(new RoamEvent(RoamEvent.DROW_RAAM_CHART));
		}

		public function result(data:Object):void
		{
			log.info("返回结果");
			log.info(data);
			dm.chartDataList.removeAll();
			dm.chartDataList.addAll(data as IList);
			dm.chartDataList.refresh();
			dispatchMsg(new RoamEvent(RoamEvent.DROW_RAAM_CHART));
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);
			//Alert.show("加载趋势图数据错误：\n" + f.faultString);
		}
	}
}

