package com.linkage.module.cms.scene.serv.roam
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.roam.RoamDAO;
	import com.linkage.module.cms.scene.domain.roam.RoamDM;
	import com.linkage.module.cms.scene.event.roam.RoamEvent;

	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class SaveLegendDataCmd
	{
		private var log:ILogger=Log.getLoggerByClass(SaveLegendDataCmd);

		[Inject("roamDM")]
		public var dm:RoamDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject("roamDAO")]
		public var dao:RoamDAO;

		public function execute(e:RoamEvent):AsyncToken
		{
			log.info("【保存图例】传入参数=====================");
			log.info(e.param);
//			var result:Object="保存成功";
//			test(result);
//			return null;
			return dao.saveLegendData(e.param);
		}

		public function test(data:Object):void
		{
			log.info("【保存图例】返回结果");
			log.info(data.toString());
			dm.result=data.toString();
			dispatchMsg(new RoamEvent(RoamEvent.SAVE_ROAM_LEGEND_DATA_COMPLETE));
		}

		public function result(data:Object):void
		{
			log.info("返回结果");
			log.info(data.toString());
			dm.result=data.toString();
			dispatchMsg(new RoamEvent(RoamEvent.SAVE_ROAM_LEGEND_DATA_COMPLETE));
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);
			//Alert.show("保存图例数据错误：\n" + f.faultString);
		}
	}
}

