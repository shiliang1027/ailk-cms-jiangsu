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

	public class LoadRoamDataCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadRoamDataCmd);

		[Inject("roamDM")]
		public var dm:RoamDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject("roamDAO")]
		public var dao:RoamDAO;

		public function execute(e:RoamEvent):AsyncToken
		{
			log.info("【加载地图列表】传入参数");
			log.info(e.param);
//			var result:ArrayCollection=new ArrayCollection([{"city_id": "0200", "cityName": "无锡", "roam_num": "100", "roam_traffic": "200"}, {"city_id": "0100", "cityName": "南京", "roam_num": "100", "roam_traffic": "200"}
//
//				]);
//			test(result);
//			return null;
			return dao.getSceneRoamList(e.param);
		}

		public function test(data:Object):void
		{
			log.info("【加载地图列表】返回结果");
			log.info(data);
			dm.mapDadaList.removeAll();
			dm.mapDadaList.addAll(data as IList);
			dm.mapDadaList.refresh();
			dispatchMsg(new RoamEvent(RoamEvent.CREAT_MAP_RECL));
		}

		public function result(data:Object):void
		{
			log.info("返回结果");
			log.info(data);
			dm.mapDadaList.removeAll();
			dm.mapDadaList.addAll(data as IList);
			dm.mapDadaList.refresh();
			dispatchMsg(new RoamEvent(RoamEvent.CREAT_MAP_RECL));
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);
			//Alert.show("加载数据错误：\n" + f.faultString);
		}
	}
}

