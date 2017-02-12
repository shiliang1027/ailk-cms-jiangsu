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

	public class LoadLegendDataCmd
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
			log.info("【图例配置】传入参数=====================");
			log.info(e.param);
//			var result:Object=new ArrayCollection([{"color": "#0000", "legend_name": "0-100", "left": "0", "right": "100"}, {"color": "#0002", "legend_name": "100-200", "left": "100", "right": "200"}, {"color": "#0003", "legend_name": "200-1300", "left": "200", "right": "1300"}]);
//			test(result);
//			return null;
			return dao.loadLegendData(e.param);
		}

		public function test(data:Object):void
		{
			log.info("【图例配置】返回结果");
			//log.info(data);
			dm.colorLegends.removeAll();
			dm.colorLegends.addAll(data as IList);
			dm.colorLegends.refresh();
			dispatchMsg(new RoamEvent(RoamEvent.LOAD_LEGEND_DATA_COMPLETE));
		}

		public function result(data:Object):void
		{
			log.info("返回结果");
			log.info(data);
			dm.colorLegends.removeAll();
			dm.colorLegends.addAll(data as IList);
			dm.colorLegends.refresh();
			dispatchMsg(new RoamEvent(RoamEvent.LOAD_LEGEND_DATA_COMPLETE));
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);
			//Alert.show("加载图例数据错误：\n" + f.faultString);
		}
	}
}

