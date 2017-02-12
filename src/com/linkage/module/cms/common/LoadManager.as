package com.linkage.module.cms.common
{
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	
	import mx.containers.VBox;
	import mx.managers.PopUpManager;
	
	import spark.components.Label;

	public class LoadManager
	{
		private var _parent:*;
		private var _loading:VBox;
		private var _prompt:Label;
		private var _label:String="正在处理，请稍后";
		private var _str:String="......";
		private var i:uint=0;
		private var _interval:uint=0;
		
		public function LoadManager(parent:*)
		{
			this._parent=parent;
			_loading=new VBox();
			_loading.styleName="controlPane";
			_loading.minWidth=150;
			_loading.horizontalCenter="center";
			_prompt=new Label();
			_prompt.text=_label;
			_loading.addChild(_prompt);
		}
		
		public function showLoading(label:String=null):void
		{
			if (label != null)
			{
				_label=label;
				_prompt.text=_label;
			}
			if (_loading != null)
			{
				PopUpManager.addPopUp(_loading, _parent);
				PopUpManager.centerPopUp(_loading);
				if(_interval == 0){
					_interval=setInterval(onInterval, 100);
				}
			}
		}
		
		public function hideLoading():void
		{
			if (_loading != null)
			{
				PopUpManager.removePopUp(_loading);
				if (_interval != 0)
				{
					clearInterval(_interval);
					_interval=0;
					i=0;
				}
			}
		}
		
		private function onInterval():void
		{
			_prompt.text=_label + _str.substring(0, _str.indexOf(".") + (i % 7));
			i++;
		}
	}
}