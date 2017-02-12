package com.linkage.module.cms.topo.util
{
	import com.linkage.module.cms.components.loadmanager.LoadManager;
	import com.linkage.module.topo.framework.util.loading.ILoadingInfo;

	import flash.display.DisplayObject;

	/**
	 * cms 加载中的提示信息
	 * @author duangr
	 *
	 */
	public class CmsLoadingInfo implements ILoadingInfo
	{
		private var _loading:LoadManager = null;

		public function CmsLoadingInfo()
		{

		}

		public function set parent(value:DisplayObject):void
		{
			_loading = new LoadManager(value);
		}

		public function loadingStart():void
		{
			if (_loading)
			{
				_loading.showLoading();
			}
		}

		public function loadingEnd():void
		{
			if (_loading)
			{
				_loading.hideLoading();
			}
		}

		public function toString():String
		{
			return "(CMS Loading消息) " + _loading;
		}
	}
}