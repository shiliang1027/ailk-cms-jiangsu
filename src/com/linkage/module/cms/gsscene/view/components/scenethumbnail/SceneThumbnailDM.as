package com.linkage.module.cms.gsscene.view.components.scenethumbnail
{

	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;

	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-7-30
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SceneThumbnailDM
	{

		private var log:ILogger = Log.getLoggerByClass(SceneThumbnailDM);

//		private var _data:ArrayCollection = new ArrayCollection([
//			{"city_id":"00","areaId":"1","sceneId":"1004","areaName":"高速","imgUrl":"cms/images/scene/gaosu.png","flag":"1"},
//			{"city_id":"","areaId":"2","sceneId":"1004","areaName":"国道","imgUrl":"cms/images/scene/guodao.png","flag":"1"},
//			{"city_id":"","areaId":"3","sceneId":"1004","areaName":"省道","imgUrl":"cms/images/scene/shengdao.png","flag":"1"},
//			{"city_id":"","areaId":"4","sceneId":"1004","areaName":"城市道路","imgUrl":"cms/images/scene/chengshidaolu.png","flag":"1"}
//		]);
		
		private var _data:ArrayCollection = new ArrayCollection();

		private var _badList:ArrayCollection = new ArrayCollection(); //缩略图弹出tip窗口数据
		//缩略图 高度 宽度
		private var _thumbnailWidth:uint = 80;
		private var _thumbnailHeight:uint = 80;

		[Bindable]
		public function get data():ArrayCollection
		{
			return _data;
		}

		public function set data(value:ArrayCollection):void
		{
			_data = value;
		}

		public function get thumbnailWidth():uint
		{
			return _thumbnailWidth;
		}

		public function set thumbnailWidth(value:uint):void
		{
			_thumbnailWidth = value;
		}

		public function get thumbnailHeight():uint
		{
			return _thumbnailHeight;
		}

		public function set thumbnailHeight(value:uint):void
		{
			_thumbnailHeight = value;
		}

		public function get badList():ArrayCollection
		{
			return _badList;
		}

		public function set badList(value:ArrayCollection):void
		{
			_badList = value;
		}
	}
}