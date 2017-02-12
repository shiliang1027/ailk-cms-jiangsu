package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import com.linkage.module.cms.scene.dao.ScenePanelDao;
	import com.linkage.module.cms.scene.domain.EmgyResourceDM;
	import com.linkage.module.cms.scene.domain.KPISituationDM;
	import com.linkage.module.cms.scene.event.KPISituationEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-8-1
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class KPISituJWeiCmd
	{
		private var log:ILogger = Log.getLoggerByClass(KPISituJWeiCmd);

		[Inject("kPISituationDM")]
		public var stuationDM:KPISituationDM;

		[Inject("scenePanelDao")]
		public var scenePanelDao:ScenePanelDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:KPISituationEvent):AsyncToken
		{
			log.debug("[应急调度]:经纬度数据execute开始执行...");
			log.debug(e.param);
			return this.scenePanelDao.getSceneEmgyChg(e.param.emgyResId, e.param.beginTime, e.param.endTime);
		}

		public function result(data:Object):void
		{
			stuationDM.situationJWinfo = data;
			log.debug("[应急调度]:经纬度信息返回数据." + data);

			var e:KPISituationEvent = new KPISituationEvent(KPISituationEvent.SHOW_KPI_PLAN);
			e.kpiPlanData.removeAll();
			e.kpiPlanData.addAll(data as IList);
			msgDispatcher(e);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("[应急调度]:资源调度返回失败error..." + f.faultString + "###" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}

