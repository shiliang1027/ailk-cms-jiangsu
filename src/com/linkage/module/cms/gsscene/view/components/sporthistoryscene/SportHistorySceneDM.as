package com.linkage.module.cms.gsscene.view.components.sporthistoryscene
{
	import com.linkage.gis.core.metry.GisPoint;
	import com.linkage.module.cms.common.LoadManager;

	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author hrw (Ailk No.)
	 * @version 1.0
	 * @date 2012-7-26
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class SportHistorySceneDM
	{

		//载入进度条
		public var lm:LoadManager;

		//记录缩略图数量
		private var _miniMapNum:int = 0;

		//记录当前移动的位置
		private var _curLocation:int = 1;

		//每屏显示的缩略图数量
		private var _showMapNum:int = 4;

		//缩略图宽度
		private var _miniMapWidth:int = 140;

		//缩略图之间空间
		private var _miniMapGap:int = 5;

		//缩略图高度
		private var _miniMapHeight:int = 100;

		//真实数据
		private var _dataList:Object = new Object();

		//测试数据
		private var _testData:Object = {"1308715200": [{"grid_id": "1", "longitude": "113.259518", "latitude": "23.13172", "width": "100", "heigth": "100", "color": "0x555555"}], "1308718800": [{"grid_id": "1", "longitude": "113.259518", "latitude": "23.13172", "width": "100", "heigth": "100", "color": "0x555555"}], "1308722400": [{"grid_id": "1", "longitude": "113.259518", "latitude": "23.13172", "width": "100", "heigth": "100", "color": "0x555555"}], "1308726000": [{"grid_id": "1", "longitude": "113.259518", "latitude": "23.13172", "width": "100", "heigth": "100", "color": "0x555555"}], "1308729600": [{"grid_id": "1", "longitude": "113.259518", "latitude": "23.13172", "width": "100", "heigth": "100", "color": "0x555555"}], "1308733200": [{"grid_id": "1", "longitude": "113.259518", "latitude": "23.13172", "width": "100", "heigth": "100", "color": "0x555555"}], "1308736800": [{"grid_id": "1", "longitude": "113.259518", "latitude": "23.13172", "width": "100", "heigth": "100", "color": "0x555555"}], "1308740400": [{"grid_id": "1", "longitude": "113.259518", "latitude": "23.13172", "width": "100", "heigth": "100", "color": "0x555555"}], "1308744000": [{"grid_id": "1", "longitude": "113.259518", "latitude": "23.13172", "width": "100", "heigth": "100", "color": "0x555555"}], "1308747600": [{"grid_id": "1", "longitude": "113.259518", "latitude": "23.13172", "width": "100", "heigth": "100", "color": "0x555555"}], "1308751200": [{"grid_id": "1", "longitude": "113.259518", "latitude": "23.13172", "width": "100", "heigth": "100", "color": "0x555555"}], "1308754800": [{"grid_id": "1", "longitude": "113.259518", "latitude": "23.13172", "width": "100", "heigth": "100", "color": "0x555555"}]};

		//缓存所有的时间节点
		public var timeArr:ArrayCollection = new ArrayCollection();

		//缓存所有gisfeature
		public var gisFeatureArr:ArrayCollection = new ArrayCollection();

		//缓存所有的point
		public var gisPointArr:ArrayCollection = new ArrayCollection();

		//当前节点
		private var _curIndex:int = 0;

		//是否可以点击移动缩略图
		private var _isMoveabled:Boolean = false;

		//调试标志
		private var _isDebug:Boolean = false;

		//当前显示的场景编号

		private var _monitorId:String = null;
		private var _perfId:Object = null;

		//地图是否初始化好
		private var _mapInit:Boolean = false;

		//图片的偏移量
		private var leftPicXOffset:Number = 15;
		private var leftPicYOffset:Number = -7;
		private var rightPicXOffset:Number = -10;
		private var rightPicYOffset:Number = -7;

		private var _timeoutIdCache:Object = new Object();


		public function get isMoveabled():Boolean
		{
			return _isMoveabled;
		}

		public function set isMoveabled(value:Boolean):void
		{
			_isMoveabled = value;
		}

		public function get curIndex():int
		{
			return _curIndex;
		}

		public function set curIndex(value:int):void
		{
			_curIndex = value;
		}

		public function get monitorId():String
		{
			return _monitorId;
		}

		public function set monitorId(value:String):void
		{
			_monitorId = value;
		}

		public function get mapInit():Boolean
		{
			return _mapInit;
		}

		[Bindable]
		public function set mapInit(value:Boolean):void
		{
			_mapInit = value;
		}

		public function get timeoutIdCache():Object
		{
			return _timeoutIdCache;
		}

		public function set timeoutIdCache(value:Object):void
		{
			_timeoutIdCache = value;
		}

		public function get perfId():Object
		{
			return _perfId;
		}

		public function set perfId(value:Object):void
		{
			_perfId = value;
		}

		public function get showMapNum():int
		{
			return _showMapNum;
		}

		public function set showMapNum(value:int):void
		{
			_showMapNum = value;
		}

		public function get curLocation():int
		{
			return _curLocation;
		}

		public function set curLocation(value:int):void
		{
			_curLocation = value;
		}

		public function get miniMapNum():int
		{
			return _miniMapNum;
		}

		public function set miniMapNum(value:int):void
		{
			_miniMapNum = value;
		}

		public function get miniMapGap():int
		{
			return _miniMapGap;
		}

		public function set miniMapGap(value:int):void
		{
			_miniMapGap = value;
		}

		public function get miniMapWidth():int
		{
			return _miniMapWidth;
		}

		public function set miniMapWidth(value:int):void
		{
			_miniMapWidth = value;
		}

		public function get testData():Object
		{
			return _testData;
		}

		public function set testData(value:Object):void
		{
			_testData = value;
		}

		public function get isDebug():Boolean
		{
			return _isDebug;
		}

		public function set isDebug(value:Boolean):void
		{
			_isDebug = value;
		}

		public function get miniMapHeight():int
		{
			return _miniMapHeight;
		}

		public function set miniMapHeight(value:int):void
		{
			_miniMapHeight = value;
		}

		public function get dataList():Object
		{
			return _dataList;
		}

		public function set dataList(value:Object):void
		{
			_dataList = value;
		}


	}
}