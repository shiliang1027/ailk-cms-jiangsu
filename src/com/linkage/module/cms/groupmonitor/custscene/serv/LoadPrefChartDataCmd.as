package com.linkage.module.cms.groupmonitor.custscene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.groupmonitor.custscene.dao.CustSceneDao;
	import com.linkage.module.cms.groupmonitor.custscene.domain.CustSceneDM;
	import com.linkage.module.cms.groupmonitor.custscene.event.CustSceneEvent;

	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-10-15
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class LoadPrefChartDataCmd
	{
		private var log:ILogger=Log.getLoggerByClass(LoadPrefChartDataCmd);

		[Inject]
		public var dm:CustSceneDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		[Inject]
		public var dao:CustSceneDao;

		public var perfTypeId:String;

		public function execute(e:CustSceneEvent):AsyncToken
		{
			log.info("趋势图参数");

			perfTypeId=e.param.perfTypeId;
			log.info(perfTypeId);
			return dao.getRealPm(e.param);
		}

		//test
		public function test(data:Object):void
		{
			log.info("趋势图返回值");
			log.info(data);
			var evt:CustSceneEvent=new CustSceneEvent(CustSceneEvent.LOAD_PREF_CHART_DATA_COMP);
			evt.param=data;
			dispatchMsg(evt);
		}

		public function result(data:Object):void
		{
			log.info("趋势图返回值");
			log.info(data);
			var evt:CustSceneEvent=new CustSceneEvent(CustSceneEvent.LOAD_PREF_CHART_DATA_COMP);
			evt.param=data;
			dispatchMsg(evt);
		}

		public function error(f:Fault):void
		{
			log.error("异常错误" + f.faultString);

			var isTest:Boolean=false;
			if (isTest)
			{
				var result:Object;
				//result={"showName": "接通率", "dataList": new ArrayCollection([{"time": "2012-08-12", "num": "50", "showName": "接通率"}, {"time": "2012-08-12", "num": "60", "showName": "接通率"}, {"time": "2012-08-12", "num": "70", "showName": "接通率"}, {"time": "2012-08-12", "num": "360", "showName": "接通率"}])};
				result={"experience": "55", "perfTypeId": perfTypeId, "total": new ArrayCollection([{"time": "2012-08-12", "num": "50", "id": "total"}, {"time": "2012-08-13", "num": "60", "id": "total"}, {"time": "2012-08-14", "num": "70", "id": "total"}, {"time": "2012-08-15", "num": "30", "id": "total"}]), "avg": new ArrayCollection([{"time": "2012-08-12", "num": "50", "id": "avg"}, {"time": "2012-08-13", "num": "60", "id": "avg"}, {"time": "2012-08-14", "num": "70", "id": "avg"}, {"time": "2012-08-15", "num": "360", "id": "avg"}]), "110102204492151": new ArrayCollection([{"id": "110102204492151", "time": "2012-08-12", "num": "30"}, {"id": "110102204492151", "time": "2012-08-13", "num": "30"}, {"id": "110102204492151", "time": "2012-08-14", "num": "40"}, {"id": "110102204492151", "time": "2012-08-15", "num": "23"}]), "110102204492152": new ArrayCollection([{"id": "110102204492152", "time": "2012-08-12", "num": "50"}, {"id": "110102204492152", "time": "2012-08-13", "num": "60"}, {"id": "110102204492152", "time": "2012-08-14", "num": "70"}, {"id": "110102204492152", "time": "2012-08-15", "num": "34"}])};
				test(result);
			}
		}
	}
}