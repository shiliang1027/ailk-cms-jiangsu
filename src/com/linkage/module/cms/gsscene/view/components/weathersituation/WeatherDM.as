package com.linkage.module.cms.gsscene.view.components.weathersituation
{
	import com.linkage.module.cms.gsscene.view.components.common.domain.IUser;

	import mx.collections.ArrayCollection;

	/**
	 *
	 *天气概况数据模型
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-7-31
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class WeatherDM
	{
		//天气概况数据
		private var _weatherInfo:ArrayCollection = new ArrayCollection();
		//天气详情数据
		private var _weatherDetail:ArrayCollection = new ArrayCollection;
		//天气云图
		private var _cloudPicUrl:String = new String();

		[Inject("user")]
		public var user:IUser;

		public function get weatherInfo():ArrayCollection
		{
			return _weatherInfo;
		}

		[Bindable]
		public function set weatherInfo(value:ArrayCollection):void
		{
			_weatherInfo = value;
			for each(var data:Object in _weatherInfo)
			{
				data.imgUrl = user.context + data.imgUrl;
			}
		}

		public function get weatherDetail():ArrayCollection
		{
			return _weatherDetail;
		}

		public function set weatherDetail(value:ArrayCollection):void
		{
			_weatherDetail = value;
		}

		public function get cloudPicUrl():String
		{
			return _cloudPicUrl;
		}

		[Bindable]
		public function set cloudPicUrl(value:String):void
		{
			_cloudPicUrl = value;
			_cloudPicUrl = user.context + _cloudPicUrl;
		}


	}
}

