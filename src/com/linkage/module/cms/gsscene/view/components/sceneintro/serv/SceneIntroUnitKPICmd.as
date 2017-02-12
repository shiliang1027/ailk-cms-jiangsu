package com.linkage.module.cms.gsscene.view.components.sceneintro.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
	import com.linkage.module.cms.gsscene.view.components.sceneintro.SceneIntroDM;
	import com.linkage.module.cms.gsscene.view.components.sceneintro.dao.ISceneIntroDao;
	import com.linkage.module.cms.gsscene.view.components.sceneintro.event.SceneIntroEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *区域级网元指标详细信息cmd处理类
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-9-25
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneIntroUnitKPICmd
	{
		private var log:ILogger = Log.getLoggerByClass(SceneIntroUnitKPICmd);

		[Inject("sceneIntroDao")]
		public var dao:ISceneIntroDao;

		[Inject("user")]
		public var user:IUser;

		[Inject("sceneIntroDM")]
		public var sceneIntroDM:SceneIntroDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		private var systime:Number = 0;

		public function execute(e:SceneIntroEvent):AsyncToken
		{
			log.info("场景介绍 劣化指标详情cmd 加载数据！");
			systime = (new Date()).getTime();
			return dao.getMoTypeBadKpiList();
		}

		public function result(data:Object):void
		{
			log.warn("耗时：{0}", (new Date).getTime() - systime);
			log.debug("场景介绍 劣化指标详情: result info");

			sceneIntroDM.areaNums = data['areaNums'];
			log.debug("areaNums");
			log.debug(sceneIntroDM.areaNums);

			sceneIntroDM.areaBadNums = data['areaBadNums'];
			log.debug("areaBadNums");
			log.debug(sceneIntroDM.areaBadNums);

			sceneIntroDM.moBadNums = data['moBadNums'];
			log.debug("moBadNums");
			log.debug(sceneIntroDM.moBadNums);

			sceneIntroDM.areaBadList.removeAll();
			sceneIntroDM.areaBadList.addAll(data['areaBadList'] as IList);
			sceneIntroDM.areaBadList.refresh();
			log.debug("areaBadList:{0}", sceneIntroDM.areaBadList.length);


			sceneIntroDM.moBadList.removeAll();
			sceneIntroDM.moBadList.addAll(data['moBadList'] as IList);
			sceneIntroDM.moBadList.refresh();
			log.debug("moBadList:{0}", sceneIntroDM.moBadList.length);
			dispatchMsg(new SceneIntroEvent(SceneIntroEvent.SHOW_MO_KPI_INFO));
			
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			dispatchMsg(new Event("REQUEST_COMPLETE"));
			log.error("场景介绍 劣化指标详情cmd 加载数据错误：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}

