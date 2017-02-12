package com.linkage.module.cms.scenedaily.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.dao.IDailyMapDAO;
	import com.linkage.module.cms.scenedaily.domain.DailyMapDM;
	import com.linkage.module.cms.scenedaily.event.DailyMapEvent;
	import com.linkage.module.cms.scenedaily.event.SceneDailyEvent;

	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *
	 *
	 * @author hurw (69065)
	 * @version 1.0
	 * @date 2012-9-13
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class DailyMapMoCmd
	{
		private var log:ILogger = Log.getLoggerByClass(DailyMapMoCmd);


		[Inject("dailyMapDM")]
		public var dm:DailyMapDM;

		[Inject("dailyMapDAO")]
		public var dao:IDailyMapDAO;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:DailyMapEvent):AsyncToken
		{
			log.info("[地图网元列表]调用接口getGisKpi获取数据结果!");
			if (e.param)
			{
//				e.param.type = "1"; //健康度 阈值劣化
//				e.param.timeGranular = "3"; //日 周 月
//				e.param.stateTime = "2012-09-10"; //日期
//				e.param.resType = "3"; // 默认进来 2 是地市  3是网元
//				e.param.isLeaderPef = "0"; //是否领导视图
//				e.param.resId = "0100"; // 如果resType是2，那么是地市   如果是3，那么
//				e.param.perfTypeId = "311"; //指标Id 最后两个参数是重点性能指标概览传递过来的
//				e.param.moTypeId = "5"; //网元类型
//				e.param.perfLevel = "3"; //如果是省地图那么传入1，如果是地市 传入2 如果是网元，传入3
			}
			else
			{
				e.param = new Object();
			}
			return dao.getGisKpi(e.param);
		}

		public function result(obj:Object):void
		{
			log.info("调用[地图网元列表]接口获取数据结果 success!");
			dm.gisKpis.removeAll();
			dm.gisKpis.addAll(obj as IList);
			dm.gisKpis.refresh();
			log.info(dm.gisKpis);
			//查询数据结束，抛出事件，进行地图渲染
			var e:DailyMapEvent = new DailyMapEvent(DailyMapEvent.GISID_THROWMAP);
			msgDispatcher(e);
		}

		public function error(f:Fault):void
		{
			log.error("加载[地图网元列表]数据错误：" + f.faultString + "," + f.faultDetail);
//			dm.gisKpis.removeAll();
//			dm.gisKpis = new ArrayCollection([{"kpiId": "001", "kpiName": "GS接通率", "kpiValue": "98%", "cityId": "0100", "cityName": "南京", "color": "0XFF0000", "trend": "up"}, {"kpiId": "002", "kpiName": "GS接通率", "kpiValue": "98%", "cityId": "0200", "cityName": "苏州", "color": "0X00FF00", "trend": "down"}, {"kpiId": "002", "kpiName": "GS接通率", "kpiValue": "98%", "cityId": "0300", "cityName": "无锡", "color": "0X00FF00", "trend": "down"}, {"kpiId": "002", "kpiName": "GS接通率", "kpiValue": "98%", "cityId": "0400", "cityName": "常州", "color": "0X00FF00", "trend": "down"}, {"kpiId": "002", "kpiName": "GS接通率", "kpiValue": "98%", "cityId": "0500", "cityName": "镇江", "color": "0X00FF00", "trend": "down"}, {"kpiId": "002", "kpiName": "GS接通率", "kpiValue": "98%", "cityId": "0600", "cityName": "苏州", "color": "0X00FF00", "trend": "down"}, {"kpiId": "002", "kpiName": "GS接通率", "kpiValue": "98%", "cityId": "0700", "cityName": "苏州", "color": "0X00FF00", "trend": "down"}, {"kpiId": "002", "kpiName": "GS接通率", "kpiValue": "98%", "cityId": "0800", "cityName": "苏州", "color": "0X00FF00", "trend": "down"}, {"kpiId": "002", "kpiName": "GS接通率", "kpiValue": "98%", "cityId": "0900", "cityName": "苏州", "color": "0X00FF00", "trend": "down"}, {"kpiId": "002", "kpiName": "GS接通率", "kpiValue": "98%", "cityId": "1000", "cityName": "苏州", "color": "0X00FF00", "trend": "down"}, {"kpiId": "002", "kpiName": "GS接通率", "kpiValue": "98%", "cityId": "1100", "cityName": "淮安", "color": "0X00FF00", "trend": "down"}, {"kpiId": "002", "kpiName": "GS接通率", "kpiValue": "98%", "cityId": "1200", "cityName": "连云港", "color": "0X00FF00", "trend": "down"}, {"kpiId": "002", "kpiName": "GS接通率", "kpiValue": "98%", "cityId": "1300", "cityName": "盐城", "color": "0X00FF00", "trend": "down"}]);
//			dm.gisKpis.refresh();
//			log.info(dm.gisKpis);
//			//查询数据结束，抛出事件，进行地图渲染
//			var e:DailyMapEvent = new DailyMapEvent(DailyMapEvent.GISID_THROWMAP);
//			msgDispatcher(e);
		}
	}
}