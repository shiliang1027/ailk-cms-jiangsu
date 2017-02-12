package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import com.linkage.module.cms.scene.dao.IScenePanelDao;
	import com.linkage.module.cms.scene.domain.KPISituationDM;
	import com.linkage.module.cms.scene.event.KPISituationEvent;
	
	import flash.events.Event;
	
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-9-10
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class BadTopNMatrixCmd
	{
		private var log:ILogger = Log.getLoggerByClass(BadTopNMatrixCmd);

		[Inject("scenePanelDao")]
		public var dao:IScenePanelDao;

		[Inject("kPISituationDM")]
		public var dm:KPISituationDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		private var systime:Number = 0;

		public function execute(e:KPISituationEvent):AsyncToken
		{
			log.debug("strKpiId" + e.strKpiId + "strMoTypeId" + e.strMoTypeId);
			systime = (new Date()).getTime();
			return dao.getSceneTopNAll(e.strKpiId, e.strMoTypeId);
		}

		public function result(obj:Object):void
		{
			log.warn("耗时：{0}", (new Date).getTime() - systime);
			log.info("调用[劣化topn矩阵]接口获取数据结果 success!");
			dm.badTopnMatrixList.removeAll();
			dm.badTopnMatrixList.addAll(obj as IList);
			dm.badTopnMatrixList.refresh();

			//抛出事件，加载获取的数据	
			dispatchMsg(new KPISituationEvent(KPISituationEvent.DEAL_BADTOPN_SHOWGRID));
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("加载[劣化topn矩阵]数据错误：" + f.faultString);
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

	}
}

