package com.linkage.module.cms.gsscene.view.components.weathersituation.event
{
	import flash.events.Event;

	/**
	 * 天气概况Event
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
	public class WeatherEvent extends Event
	{
		//展示天气概况信息
		public static const SHOW_WEATHER_INFO:String = "SHOW_WEATHER_INFO";
		//加载天气详情图表数据
		public static const LOAD_WEATHER_DETAIL:String = "LOAD_WEATHER_DETAIL";
		//展示天气详情图表数据
		public static const SHOW_WEATHER_DETAIL:String = "SHOW_WEATHER_DETAIL";

		public var cityId:String;

		public function WeatherEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
	}
}