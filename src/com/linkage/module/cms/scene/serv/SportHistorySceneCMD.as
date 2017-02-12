package com.linkage.module.cms.scene.serv
{

	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.esri.ags.tasks.supportClasses.DataLayer;
	
	import com.linkage.module.cms.scene.dao.ISportHistorySceneDAO;
	import com.linkage.module.cms.scene.domain.SportHistorySceneDM;
	import com.linkage.module.cms.scene.event.SportHistorySceneEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	import mx.utils.ObjectUtil;

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
	public class SportHistorySceneCMD
	{

		private var log:ILogger = Log.getLoggerByClass(SportHistorySceneCMD);

		[Inject("sportHistorySceneDAO")]
		public var dao:ISportHistorySceneDAO;

		[Inject("sportHistorySceneDM")]
		[Bindable]
		public var dm:SportHistorySceneDM;

		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function execute(e:SportHistorySceneEvent):AsyncToken
		{
			log.info("下载数据");
//			var obj:Object = {"2012-07-27 13:00:00": [{"moId": "bts668","moName":"山村BTS","moTypeId":"16","moTypeName":"BTS", "longitude": "119.33833000", "latitude": "34.75480300", "gisId":"98923", "影响用户数":"1049","warnLevel":"0", "color": "0xff0000"},
//				{"moId": "bts668","moName":"山村BTS","moTypeId":"16","moTypeName":"BTS", "longitude": "119.35694000", "latitude": "34.73972300", "gisId":"98925", "影响用户数":"1049","warnLevel":"0", "color": "0xff0000"}], 
//				"2012-07-27 14:00:00": [{"moId": "bts668","moName":"山村BTS","moTypeId":"16","moTypeName":"BTS", "longitude": "119.42773000", "latitude": "34.58768000", "gisId":"98922", "影响用户数":"1049","warnLevel":"0", "color": "0xff0000"},
//					{"moId": "bts668","moName":"山村BTS","moTypeId":"16","moTypeName":"BTS", "longitude": "119.33833000", "latitude": "34.75480300", "gisId":"98923", "影响用户数":"1049","warnLevel":"0", "color": "0xff0000"},
//					{"moId": "bts668","moName":"山村BTS","moTypeId":"16","moTypeName":"BTS", "longitude": "119.35694000", "latitude": "34.73972300", "gisId":"98925", "影响用户数":"1049","warnLevel":"0", "color": "0xff0000"}],
//				"2012-07-27 15:00:00": [{"moId": "bts668","moName":"山村BTS","moTypeId":"16","moTypeName":"BTS", "longitude": "119.33833000", "latitude": "34.75480300", "gisId":"98923", "影响用户数":"1049","warnLevel":"0", "color": "0xff0000"},
//					{"moId": "bts668","moName":"山村BTS","moTypeId":"16","moTypeName":"BTS", "longitude": "119.35694000", "latitude": "34.73972300", "gisId":"98925", "影响用户数":"1049","warnLevel":"0", "color": "0xff0000"}],
//				"2012-07-27 16:00:00": [{"moId": "bts668","moName":"山村BTS","moTypeId":"16","moTypeName":"BTS", "longitude": "119.33833000", "latitude": "34.75480300", "gisId":"98923", "影响用户数":"1049","warnLevel":"0", "color": "0xff0000"},
//					{"moId": "bts668","moName":"山村BTS","moTypeId":"16","moTypeName":"BTS", "longitude": "119.35694000", "latitude": "34.73972300", "gisId":"98925", "影响用户数":"1049","warnLevel":"0", "color": "0xff0000"}],
//				"2012-07-27 17:00:00": [{"moId": "bts668","moName":"山村BTS","moTypeId":"16","moTypeName":"BTS", "longitude": "119.42773000", "latitude": "34.58768000", "gisId":"98922", "影响用户数":"1049","warnLevel":"0", "color": "0xff0000"},
//					{"moId": "bts668","moName":"山村BTS","moTypeId":"16","moTypeName":"BTS", "longitude": "119.33833000", "latitude": "34.75480300", "gisId":"98923", "影响用户数":"1049","warnLevel":"0", "color": "0xff0000"},
//					{"moId": "bts668","moName":"山村BTS","moTypeId":"16","moTypeName":"BTS", "longitude": "119.35694000", "latitude": "34.73972300", "gisId":"98925", "影响用户数":"1049","warnLevel":"0", "color": "0xff0000"}],
//				"2012-07-27 18:00:00": [{"moId": "bts668","moName":"山村BTS","moTypeId":"16","moTypeName":"BTS", "longitude": "119.42773000", "latitude": "34.58768000", "gisId":"98922", "影响用户数":"1049","warnLevel":"0", "color": "0xff0000"},
//					{"moId": "bts668","moName":"山村BTS","moTypeId":"16","moTypeName":"BTS", "longitude": "119.33833000", "latitude": "34.75480300", "gisId":"98923", "影响用户数":"1049","warnLevel":"0", "color": "0xff0000"},
//					{"moId": "bts668","moName":"山村BTS","moTypeId":"16","moTypeName":"BTS", "longitude": "119.35694000", "latitude": "34.73972300", "gisId":"98925", "影响用户数":"1049","warnLevel":"0", "color": "0xff0000"}]};

//			dm.dataList.removeAll();
//			dm.dataList.addAll(obj as IList);
//			dm.dataList.refresh();

			return dao.loadMiniMapData();
		}

		public function result(data:Object):void
		{
			log.info("SportHistorySceneCMD result运动历史场景返回结果：");
			log.info(ObjectUtil.copy(data));
			dm.dataList = ObjectUtil.copy(data);
			log.info(dm.dataList);
			dispatchMsg(new SportHistorySceneEvent(SportHistorySceneEvent.LOAD_MINIMAPWORK_DATA_COMP));
//			dm.dataList = data;
//			dm.dataList.removeAll();
//			dm.dataList.addAll(data as IList);
//			dm.dataList.refresh();
//			dispatchMsg(new SportHistorySceneEvent(SportHistorySceneEvent.LOAD_MINIMAPWORK_DATA_COMP));
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("加载[运动历史场景]数据错误：\n" + f.faultString + "\n" + f.faultDetail);
			dispatchMsg(new Event("REQUEST_COMPLETE"));
		}

	}
}