package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import com.linkage.module.cms.scene.dao.IScenePanelDao;
	import com.linkage.module.cms.scene.dao.ScenePanelDao;
	import com.linkage.module.cms.scene.domain.WeatherDM;
	import com.linkage.module.cms.scene.event.WeatherEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *天气详情命令处理类
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-7-31
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class WeatherDetailCmd
	{
		private var log:ILogger = Log.getLoggerByClass(WeatherDetailCmd);

		[Inject("weatherDM")]
		public var weatherDM:WeatherDM;

		[Inject("scenePanelDao")]
		public var scenePanelDao:IScenePanelDao;

		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function execute(e:WeatherEvent):AsyncToken
		{
			log.debug("[天气概况]:天气详情数据execute开始执行...");
			return scenePanelDao.getSceneWeatherDetail(e.cityId);
		}

		public function result(data:Object):void
		{
			log.debug("[天气概况]:天气详情数据 load success:" + data.datas.length);
			log.debug("[天气概况]:天气云图:{0}", data.cloudMap);
			weatherDM.weatherDetail.removeAll();
			weatherDM.weatherDetail.addAll(data.datas as IList);
			weatherDM.cloudPicUrl = data.cloudMap;
			msgDispatcher(new WeatherEvent(WeatherEvent.SHOW_WEATHER_DETAIL));
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("[天气概况]:天气概况返回失败error..." + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}