package com.linkage.module.cms.scene.serv.sportsvenuesview
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scene.dao.sportsvenuesview.SportsVenuesDAO;
	import com.linkage.module.cms.scene.domain.sportsvenuesview.SportsVenuesDM;
	import com.linkage.module.cms.scene.event.sportsvenuesview.SportsVenuesEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	public class LoadDataListCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadDataListCmd);

		[Inject("sportsVenuesDM")]
		public var dm:SportsVenuesDM;

		[Inject("sportsVenuesDAO")]
		public var dao:SportsVenuesDAO;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:SportsVenuesEvent):AsyncToken
		{
			log.info("调用加载指标方法传入参数");
			return dao.loadDataList();
		}

		//test
		public function test(data:Object):void
		{
			log.info("调用加载指标方法返回结果" + data);
			log.info(data);
			dm.dataMap=null;
			dm.dataMap=data;
			dispatchMsg(new SportsVenuesEvent(SportsVenuesEvent.CREAT_COLUMN));
		}

		public function result(data:Object):void
		{
			log.info("调用加载指标方法返回结果" + data);
			log.info(data.header);
			log.info(data.datas);
			dm.dataMap=null;
			dm.dataMap=data;
			dispatchMsg(new SportsVenuesEvent(SportsVenuesEvent.CREAT_COLUMN));
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);
			Alert.show("加载表格数据错误：\n" + f.faultString);
		}
	}
}

