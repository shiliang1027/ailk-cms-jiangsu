package com.linkage.module.cms.scene.view.components
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.common.LoadManager;
	import com.linkage.module.cms.scene.domain.SportHistorySceneDM;
	import com.linkage.module.cms.scene.event.SceneEvent;
	import com.linkage.module.cms.scene.event.SportHistorySceneEvent;
	
	import flash.events.Event;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	
	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-7-26
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SportHistorySceneCompPM
	{
		private var log:ILogger = Log.getLoggerByClass(SportHistorySceneCompPM);

		[Inject("sportHistorySceneDM")]
		[Bindable]
		public var dm:SportHistorySceneDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
		//初始化dm中的一些参数
		public function initDM():void
		{
			dispatchMsg(new SportHistorySceneEvent("INIT_MINIMAPWORK_DM"));
		}

		//接口获取需要加载缩略图的数据
		public function loadMiniMapWork():void
		{
//			dispatchMsg(new SportHistorySceneEvent("LOAD_MINIMAPWORK_DATA"));
			requestServerUtil.addRequest(new SportHistorySceneEvent("LOAD_MINIMAPWORK_DATA"));
		}

		//加载缩略图
		public function checkShsComp():void
		{
			log.info("ailk_gis:mapwork 加载完成！");
			dm.mapInit = true;
		}
	}
}