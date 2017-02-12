package com.linkage.module.cms.gsscene.view.components.sceneintro
{
	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-7-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.gsscene.view.components.sceneintro.event.SceneIntroEvent;
	
	import flash.external.ExternalInterface;
	import flash.net.FileReference;


	public class SceneIntroPM
	{
		private var log:ILogger = Log.getLoggerByClass(SceneIntroPM);

		[Inject("sceneIntroDM")]
		[Bindable]
		public var sceneIntroDM:SceneIntroDM;
		
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;

		[MessageDispatcher]
		public var dispatchMsg:Function;
		private var fileRefer:FileReference = new FileReference();


		public function loadData():void
		{
			log.info("加载场景介绍数据！");

			var e:SceneIntroEvent = new SceneIntroEvent(SceneIntroEvent.LOAD_SCENEINFO_DATA);
//			dispatchMsg(e);
			requestServerUtil.addRequest(e);
		}

		//获取运动会当日活动详情
		public function getSceneTodayGameList():void
		{
			var e:SceneIntroEvent = new SceneIntroEvent(SceneIntroEvent.SHOW_SCENE_GAME_TODAY_DETAIL);
			dispatchMsg(e);
		}

		/**
		 * 获取网元级劣化网元指标信息
		 */
		public function getMoTypeBadKpiList():void
		{
			var e:SceneIntroEvent = new SceneIntroEvent(SceneIntroEvent.SHOW_UNIT_KPI_INFO);
//			dispatchMsg(e);
			requestServerUtil.addRequest(e);
		}
		
		public function loadSceneAllPersonsData():void
		{
			log.info("加载场景全网人数数据！");
			
			var e:SceneIntroEvent = new SceneIntroEvent(SceneIntroEvent.LOAD_SCENEINFO_DATA);
//			dispatchMsg(e);
			requestServerUtil.addRequest(e);
		}
		
		public function sceneIntroduction(obj:Object):void
		{
			var e:SceneIntroEvent = new SceneIntroEvent(SceneIntroEvent.LOAD_SCENEINTROINFO_DATA);
			e.obj = obj;
			log.info("sceneIntroduction");
			log.info(e.obj);
//			dispatchMsg(e);
			requestServerUtil.addRequest(e);
		}

		//导出
		public function export(type:String, datas:String):void
		{
			ExternalInterface.call("exportExcelLoc", "/cms/scene/loc/locAction!reportExcel.action", type, encodeURIComponent(datas));
//			var fileType:FileFilter = new FileFilter("Excel", "*.xls");
//			var fileTypes:Array = new Array(fileType);
//			fileUpDownLoad = new FileUpDownLoad();
//			var downLoadUrl:URLRequest = new URLRequest("/cms/scene/loc/locAction!reportExcel.action");
//			var downLoadData:URLVariables = new URLVariables();
//			downLoadData.datas = datas;
//			downLoadData.type = type;
//			fileUpDownLoad.downLoadUrl.data = downLoadData;
//			fileUpDownLoad.downLoadURLRequest = downLoadUrl;
//			fileUpDownLoad.fileFilters = fileTypes;
//			fileUpDownLoad.downLoad();
		}
		
		/**
		 * 获取加载 场景退服(某类基站)的详细基站列表。
		 */
		public function loadSceneQuitDetailList(params:Object):void
		{
			var e:SceneIntroEvent = new SceneIntroEvent(SceneIntroEvent.LOAD_SCENE_QUIT_DETAIL_DATA);
			e.params = params;
//			dispatchMsg(e);
			requestServerUtil.addRequest(e);
		}
		/**
		 * 1.获取点击场景退服(一类基站)的基站展示告警流水事件。
		 * 2.获取点击一级告警的性能和设备，告警等级展示告警流水事件。
		 */
		public function refreshAlarmFlow(params:Object):void
		{
			var e:SceneIntroEvent = new SceneIntroEvent(SceneIntroEvent.LOAD_REFRESH_ALARM_FLOW);
			e.params = params;
			dispatchMsg(e);
		}
		
		/**
		 * 获取  加载 场景一级告警网元的统计（按性能和设备统计）
		 */
		
		public function loadSceneAlarmStats():void
		{
			var e:SceneIntroEvent = new SceneIntroEvent(SceneIntroEvent.LOAD_SCENE_ALARMSTATS_DATA);
//			dispatchMsg(e);
			requestServerUtil.addRequest(e);
		}
	}
}

