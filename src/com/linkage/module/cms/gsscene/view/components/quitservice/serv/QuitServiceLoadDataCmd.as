package com.linkage.module.cms.gsscene.view.components.quitservice.serv
{
	/**
	 *
	 *
	 * @author xudx (69291)
	 * @version 1.0
	 * @date 2012-7-26
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;
	import com.linkage.module.cms.gsscene.view.components.quitservice.QuitServiceDM;
	import com.linkage.module.cms.gsscene.view.components.quitservice.dao.IQuitServiceDao;
	import com.linkage.module.cms.gsscene.view.components.quitservice.event.QuitServiceEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;
	
	public class QuitServiceLoadDataCmd
	{
		private var log:ILogger = Log.getLoggerByClass(QuitServiceLoadDataCmd);
		
		[Inject("quitServiceDao")]
		public var dao:IQuitServiceDao;
		
		[Inject("quitServiceDM")]
		public var dm:QuitServiceDM;
		
		[Inject("user")]
		public var user:IUser;
		
		[MessageDispatcher]
		public var msgDispatcher:Function;
		
		private var systime:Number = 0;
		
		public function execute(e:QuitServiceEvent):AsyncToken
		{
			log.info("加载退服统计数据！");
			systime = (new Date()).getTime();
			return dao.getSceneQuitSvs();
		}
		
		public function result(data:Object):void
		{
			log.warn("耗时：{0}", (new Date).getTime() - systime);
			log.info("加载退服统计数据成功:" + data.length);
			dm.dataList.removeAll();
			
			if (data.length > 0)
			{
				var tatalObj:Object = data.getItemAt(0);
				log.info(tatalObj);
				if ("2" != user.logicalType)
				{
//					[{烟感=0, 蓄电池供电=0, 属地=南京, GSM退服基站=0, LTE退服基站=0, 传输中断=0, 水浸=0, 一次下电=0, 市电停电=0, 
//						GSM退服小区=0, 直流欠压=0, TD退服基站=0, TD退服小区=0, LTE退服小区=0}]
//					dm.dataList.addItem(
//						{"key": "GSM退服基站", "value": tatalObj["GSM退服基站"],"label":"GSM退服基站","cityId":tatalObj["cityId"],
//						 "key1": "烟感", "value1": tatalObj["烟感"],"label1":"烟感","cityId1":tatalObj["cityId"]});
//					dm.dataList.addItem(
//						{"key": "TD退服基站", "value": tatalObj["TD退服基站"],"label":"TD退服基站","cityId":tatalObj["cityId"],
//						 "key1": "市电停电", "value1": tatalObj["市电停电"],"label1":"市电停电","cityId1":tatalObj["cityId"]});
//					dm.dataList.addItem(
//						{"key": "LTE退服基站", "value": tatalObj["LTE退服基站"],"label":"LTE退服基站","cityId":tatalObj["cityId"],
//						 "key1": "一次下电", "value1": tatalObj["一次下电"],"label1":"一次下电","cityId1":tatalObj["cityId"]});
//					dm.dataList.addItem(
//						{"key": "GSM退服小区", "value": tatalObj["GSM退服小区"],"label":"GSM退服小区","cityId":tatalObj["cityId"],
//						 "key1": "传输中断", "value1": tatalObj["传输中断"],"label1":"传输中断","cityId1":tatalObj["cityId"]});
//					dm.dataList.addItem(
//						{"key": "TD退服小区", "value": tatalObj["TD退服小区"],"label":"TD退服小区","cityId":tatalObj["cityId"],
//						 "key1": "水浸", "value1": tatalObj["水浸"],"label1":"水浸","cityId1":tatalObj["cityId"]});
//					dm.dataList.addItem(
//						{"key": "LTE退服小区", "value": tatalObj["LTE退服小区"],"label":"LTE退服小区","cityId":tatalObj["cityId"],
//						 "key1": "蓄电池供电", "value1": tatalObj["蓄电池供电"],"label1":"蓄电池供电","cityId1":tatalObj["cityId"]});
//					dm.dataList.addItem(
//						{"key": "", "value": "","label":"","cityId":tatalObj["cityId"],
//						 "key1": "直流欠压", "value1": tatalObj["直流欠压"],"label1":"直流欠压","cityId1":tatalObj["cityId"]});
					//GSM
					dm.dataList.addItem(
						{"key": "GSM小区退服", "value": tatalObj["GSM小区退服"],"label":"GSM小区退服","cityId":tatalObj["cityId"],
							 "key1": "GSM基站退服", "value1": tatalObj["GSM基站退服"],"label1":"GSM基站退服","cityId1":tatalObj["cityId"]});
					dm.dataList.addItem(
						{"key": "GSM基站退服_基站自身原因", "value": tatalObj["GSM基站退服_基站自身原因"],"label":"GSM基站退服_基站自身原因","cityId":tatalObj["cityId"],
							"key1": "GSM基站退服_市电停电", "value1": tatalObj["GSM基站退服_市电停电"],"label1":"GSM基站退服_市电停电","cityId1":tatalObj["cityId"]});
					dm.dataList.addItem(
						{"key": "GSM基站退服_一次下电", "value": tatalObj["GSM基站退服_一次下电"],"label":"GSM基站退服_一次下电","cityId":tatalObj["cityId"],
							"key1": "GSM基站退服_传输中断", "value1": tatalObj["GSM基站退服_传输中断"],"label1":"GSM基站退服_传输中断","cityId1":tatalObj["cityId"]});
					dm.dataList.addItem(
						{"key": "GSM基站退服_动环其它原因", "value": tatalObj["GSM基站退服_动环其它原因"],"label":"GSM基站退服_动环其它原因","cityId":tatalObj["cityId"],
							"key1": "GSM小区完好率", "value1": tatalObj["GSM小区完好率"],"label1":"GSM小区完好率","cityId1":tatalObj["cityId"]});
					dm.dataList.addItem(
						{"key": "GSM基站完好率", "value": tatalObj["GSM基站完好率"],"label":"GSM基站完好率","cityId":tatalObj["cityId"],
							"key1": "", "value1": "","label1":"","cityId1":tatalObj["cityId"]});
					
					//TD
					dm.dataList.addItem(
						{"key": "TD小区退服", "value":  tatalObj["TD小区退服"],"label":"TD小区退服","cityId":tatalObj["cityId"],
							"key1": "TD基站退服", "value1": tatalObj["TD基站退服"],"label1":"TD基站退服","cityId1":tatalObj["cityId"]});
					dm.dataList.addItem(
						{"key": "TD小区完好率", "value": tatalObj["TD小区完好率"],"label":"TD小区完好率","cityId":tatalObj["cityId"],
							"key1": "TD基站退服_基站自身原因", "value1": tatalObj["TD基站退服_基站自身原因"],"label1":"TD基站退服_基站自身原因","cityId1":tatalObj["cityId"]});
					dm.dataList.addItem(
						{"key": "TD基站退服_市电停电", "value": tatalObj["TD基站退服_市电停电"],"label":"TD基站退服_市电停电","cityId":tatalObj["cityId"],
							"key1": "TD基站退服_一次下电", "value1": tatalObj["TD基站退服_一次下电"],"label1":"TD基站退服_一次下电","cityId1":tatalObj["cityId"]});
					dm.dataList.addItem(
						{"key": "TD基站退服_传输中断", "value":  tatalObj["TD基站退服_传输中断"],"label":"TD基站退服_传输中断","cityId":tatalObj["cityId"],
							"key1": "TD基站退服_动环其它原因", "value1": tatalObj["TD基站退服_动环其它原因"],"label1":"TD基站退服_动环其它原因","cityId1":tatalObj["cityId"]});
					dm.dataList.addItem(
						{"key": "TD基站完好率", "value": tatalObj["TD基站完好率"],"label":"TD基站完好率","cityId":tatalObj["cityId"],
							"key1": "", "value1": "","label1":"","cityId1":tatalObj["cityId"]});
					//LTE
					dm.dataList.addItem(
						{"key": "LTE小区退服", "value": tatalObj["LTE小区退服"],"label":"LTE小区退服","cityId":tatalObj["cityId"],
							"key1": "LTE基站退服", "value1": tatalObj["LTE基站退服"],"label1":"LTE基站退服","cityId1":tatalObj["cityId"]});
					dm.dataList.addItem(
						{"key": "LTE基站退服_基站自身原因", "value": tatalObj["LTE基站退服_基站自身原因"],"label":"LTE基站退服_基站自身原因","cityId":tatalObj["cityId"],
							"key1": "LTE基站退服_市电停电", "value1": tatalObj["LTE基站退服_市电停电"],"label1":"LTE基站退服_市电停电","cityId1":tatalObj["cityId"]});
					dm.dataList.addItem(
						{"key": "LTE基站退服_一次下电", "value": tatalObj["LTE基站退服_一次下电"],"label":"LTE基站退服_一次下电","cityId":tatalObj["cityId"],
							"key1": "LTE基站退服_传输中断", "value1": tatalObj["LTE基站退服_传输中断"],"label1":"LTE基站退服_传输中断","cityId1":tatalObj["cityId"]});
					dm.dataList.addItem(
						{"key": "LTE基站退服_动环其它原因", "value": tatalObj["LTE基站退服_动环其它原因"],"label":"LTE基站退服_动环其它原因","cityId":tatalObj["cityId"],
							"key1": "LTE小区完好率", "value1": tatalObj["LTE小区完好率"],"label1":"LTE小区完好率","cityId1":tatalObj["cityId"]});
					dm.dataList.addItem(
						{"key": "LTE基站完好率", "value": tatalObj["LTE基站完好率"],"label":"LTE基站完好率","cityId":tatalObj["cityId"],
							"key1": "", "value1": "","label1":"","cityId1":tatalObj["cityId"]});
					dm.dataList.addItem(
						{"key": "AP退服", "value": tatalObj["AP退服"],"label":"AP退服","cityId":tatalObj["cityId"],
							"key1": "AP退服率", "value1": tatalObj["AP退服率"],"label1":"AP退服率","cityId1":tatalObj["cityId"]});
					
					
				}else{
//					dm.dataList.addItem(
//						{"key": "LTE退服基站", "value": tatalObj["LTE退服基站"],"label":"LTE退服基站","cityId":tatalObj["cityId"],
//						 "key1": "烟感", "value1": tatalObj["烟感"],"label1":"烟感","cityId1":tatalObj["cityId"]});
//					dm.dataList.addItem(
//						{"key": "LTE退服小区", "value": tatalObj["LTE退服小区"],"label":"LTE退服小区","cityId":tatalObj["cityId"],
//						 "key1": "市电停电", "value1": tatalObj["市电停电"],"label1":"市电停电","cityId1":tatalObj["cityId"]});
//					dm.dataList.addItem(
//						{"key": "", "value": tatalObj[""],"label":"","cityId":tatalObj["cityId"],
//						 "key1": "一次下电", "value1": tatalObj["一次下电"],"label1":"一次下电","cityId1":tatalObj["cityId"]});
//					dm.dataList.addItem(
//						{"key": "", "value": tatalObj[""],"label":"","cityId":tatalObj["cityId"],
//						 "key1": "传输中断", "value1": tatalObj["传输中断"],"label1":"传输中断","cityId1":tatalObj["cityId"]});
//					dm.dataList.addItem(
//						{"key": "", "value": tatalObj[""],"label":"","cityId":tatalObj["cityId"],
//						 "key1": "水浸", "value1": tatalObj["水浸"],"label1":"水浸","cityId1":tatalObj["cityId"]});
//					dm.dataList.addItem(
//						{"key": "", "value": tatalObj[""],"label":"","cityId":tatalObj["cityId"],
//						 "key1": "蓄电池供电", "value1": tatalObj["蓄电池供电"],"label1":"蓄电池供电","cityId1":tatalObj["cityId"]});
//					dm.dataList.addItem(
//						{"key": "", "value": tatalObj[""],"label":"","cityId":tatalObj["cityId"],
//						 "key1": "直流欠压", "value1": tatalObj["直流欠压"],"label1":"直流欠压","cityId1":tatalObj["cityId"]});
					dm.dataList.addItem(
						{"key": "LTE小区退服", "value": tatalObj["LTE小区退服"],"label":"LTE小区退服","cityId":tatalObj["cityId"],
							"key1": "LTE基站退服", "value1": tatalObj["LTE基站退服"],"label1":"LTE基站退服","cityId1":tatalObj["cityId"]});
					dm.dataList.addItem(
						{"key": "LTE基站退服_基站自身原因", "value": tatalObj["LTE基站退服_基站自身原因"],"label":"LTE基站退服_基站自身原因","cityId":tatalObj["cityId"],
							"key1": "LTE基站退服_市电停电", "value1": tatalObj["LTE基站退服_市电停电"],"label1":"LTE基站退服_市电停电","cityId1":tatalObj["cityId"]});
					dm.dataList.addItem(
						{"key": "LTE基站退服_一次下电", "value": tatalObj["LTE基站退服_一次下电"],"label":"LTE基站退服_一次下电","cityId":tatalObj["cityId"],
							"key1": "LTE基站退服_传输中断", "value1": tatalObj["LTE基站退服_传输中断"],"label1":"LTE基站退服_传输中断","cityId1":tatalObj["cityId"]});
					dm.dataList.addItem(
						{"key": "LTE基站退服_动环其它原因", "value": tatalObj["LTE基站退服_动环其它原因"],"label":"LTE基站退服_动环其它原因","cityId":tatalObj["cityId"],
							"key1": "LTE小区完好率", "value1": tatalObj["LTE小区完好率"],"label1":"LTE小区完好率","cityId1":tatalObj["cityId"]});
					dm.dataList.addItem(
						{"key": "", "value": "","label":"","cityId":"",
							"key1": "LTE基站完好率", "value1": tatalObj["LTE基站完好率"],"label1":"LTE基站完好率","cityId1":tatalObj["cityId"]});
					
				}
				log.info(dm.dataList);
				/**
				 * eNodeB退服基站数_detail,用此key来判断是否有详情。
				 * 如果有详情，则点击详情时，不用请求后台，否则请求后台，
				 * 该处为兼容老代码的逻辑，此处以后必须改。
				 * */
				dm.quitServiceDetail.dataDetail = tatalObj;
//				if(tatalObj.hasOwnProperty("LTE退服基站数_detail")){
//					//表示不需要请求后台。
//					dm.quitServiceDetail.loadServiceFlag=false;
//					if ("2" != user.logicalType)
//					{
//						//					[{烟感=0, 蓄电池供电=0, 属地=南京, GSM退服基站=0, LTE退服基站=0, 传输中断=0, 水浸=0, 一次下电=0, 市电停电=0, 
//						//						GSM退服小区=0, 直流欠压=0, TD退服基站=0, TD退服小区=0, LTE退服小区=0}]
//						dm.quitServiceDetail.list00 = tatalObj["GSM退服基站_detail"];
//						dm.quitServiceDetail.list01 = tatalObj["TD退服基站_detail"];
//						dm.quitServiceDetail.list10 = tatalObj["LTE退服基站_detail"];
//						dm.quitServiceDetail.list11 = tatalObj["一次下电_detail"];
//						dm.quitServiceDetail.list20 = tatalObj["市电停电_detail"];
//						dm.quitServiceDetail.list21 = tatalObj["直流欠压_detail"];
//						dm.quitServiceDetail.list30 = tatalObj["蓄电池供电_detail"];
//						dm.quitServiceDetail.list31 = tatalObj["水浸_detail"];
//						dm.quitServiceDetail.list40 = tatalObj["烟感_detail"];
//						dm.quitServiceDetail.list41 = tatalObj["传输中断_detail"];
//					}else{
//						dm.quitServiceDetail.list00 = tatalObj["LTE退服基站_detail"];
//						dm.quitServiceDetail.list01 = tatalObj["一次下电_detail"];
//						dm.quitServiceDetail.list10 = tatalObj["市电停电_detail"];
//						dm.quitServiceDetail.list11 = tatalObj["直流欠压_detail"];
//						dm.quitServiceDetail.list20 = tatalObj["蓄电池供电_detail"];
//						dm.quitServiceDetail.list21 = tatalObj["水浸_detail"];
//						dm.quitServiceDetail.list30 = tatalObj["烟感_detail"];
//						dm.quitServiceDetail.list31 = tatalObj["传输中断_detail"];
//					}
//				}else{
//					//表示不需要请求后台。
//					dm.quitServiceDetail = {};
//					dm.quitServiceDetail.loadServiceFlag=true;
//				}
				
				
			}
			
			dm.dataList.refresh();
			
			
			log.info("退服统计 地市查询！" + (new Date().getTime() - systime));
			dm.cityQuitDataList.removeAll();
			dm.cityQuitDataList.addAll(data as IList);
			log.info(dm.cityQuitDataList);
			
			dm.cityQuitDataList.refresh();
			
			if (user.kpiId == null)
			{
				log.info("退服统计，派发显示退服图表的事件：QuitServiceEvent.SHOW_QUIT_CHART");
				var e:QuitServiceEvent = new QuitServiceEvent(QuitServiceEvent.SHOW_QUIT_CHART);
				e.quitData.removeAll();
				e.quitData.addAll(data as IList);
				msgDispatcher(e);
			}
			
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
		
		public function error(f:Fault):void
		{
			msgDispatcher(new Event("REQUEST_COMPLETE"));
			log.error("加载[退服统计]表格数据错误：" + f.faultString + "\n" + f.faultDetail);
		}
	}
}

