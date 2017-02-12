package com.linkage.module.cms.gsscene.view.components.weathersituation
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.ailk.common.ui.components.requestserver.RequestServerUtil;
	import com.linkage.module.cms.gsscene.view.components.weathersituation.event.WeatherEvent;

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
	public class WeatherSituationPM
	{
		private var log:ILogger = Log.getLoggerByClass(WeatherSituationPM);
        
		[Inject("weatherDM")]
		[Bindable]
		public var weatherDM:WeatherDM;
		
		[Inject("requestServerUtil")]
		public var requestServerUtil:RequestServerUtil;
        
		[MessageDispatcher]
		public var msgDispatcher:Function;

		public function getSceneWeatherInfo():void
		{
			log.debug("[天气概况]:派发天气概况事件" + WeatherEvent.SHOW_WEATHER_INFO);
			var weatherInfoEvent:WeatherEvent = new WeatherEvent(WeatherEvent.SHOW_WEATHER_INFO);
//			msgDispatcher(weatherInfoEvent);
			requestServerUtil.addRequest(weatherInfoEvent);
		}

		public function getSceneWeatherDetail(cityId:String):void
		{
			log.debug("[天气detail]:派发天气详情事件" + WeatherEvent.LOAD_WEATHER_DETAIL);
			var weatherDetailEvent:WeatherEvent = new WeatherEvent(WeatherEvent.LOAD_WEATHER_DETAIL);
			weatherDetailEvent.cityId = cityId;
//			msgDispatcher(weatherDetailEvent);
			requestServerUtil.addRequest(weatherDetailEvent);
		}

	}
}