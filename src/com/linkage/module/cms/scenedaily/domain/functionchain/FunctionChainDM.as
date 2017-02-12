package com.linkage.module.cms.scenedaily.domain.functionchain
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;

	public class FunctionChainDM
	{
		private var log:ILogger = Log.getLoggerByClass(FunctionChainDM);



		private var _healthReportImgUrl:String = "";
		private var _hangOutShingleMngImgUrl:String = "";
		private var _pickShingleImgUrl:String = "";
		private var _hangOutShingleCount:String = "";
		private var _pickShingleRate:String = "";

		public function get pickShingleRate():String
		{
			return _pickShingleRate;
		}

		[Bindable]
		public function set pickShingleRate(value:String):void
		{
			_pickShingleRate = value;
		}

		public function get hangOutShingleCount():String
		{
			return _hangOutShingleCount;
		}

		[Bindable]
		public function set hangOutShingleCount(value:String):void
		{
			_hangOutShingleCount = value;
		}

		public function get pickShingleImgUrl():String
		{
			return _pickShingleImgUrl;
		}

		[Bindable]
		public function set pickShingleImgUrl(value:String):void
		{
			_pickShingleImgUrl = value;
			log.info("FunctionChainDM测试模块pickShingleImgUrl！");
		}

		public function get hangOutShingleMngImgUrl():String
		{
			return _hangOutShingleMngImgUrl;
		}

		[Bindable]
		public function set hangOutShingleMngImgUrl(value:String):void
		{
			_hangOutShingleMngImgUrl = value;

		}

		public function get healthReportImgUrl():String
		{
			return _healthReportImgUrl;
		}

		[Bindable]
		public function set healthReportImgUrl(value:String):void
		{
			_healthReportImgUrl = value;
		}
	}
}

