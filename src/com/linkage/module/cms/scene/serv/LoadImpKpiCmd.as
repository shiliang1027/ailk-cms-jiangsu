package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.IMapViewDao;
	import com.linkage.module.cms.scene.domain.MapViewDM;
	import com.linkage.module.cms.scene.domain.common.IUser;
	import com.linkage.module.cms.scene.event.SceneEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.utils.ObjectUtil;

	public class LoadImpKpiCmd
	{
		private var log:ILogger = Log.getLoggerByClass(LoadImpKpiCmd);

		[Inject("mapViewDM")]
		public var dm:MapViewDM;

		[Inject("mapViewDao")]
		public var dao:IMapViewDao;

		[Inject("user")]
		public var user:IUser;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		private var systime:Number = 0;

		public function execute(e:SceneEvent):AsyncToken
		{
			log.info("调用远程方法，加载 imp kpi 数据！");
			systime = (new Date()).getTime();
			return dao.getSceneImpKpi();
		}

		public function result(data:Object):void
		{
			log.warn("耗时：{0}", (new Date).getTime() - systime);
			log.info("加载 imp kpi 数据成功！" + data.length);

			dm.impKpiList.removeAll();
			dm.impKpiList.addAll(data as IList);

			log.info("派发 imp kpi 数据处理事件！");
			msgDispatcher(new SceneEvent(SceneEvent.DEAL_IMP_KPI));
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("加载 imp kpi 数据错误：" + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}

