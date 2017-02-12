package com.linkage.module.cms.general.monitor.base.core.element
{
	import mx.collections.ArrayCollection;

	public class ButtonInfo
	{
		//左边距
		private var _left:int = 6;
		//下边距
		private var _bottom:int = 6;
		//按钮配置信息
		private var _configArray:ArrayCollection = new ArrayCollection();

		public function ButtonInfo()
		{
			initConfigInfo();
		}

		//初始化配置信息
		private function initConfigInfo():void
		{
			configArray.addItem({title: '一级综合视图', type: '1', url: 'level1', image: 'level1.png', width: '60', height: '60', left: '10', bottom: '10'});
			configArray.addItem({title: '设备告警视图', type: '1', url: 'level2', image: 'level2.png', width: '32', height: '32', left: '2', bottom: '76'});
			configArray.addItem({title: '网络性能视图', type: '1', url: 'level3', image: 'level3.png', width: '32', height: '32', left: '36', bottom: '77'});
			configArray.addItem({title: '投诉/故障工单视图', type: '1', url: 'level4', image: 'level4.png', width: '32', height: '32', left: '66', bottom: '62'});
			configArray.addItem({title: '外围事件监控视图', type: '1', url: 'level5', image: 'level5.png', width: '32', height: '32', left: '82', bottom: '33'});
			configArray.addItem({title: '工程调整视图', type: '2', url: '/ims/scene/allnet/level2/project/ProjectAdjust!query.action', image: 'level6.png', width: '32', height: '32', left: '76', bottom: '2'});
		}

		public function get left():int
		{
			return _left;
		}

		public function set left(value:int):void
		{
			_left = value;
		}

		public function get bottom():int
		{
			return _bottom;
		}

		public function set bottom(value:int):void
		{
			_bottom = value;
		}

		public function get configArray():ArrayCollection
		{
			return _configArray;
		}

		public function set configArray(value:ArrayCollection):void
		{
			_configArray = value;
		}
	}
}