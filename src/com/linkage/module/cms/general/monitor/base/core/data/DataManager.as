package com.linkage.module.cms.general.monitor.base.core.data
{
	
	import com.linkage.system.rpc.http.HttpUtil;
	
	import flash.net.URLVariables;
	
	import mx.rpc.events.FaultEvent;

	/**
	 *Action管理器,将与web交互的Action集中管理
	 * @author mengqiang
	 *
	 */
	public class DataManager implements IDataManager
	{
		public function loadDataByUrl(url:String, success:Function, error:Function = null):void
		{
			HttpUtil.httpService(null, url, function(result:Object):void
				{
					success.call(null, new XML(result as String));
				}, null, function(event:FaultEvent):void
				{
					error.call();
				});
		}

		public function loadViewDataByAreaIdAndUrl(areaIdArr:String, url:String, success:Function, error:Function = null):void
		{
			var params:URLVariables = new URLVariables();
			params.areaIdArr = areaIdArr;
			HttpUtil.httpService(null, url, function(result:Object):void
				{
					success.call(null, new XML(result as String));
				}, params, function(event:FaultEvent):void
				{
					error.call();
				});
		}

		public function loadDataByParamAndUrl(param:String, url:String, success:Function, error:Function = null):void
		{
			var params:URLVariables = new URLVariables();
			params.param = param;
			HttpUtil.httpService(null, url, function(result:Object):void
				{
					success.call(null, new XML(result as String));
				}, params, function(event:FaultEvent):void
				{
					error.call();
				});


		}
	}
}