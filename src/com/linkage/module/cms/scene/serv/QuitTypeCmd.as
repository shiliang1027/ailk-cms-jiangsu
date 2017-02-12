package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.IMapViewDao;
	import com.linkage.module.cms.scene.domain.MapViewDM;
	import com.linkage.module.cms.scene.event.SceneEvent;
	
	import flash.events.Event;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class QuitTypeCmd
	{
		private var log:ILogger = Log.getLoggerByClass(SnapshotCmd);

		[Inject("mapViewDM")]
		public var dm:MapViewDM;

		[Inject("mapViewDao")]
		public var dao:IMapViewDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:SceneEvent):AsyncToken
		{
			log.info("调用远程方法加载网元退服原因数据！");
			return dao.getOutServerReason();
		}

		public function result(data:Object):void
		{
			log.info("加载网元退服原因成功！");
			for (var obj:Object in data)
				dm.moIdFeatureMap[obj['neid']].attributes['quitType'] = obj['subject'];
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
		

		public function error(f:Fault):void
		{
			log.error("加载网元退服原因错误：" + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}
