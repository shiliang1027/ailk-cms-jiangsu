package com.linkage.module.cms.gsscene.view.components.mapview
{
    import com.ailk.common.ui.gis.core.GisLayer;
    
    import mx.collections.ArrayCollection;
    import mx.collections.Sort;
    import mx.collections.SortField;

    public class MapViewDM
    {
        //网元选择列表
        private var _selectMoList:ArrayCollection = new ArrayCollection();
        private var _bilichiList:ArrayCollection = new ArrayCollection;
        //区域缩略图列表
        private var _snapshotList:ArrayCollection = new ArrayCollection();
        //区域缩略图列表
        private var _userNumList:ArrayCollection = new ArrayCollection();

        public var userNumLevel:Object = {};

        //泰森多边形、网元数据列表
        private var _polygonList:ArrayCollection = new ArrayCollection();

        //GIS图层缓存
        private var _gisLayerMap:Object = {};

        //当前场景、区域的网元id列表
        private var _moIdList:ArrayCollection = new ArrayCollection();

        //当前场景、区域的网元gisid列表
        private var _gisIdList:ArrayCollection = new ArrayCollection();

        //当前场景、区域的网元gisid列表
        private var _gisIdListNodeB:ArrayCollection = new ArrayCollection();

        //当前场景，区域的feature列表，便于放入地图的时候直接放入，不用担心cell被放到基站的下层
        private var _gisFeatureList:ArrayCollection = new ArrayCollection();

        //存放gis定位的数据
        private var _gisPositionList:ArrayCollection = new ArrayCollection();

        //当前场景、区域的网元gisid和颜色的映射
        private var _gisIdColorMap:Object = {};

        //当前场景、区域的网元gisid和zhibiaozhi的映射
        private var _gisIdKpiValueMap:Object = {};
        private var _gisIdPerfLevelMap:Object = {};
        private var _gisIdMoInfoMap:Object = {}; //gisId 和网元或者泰森多边形对应map

        //网元id和该网元的 gisfeature的映射。
        private var _moIdFeatureMap:Object = {};

        //gis_id和该网元的 gisfeature的映射。
        private var _gisIdFeatureMap:Object = {};

        private var _typhoonMsgList:ArrayCollection = new ArrayCollection;

        private var _typhoonCityMsgList:ArrayCollection = new ArrayCollection;

        private var _allTyphoonPoints:Array;

        private var _allTyphoonPointsSmooth:Array;
        private var _typhoonTimeMsgMap:Object = new Object;

        private var _emgFeatures:Object = new Object();

		private var _gisQuitCollect:Object=new Object();
		
        private var _cityLayer:ArrayCollection = new ArrayCollection;

        //重点指标列表
        private var _impKpiList:ArrayCollection = new ArrayCollection();

        //道路性能劣化数据
        private var _roadPerfList:ArrayCollection = new ArrayCollection();

        //管线信息
        private var _lineInfos:ArrayCollection = new ArrayCollection();

        //光路信息
        private var _opticInfos:ArrayCollection = new ArrayCollection();

        //管线信息
        private var _lineGisInfos:ArrayCollection = new ArrayCollection();

        //机楼告警信息
        private var _siteAlarmInfos:ArrayCollection = new ArrayCollection();

        private var _sourceLayer:GisLayer = new GisLayer();


        private var _moLocationGisLayer:GisLayer = new GisLayer(); //网元定位专用layer
		
		private var _moGisLayer:GisLayer = new GisLayer(); //gis网元撒点
		
		private var _pointQuitGisLayer:GisLayer = new GisLayer(); //gis退服基站撒点
		
        private var _taisenLocationGisLayer:GisLayer = new GisLayer(); //gis定位泰森专用layer

        private var _cameraLocationGisLayer:GisLayer = new GisLayer(); //摄像头专用

        private var _sportImgGisLayer:GisLayer = new GisLayer();

        private var _emgCarMap:Array = new Array("5.bts.2014997699", "5.bts.2014760690", "5.bts.2014997718");
		
		public var superBTSArray:Array = ["5.bts.119950416"];
		//是否为显示图层,默认不显示
		[Bindable]
		public var gisLayerMapType:Boolean=false;
		
		
		public var polygonListSize:Number=0;
		
		public function get pointQuitGisLayer():GisLayer
		{
			return _pointQuitGisLayer;
		}

		public function set pointQuitGisLayer(value:GisLayer):void
		{
			_pointQuitGisLayer = value;
		}

		public function get gisQuitCollect():Object
		{
			return _gisQuitCollect;
		}

		public function set gisQuitCollect(value:Object):void
		{
			_gisQuitCollect = value;
		}

		public function get moGisLayer():GisLayer
		{
			return _moGisLayer;
		}

		public function set moGisLayer(value:GisLayer):void
		{
			_moGisLayer = value;
		}

        public function get snapshotList():ArrayCollection
        {
            return _snapshotList;
        }

        public function set snapshotList(value:ArrayCollection):void
        {
            _snapshotList = value;
        }

        public function get gisLayerMap():Object
        {
            return _gisLayerMap;
        }

        public function set gisLayerMap(value:Object):void
        {
            _gisLayerMap = value;
        }

        public function get polygonList():ArrayCollection
        {
            return _polygonList;
        }

        public function set polygonList(value:ArrayCollection):void
        {
            _polygonList = value;
        }

        public function get moIdList():ArrayCollection
        {
            return _moIdList;
        }

        public function set moIdList(value:ArrayCollection):void
        {
            _moIdList = value;
        }

        public function get gisIdList():ArrayCollection
        {
            return _gisIdList;
        }

        public function set gisIdList(value:ArrayCollection):void
        {
            _gisIdList = value;
        }

        public function get gisIdColorMap():Object
        {
            return _gisIdColorMap;
        }

        public function set gisIdColorMap(value:Object):void
        {
            _gisIdColorMap = value;
        }

        public function get moIdFeatureMap():Object
        {
            return _moIdFeatureMap;
        }

        public function set moIdFeatureMap(value:Object):void
        {
            _moIdFeatureMap = value;
        }

        public function get impKpiList():ArrayCollection
        {
            return _impKpiList;
        }

        public function set impKpiList(value:ArrayCollection):void
        {
            _impKpiList = value;
        }

        public function get gisIdKpiValueMap():Object
        {
            return _gisIdKpiValueMap;
        }

        public function set gisIdKpiValueMap(value:Object):void
        {
            _gisIdKpiValueMap = value;
        }

        public function get gisIdListNodeB():ArrayCollection
        {
            return _gisIdListNodeB;
        }

        public function set gisIdListNodeB(value:ArrayCollection):void
        {
            _gisIdListNodeB = value;
        }

        public function get typhoonMsgList():ArrayCollection
        {
            return _typhoonMsgList;
        }

        public function set typhoonMsgList(value:ArrayCollection):void
        {
            _typhoonMsgList = value;
        }

        public function get allTyphoonPoints():Array
        {
            return _allTyphoonPoints;
        }

        public function set allTyphoonPoints(value:Array):void
        {
            _allTyphoonPoints = value;
        }

        public function get emgFeatures():Object
        {
            return _emgFeatures;
        }

        public function set emgFeatures(value:Object):void
        {
            _emgFeatures = value;
        }

        public function get allTyphoonPointsSmooth():Array
        {
            return _allTyphoonPointsSmooth;
        }

        public function set allTyphoonPointsSmooth(value:Array):void
        {
            _allTyphoonPointsSmooth = value;
        }

        public function get typhoonTimeMsgMap():Object
        {
            return _typhoonTimeMsgMap;
        }

        public function set typhoonTimeMsgMap(value:Object):void
        {
            _typhoonTimeMsgMap = value;
        }

        public function get gisIdFeatureMap():Object
        {
            return _gisIdFeatureMap;
        }

        public function set gisIdFeatureMap(value:Object):void
        {
            _gisIdFeatureMap = value;
        }

        public function get typhoonCityMsgList():ArrayCollection
        {
            return _typhoonCityMsgList;
        }

        public function set typhoonCityMsgList(value:ArrayCollection):void
        {
            _typhoonCityMsgList = value;
        }

        public function get cityLayer():ArrayCollection
        {
            return _cityLayer;
        }

        public function set cityLayer(value:ArrayCollection):void
        {
            _cityLayer = value;
        }

        public function get gisIdPerfLevelMap():Object
        {
            return _gisIdPerfLevelMap;
        }

        public function set gisIdPerfLevelMap(value:Object):void
        {
            _gisIdPerfLevelMap = value;
        }

        public function get roadPerfList():ArrayCollection
        {
            return _roadPerfList;
        }

        public function set roadPerfList(value:ArrayCollection):void
        {
            _roadPerfList = value;
        }

        public function get lineInfos():ArrayCollection
        {
            return _lineInfos;
        }

        public function set lineInfos(value:ArrayCollection):void
        {
            _lineInfos = value;
        }

        public function get lineGisInfos():ArrayCollection
        {
            return _lineGisInfos;
        }

        public function set lineGisInfos(value:ArrayCollection):void
        {
            _lineGisInfos = value;
        }

        public function get opticInfos():ArrayCollection
        {
            return _opticInfos;
        }

        public function set opticInfos(value:ArrayCollection):void
        {
            _opticInfos = value;
        }

        public function get siteAlarmInfos():ArrayCollection
        {
            return _siteAlarmInfos;
        }

        public function set siteAlarmInfos(value:ArrayCollection):void
        {
            _siteAlarmInfos = value;
        }

        public function get gisIdMoInfoMap():Object
        {
            return _gisIdMoInfoMap;
        }

        public function set gisIdMoInfoMap(value:Object):void
        {
            _gisIdMoInfoMap = value;
        }

        [Bindable]
        public function get gisFeatureList():ArrayCollection
        {
            return _gisFeatureList;
        }

        public function set gisFeatureList(value:ArrayCollection):void
        {
            _gisFeatureList = value;
        }

        [Bindable]
        public function get selectMoList():ArrayCollection
        {
            return _selectMoList;
        }

        public function set selectMoList(value:ArrayCollection):void
        {
            _selectMoList = value;
        }

        [Bindable]
        public function get bilichiList():ArrayCollection
        {
            return _bilichiList;
        }

        public function set bilichiList(value:ArrayCollection):void
        {
            _bilichiList = value;
        }

        public function get gisPositionList():ArrayCollection
        {
            return _gisPositionList;
        }

        public function set gisPositionList(value:ArrayCollection):void
        {
            _gisPositionList = value;
        }

        public function get sourceLayer():GisLayer
        {
            return _sourceLayer;
        }

        public function set sourceLayer(value:GisLayer):void
        {
            _sourceLayer = value;
        }

        public function get moLocationGisLayer():GisLayer
        {
            return _moLocationGisLayer;
        }

        public function set moLocationGisLayer(value:GisLayer):void
        {
            _moLocationGisLayer = value;
        }

        public function get taisenLocationGisLayer():GisLayer
        {
            return _taisenLocationGisLayer;
        }

        public function set taisenLocationGisLayer(value:GisLayer):void
        {
            _taisenLocationGisLayer = value;
        }

        public function get cameraLocationGisLayer():GisLayer
        {
            return _cameraLocationGisLayer;
        }

        public function set cameraLocationGisLayer(value:GisLayer):void
        {
            _cameraLocationGisLayer = value;
        }

        public function get emgCarMap():Array
        {
            return _emgCarMap;
        }

        public function set emgCarMap(value:Array):void
        {
            _emgCarMap = value;
        }

        public function get sportImgGisLayer():GisLayer
        {
            return _sportImgGisLayer;
        }

        public function set sportImgGisLayer(value:GisLayer):void
        {
            _sportImgGisLayer = value;
        }

        [Bindable]
        public function get userNumList():ArrayCollection
        {
            return _userNumList;
        }

        public function set userNumList(value:ArrayCollection):void
        {
            _userNumList = value;
        }
    }
}

