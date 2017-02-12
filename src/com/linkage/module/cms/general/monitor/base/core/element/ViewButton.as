package com.linkage.module.cms.general.monitor.base.core.element
{
	import com.linkage.module.cms.general.monitor.base.core.ViewSlice;
	import com.linkage.module.cms.general.monitor.base.resource.imagesclass.IconFinder;
	
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Image;
	
	import spark.components.Group;

	/**
	 *按钮容器
	 * @author mengqiang
	 *
	 */
	public class ViewButton extends Group
	{
		//核心容器
		private var _viewSlice:ViewSlice = null;
		//按钮数据
		private var _buttonInfo:ButtonInfo = null;

		public function ViewButton(viewSlice:ViewSlice)
		{
			_viewSlice = viewSlice;
			_buttonInfo = new ButtonInfo();
			parseXML();
		}

		/**
		 * 展示按钮
		 *
		 */
		public function parseXML():void
		{
			var array:ArrayCollection = _buttonInfo.configArray;
			var butImg:Image = null;
			var butInfo:Object = null;
			for each (butInfo in array)
			{
				butImg = IconFinder.findElementIcon(butInfo.image);
				butImg.id = butInfo.url;
				butImg.name = butInfo.type;
				butImg.toolTip = butInfo.title;
				butImg.width = int(butInfo.width);
				butImg.height = int(butInfo.height);
				butImg.left = int(butInfo.left);
				butImg.bottom = int(butInfo.bottom);
				butImg.buttonMode = true;
				addElement(butImg);
				butImg.addEventListener(MouseEvent.CLICK, onImageClick);
			}
			left = _buttonInfo.left;
			bottom = _buttonInfo.bottom;
		}

		/**
		 *按钮点击事件
		 * @param event
		 *
		 */
		private function onImageClick(event:MouseEvent):void
		{
			if (event.target.name == "2")
			{
				var baseUrl:String = _viewSlice.getWebParam().baseUrl;
				navigateToURL(new URLRequest(baseUrl + event.target.id));
			}
			else
			{
				_viewSlice.switchView(event.target.id);
			}
		}

		/**
		 *展示按鈕
		 *
		 */
		public function show():void
		{
			_viewSlice.addElementAt(this, 0);
		}
	}
}