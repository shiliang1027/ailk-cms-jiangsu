package com.linkage.module.cms.scene.event
{
	import flash.events.Event;

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
	public class SceneThumbnailEvent extends Event
	{

		public static const THUMBNAIL_CREATEHANDLER:String = "THUMBNAIL_CREATEHANDLER"; //缩略图生成
		public static const SCENE_AREA_LIST:String = "SCENE_AREA_LIST";


		public static const SCENE_AREABAD_IMPPERF_GET:String = "SCENE_AREABAD_IMPPERF_GET"; //缩略图tip窗口 获取
		public static const SCENE_AREABAD_IMPPERF_INIT:String = "SCENE_AREABAD_IMPPERF_INIT"; //init缩略图tip窗口

		public static const CMS_SCENE_SCENETHUMBNAIL_DELETEIMGDATA:String = "CMS_SCENE_SCENETHUMBNAIL_DELETEIMGDATA"; //删除区域

		public static const CMS_SCENE_SCENETHUMBNAIL_STARTIMGGETDATA:String = "CMS_SCENE_SCENETHUMBNAIL_STARTIMGGETDATA"; //区域启停数据查询

		public static const CMS_SCENE_SCENETHUMBNAIL_STARTIMGSHOWDATA:String = "CMS_SCENE_SCENETHUMBNAIL_STARTIMGSHOWDATA"; //区域启停数据展示

		public static const CMS_SCENE_SCENETHUMBNAIL_STARTIMGSAVEDATA:String = "CMS_SCENE_SCENETHUMBNAIL_STARTIMGSAVEDATA"; //区域启停数据保存

		public static const CMS_SCENE_SCENETHUMBNAIL_CITYTREEGETDATA:String = "CMS_SCENE_SCENETHUMBNAIL_CITYTREEGETDATA"; //获取地市列表

		public static const CMS_SCENE_SCENETHUMBNAIL_CITYTREESHOWDATA:String = "CMS_SCENE_SCENETHUMBNAIL_CITYTREESHOWDATA"; //显示地市tree结构

		public static const CMS_SCENE_SCENETHUMBNAIL_DELETEIMGSCENEDATA:String = "CMS_SCENE_SCENETHUMBNAIL_DELETEIMGSCENEDATA"; //判断是否删除场景


		private var _data:* = null;

		public function SceneThumbnailEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}

		public function get data():*
		{
			return _data;
		}

		public function set data(value:*):void
		{
			_data = value;
		}

	}
}