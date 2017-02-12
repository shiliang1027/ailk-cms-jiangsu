package com.linkage.module.cms.scene.serv
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import com.linkage.module.cms.scene.dao.ScenePanelDao;
	import com.linkage.module.cms.scene.domain.WeatherDM;
	import com.linkage.module.cms.scene.event.WeatherEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.Fault;

	/**
	 *天气概况命令处理类
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
	public class WeatherSituationCmd
	{
		private var log:ILogger = Log.getLoggerByClass(WeatherSituationCmd);

		[Inject("weatherDM")]
		public var weatherDM:WeatherDM;

		[Inject("scenePanelDao")]
		public var scenePanelDao:ScenePanelDao;
		[MessageDispatcher]
		public var msgDispatcher:Function;
		public function execute(e:WeatherEvent):AsyncToken
		{
			log.debug("[天气概况]:天气概况数据execute开始执行...");
			return this.scenePanelDao.getSceneWeatherInfo();
		}

		public function result(data:ArrayCollection):void
		{
			log.debug("[天气概况]:天气概况数据 load success...");
			this.weatherDM.weatherInfo = data;
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}

		public function error(f:Fault):void
		{
			log.error("[天气概况]:天气概况返回失败error:" + f.faultString + "\n" + f.faultDetail);
			msgDispatcher(new Event("REQUEST_COMPLETE"));
		}
	}
}