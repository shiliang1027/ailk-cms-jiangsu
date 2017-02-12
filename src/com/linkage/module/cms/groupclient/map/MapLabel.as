package com.linkage.module.cms.groupclient.map
{
	import com.linkage.module.cms.common.Constants;

	import spark.components.Label;

	/**
	 * 地图label
	 * @author shiliang(6614) Tel:13770527121
	 * @version 1.0
	 * @since 2010-11-28 上午10:03:13
	 * @category com.linkage.module.ims.scene.outshow.core
	 * @copyright 南京联创科技 网管开发部
	 */
	public class MapLabel extends Label implements IData
	{
		private var _isMove:Boolean = false;

		public function MapLabel()
		{
			super();
		}

		public function mouseOver():void
		{
			if (!_isMove)
			{
				this.y -= Constants.MOUSEOVER_REMOTE_NUM;
				_isMove = true;
			}
		}

		public function mouseOut():void
		{
			if (_isMove)
			{
				this.y += Constants.MOUSEOVER_REMOTE_NUM;
				_isMove = false;
			}
		}
	}
}