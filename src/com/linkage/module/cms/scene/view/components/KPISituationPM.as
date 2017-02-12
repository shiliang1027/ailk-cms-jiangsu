package com.linkage.module.cms.scene.view.components
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.scene.domain.KPISituationDM;
	import com.linkage.module.cms.scene.domain.common.IUser;
	import com.linkage.module.cms.scene.event.KPISituationEvent;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	
	import mx.controls.Alert;
	import mx.controls.ProgressBar;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-7-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class KPISituationPM
	{
		private var log:ILogger = Log.getLoggerByClass(KPISituationPM);

		[Inject("kPISituationDM")]
		[Bindable]
		public var kpiSituationDM:KPISituationDM;

		[Inject("user")]
		public var user:IUser;

		[MessageDispatcher]
		public var msgDispatcher:Function;
		private var fileRefer:FileReference = new FileReference();
		private var fileUpDownLoad:FileUpDownLoad;
		private var progressBar:ProgressBar;
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
		public function showKPISituationData():void
		{
			log.debug("[指标概况:]事件派发加载表格数据：" + KPISituationEvent.SHOW_KPI_DATA);
			var kpiSituationEvent:KPISituationEvent = new KPISituationEvent(KPISituationEvent.SHOW_KPI_DATA);
//			msgDispatcher(kpiSituationEvent);
			requestServerUtil.addRequest(kpiSituationEvent);
			//requestServerUtil.addRequest(new KPISituationEvent(KPISituationEvent.LOAD_LINE_DATA));
		}

		public function getTopnDataBySelectId(topnId:String):void
		{
			log.debug("[指标概况:] 当前kpi ID=" + topnId);

			var loadTOPNEvent:KPISituationEvent = new KPISituationEvent(KPISituationEvent.LOAD_TOPN_DATA);
			loadTOPNEvent.selectTopnId = topnId;
//			msgDispatcher(loadTOPNEvent);
			requestServerUtil.addRequest(loadTOPNEvent);
		}

		/**
		 * 根据kpiId获取历史数据图表展示
		 */
		public function getKpiHisByHistory(user:IUser):void
		{
//			log.debug("[指标概况:] 当前kpi ID=" + kpiId);

			var e:KPISituationEvent = new KPISituationEvent(KPISituationEvent.LOAD_LINE_DATA);
//			e.kpiId = kpiId;
//			e.moTypeId = moTypeId;
//			e.timeInterval = timeInterval;
//			msgDispatcher(e);
			requestServerUtil.addRequest(e);
		}

		[MessageHandler(selector="LOAD_LINE_DATA1")]
		public function kpiHisByHistory(e:KPISituationEvent):void
		{
			log.debug("[指标概况1:] ");
			log.debug(e.param);
			log.debug(user);
			var e1:KPISituationEvent = new KPISituationEvent(KPISituationEvent.LOAD_LINE_DATA);
//			user.kpiId = kpiSituationDM.param.kpiId;
//			user.moTypeId = kpiSituationDM.param.moTypeId;
//			user.timeInterval = kpiSituationDM.param.timeInterval;
			if (e.param.interval == null)
			{
				user.dateFlag = "1";
			}
			else
			{
				user.dateFlag = e.param.interval;
			}
			log.info("----user.dateFlag-----" + user.dateFlag);
//			msgDispatcher(e1);
			log.info(e1);
			requestServerUtil.addRequest(e1);
		}

		[MessageHandler(selector="LOAD_LINE_DATA2")]
		public function kpiHisByHistory1(e:KPISituationEvent):void
		{
			log.debug("[指标概况2:] ");
			log.info(e);
			if (user.level == "1" || user.level == "2")
			{
				user.cityId = "00";
			}
			else
			{
				user.cityId = e.param.cityId;
			}
			var e1:KPISituationEvent = new KPISituationEvent(KPISituationEvent.LOAD_LINE_DATA);
			msgDispatcher(e1);
			log.info(e1);
		}

		[MessageHandler(selector="LOAD_COMPARE_LINE_DATA")]
		public function kpiCompareChart(e:KPISituationEvent):void
		{
			log.debug("[指标概况1:] ");
			log.debug(e.param);
			log.debug(user);
			var e1:KPISituationEvent = new KPISituationEvent(KPISituationEvent.LOAD_LINE_DATA3);
			//			user.kpiId = kpiSituationDM.param.kpiId;
			//			user.moTypeId = kpiSituationDM.param.moTypeId;
			//			user.timeInterval = kpiSituationDM.param.timeInterval;
			if (e.param.interval == null)
			{
				user.dateFlag = "1";
			}
			else
			{
				user.dateFlag = e.param.interval;
			}
			log.info("----user.dateFlag-----" + user.dateFlag);
//			msgDispatcher(e1);
			log.info(e1);
			requestServerUtil.addRequest(e1);
		}

		/**
		 * 派发应急预案事件
		 */
		public function dispKPIPlan(kpiId:String):void
		{
			log.debug("[指标概况:]派发应急预案，当前kpiId=" + kpiId);
			var planEvent:KPISituationEvent = new KPISituationEvent(KPISituationEvent.LOAD_KPI_PLAN);
			planEvent.kpiId = kpiId;
//			msgDispatcher(planEvent);
			requestServerUtil.addRequest(planEvent);
		}

		//查询阈值配置指标未选择列表
		public function queryKpiNoSelect(param:Object):void
		{
			log.debug("[重点指标配置阈值查询指标:]查询未选择指标");
			var e:KPISituationEvent = new KPISituationEvent(KPISituationEvent.CMS_SCENE_KPISITUATION_NO_SELECT);
			e.param = param;
//			msgDispatcher(e);
			requestServerUtil.addRequest(e);
		}

		//查询阈值配置指标已选择列表
		public function queryKpiIsSelect(param:Object):void
		{
			log.debug("[重点指标配置阈值查询指标:]查询未选择指标");
			var e:KPISituationEvent = new KPISituationEvent(KPISituationEvent.CMS_SCENE_KPISITUATION_IS_SELECT);
			e.param = param;
//			msgDispatcher(e);
			requestServerUtil.addRequest(e);
		}

		public function saveConfigKpi(param:Object):void
		{
			log.debug("指标选择配置保存,传入参数：");
			log.debug(param);
			log.debug(param.datas);
			var e:KPISituationEvent = new KPISituationEvent(KPISituationEvent.CMS_SCENE_KPISITUATION_SAVE_KPICONFIG);
			e.param = param;
//			msgDispatcher(e);
			requestServerUtil.addRequest(e);
		}

		public function queryThreshold(param:Object):void
		{
			log.debug("查询阈值，传入参数：");
			log.debug(param);
			log.debug(param.datas);
			var e:KPISituationEvent = new KPISituationEvent(KPISituationEvent.CMS_SCENE_KPISITUATION_QUERY_THRESHOLD);
			e.param = param;
//			msgDispatcher(e);
			requestServerUtil.addRequest(e);
		}

		public function thresholdConfig(param:Object):void
		{
			log.debug("配置保存,传入参数：");
			log.debug(param);
			var e:KPISituationEvent = new KPISituationEvent(KPISituationEvent.CMS_SCENE_KPISITUATION_CONFIG_SAVE);
			e.param = param;
			if (e.param) //add by hrw 2013-3-6
			{
				e.param.initSceneId = user.initSceneId;
			}
//			msgDispatcher(e);
			requestServerUtil.addRequest(e);
		}

		public function importDatas():void
		{
			log.info("begin to import");
			fileUpDownLoad = new FileUpDownLoad();
			var upLoadUrl:URLRequest = new URLRequest("/cms/scene/panels/exportThresholdAction!importThreshold.action");
			var upLoadData:URLVariables = new URLVariables();
			upLoadUrl.method = "POST";
			upLoadUrl.data = upLoadData;
			upLoadUrl.contentType = "multipart/form-data";
			fileUpDownLoad.upLoadURLRequest = upLoadUrl;
			fileUpDownLoad.upLoad();
			fileUpDownLoad.fileRefer.addEventListener(IOErrorEvent.IO_ERROR, onIOErrorHandler);
			log.info("end  import");
		}

		private function onCompleteHandler(event:Event):void
		{
			Alert.show("导入成功", "成功");
		}

		private function onIOErrorHandler(event:IOErrorEvent):void
		{
			Alert.show("导入失败", "失败");
		}

		public function getShareSceneList(param:Object):void
		{
			log.debug("查询场景共享列表,传入参数：");
			log.debug(param);
			var e:KPISituationEvent = new KPISituationEvent(KPISituationEvent.CMS_SCENE_KPISITUATION_SHOW_SHARE_SCENE_LIST);
			e.param = param;
//			msgDispatcher(e);
			requestServerUtil.addRequest(e);
		}

		//场景共享功能列表展示
		public function getShareSceneList1(param:Object):void
		{
			log.debug("查询场景共享列表,传入参数。。。");
			log.debug(param);
			var e:KPISituationEvent = new KPISituationEvent(KPISituationEvent.CMS_SCENE_KPISITUATION_SHOW_SHARE_SCENE_LIST1);
			e.param = param;
//			msgDispatcher(e);
			requestServerUtil.addRequest(e);
		}

		public function saveShareScene(param:Object):void
		{
			log.debug("保存共享场景,传入参数：");
			log.debug(param);
			var e:KPISituationEvent = new KPISituationEvent(KPISituationEvent.CMS_SCENE_KPISITUATION_SHOW_SHARE_SCENE_SAVE);
			e.param = param;
//			msgDispatcher(e);
			requestServerUtil.addRequest(e);
		}

	}
}

