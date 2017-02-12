package com.linkage.module.cms.gsscene.view.components.kpicustom.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.kpicustom.dao.IKpiCustomDAO;
	import com.linkage.module.cms.gsscene.view.components.kpicustom.domain.KpiCustomDM;
	import com.linkage.module.cms.gsscene.view.components.kpicustom.event.KpiCustomEvent;

	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 * 查询指标数据服务类
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-11-14
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class KpiCustomKpisDataCMD
	{
		private var log:ILogger=Log.getLoggerByClass(KpiCustomKpisDataCMD);

		[Inject("kpiCustomDAO")]
		public var dao:IKpiCustomDAO;

		[Inject("kpiCustomDM")]
		public var dm:KpiCustomDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function KpiCustomKpisDataCMD()
		{
		}

		public function execute(e:KpiCustomEvent):AsyncToken
		{
			log.debug("[查询指标数据]");
			log.debug(e.param);
			dm.kpisData.removeAll();
			return dao.getSceneKpiData(e.param);

		}

		/**
		 *
		 * @param obj
		 *
		 */
		public function result(obj:Object):void
		{
//			var result:Object = {1:[{kpiID:"1",kpiName:"掉话率",moID:"1",moName:"BSC1",time:"2012/11/14 00:00:00",value:"23.2", threshold:"50" },{kpiID:"2",kpiName:"掉话率1",moID:"1",moName:"BSC1",time:"2012/11/14 00:00:00",value:"23.2", threshold:"50" }],2:[{kpiID:"1",kpiName:"掉话率",moID:"1",moName:"BSC1",time:"2012/11/14 00:00:00",value:"23.2", threshold:"50" },{kpiID:"2",kpiName:"掉话率1",moID:"1",moName:"BSC1",time:"2012/11/14 00:00:00",value:"23.2", threshold:"50" }]};
			log.debug(obj);
			dm.kpisData.addAll(obj as ArrayCollection);
//			dm.kpisData.removeAll();
//			for each(var item:* in obj){
//				dm.kpisData.addItem(item);
//				log.debug(item);
//			}
			dispatchMsg(new KpiCustomEvent(KpiCustomEvent.LOADKPIDATACOMPLETE));
		}

		public function error(f:Fault):void
		{
			log.error("[查询指标数据]失败：" + f.faultString);
//			var result:Object = [{kpiID:"1",kpiName:"掉话率",up_threshold:"23.1",down_threshold:"23",moOrAreas:[{id:"1",name:"bsc1"},{id:"2",name:"bsc2"}],datas:[{time:"2012-11-15 00:00:00",bsc1:"23.2",bsc2:"22.2",up_threshold:"53",down_threshold:"23"},{time:"2012-11-15 01:00:00",bsc1:"23.2",bsc2:"22.2",up_threshold:"53",down_threshold:"23"},{time:"2012-11-15 02:00:00",bsc1:"23.2",bsc2:"22.2",up_threshold:"53",down_threshold:"23"},{time:"2012-11-15 03:00:00",bsc1:"23.2",bsc2:"22.2",up_threshold:"53",down_threshold:"23"},{time:"2012-11-15 05:00:00",bsc1:"23.2",bsc2:"22.2",up_threshold:"53",down_threshold:"23"},{time:"2012-11-15 06:00:00",bsc1:"23.2",bsc2:"22.2",up_threshold:"53",down_threshold:"23"},{time:"2012-11-15 07:00:00",bsc1:"23.2",bsc2:"22.2",up_threshold:"53",down_threshold:"23"}]},{kpiID:"2",kpiName:"切换成功率",up_threshold:"53",down_threshold:"23",moOrAreas:[{id:"1",name:"bsc1"},{id:"2",name:"bsc2"}],datas:[{time:"2012-11-15 00:00:00",bsc1:"23.2",bsc2:"22.2",up_threshold:"53",down_threshold:"23"},{time:"2012-11-15 01:00:00",bsc1:"23.2",bsc2:"22.2",up_threshold:"53",down_threshold:"23"},{time:"2012-11-15 02:00:00",bsc1:"23.2",bsc2:"22.2",up_threshold:"53",down_threshold:"23"},{time:"2012-11-15 03:00:00",bsc1:"23.2",bsc2:"22.2",up_threshold:"53",down_threshold:"23"},{time:"2012-11-15 05:00:00",bsc1:"23.2",bsc2:"22.2",up_threshold:"53",down_threshold:"23"},{time:"2012-11-15 06:00:00",bsc1:"23.2",bsc2:"22.2",up_threshold:"53",down_threshold:"23"},{time:"2012-11-15 07:00:00",bsc1:"23.2",bsc2:"22.2",up_threshold:"53",down_threshold:"23"}]}];
//			log.debug(result);
//			dm.kpisData = ArrayCollection(result);
//			dm.kpisData.removeAll();
//			for each(var item:* in result){
//				dm.kpisData.addItem(item);
//				log.debug(item);
//			}
//			log.debug(dm.kpisData);
//			dispatchMsg(new KpiCustomEvent(KpiCustomEvent.LOADKPIDATACOMPLETE));
			dispatchMsg(new KpiCustomEvent(KpiCustomEvent.LOADKPIDATAERROR));
		}
	}
}

