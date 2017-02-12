package com.linkage.module.cms.scene.domain.common
{

    public class User implements IUser
    {
        //用户帐号
        private var _account:String;

        private var _lastTimeStamp:Number;

        //用户域
        private var _areaId:String;

        private var _context:String;

        private var _sceneId:String;

        private var _cityName:String;
        private var _sceneTypeId:String;

        private var _level:String;

        private var _alarmParam:String;

        private var _isDrillDown:Boolean = true;

        private var _usinglayer:String;

        private var _layerurl:String;
        private var _layerId:String;

        private var _kpiId:String;
        private var _kpiIdList:String;
        private var _moTypeIdList:String;


        private var _kpiName:String;

        private var _rn:String;

        private var _showMoLayer:String;

        private var _mapType:String;

        private var _floatId:String;
        private var _floatTime:String;
        private var _floatLevel:String;

        private var _refreshPolygon:Boolean;

        private var _showBadMoPoints:Boolean;

        private var _perfClass:int;
        private var _configPerfClass:int;
        private var _dateFlag:String;
        private var _cityId:String;
        private var _moTypeId:String;
        private var _timeInterval:String;
        private var _startTime:String;
        private var _endTime:String;
        private var _hisFlag:String;
        private var _moId:String;

        private var _currentMapType:String; //当前地图是矢量地图还是gis地图 0： 矢量地图  1：gis地图

        private var _initSceneId:String; //加载初始场景id，

        //初始layerUrl layerId
        private var _initLayerUrl:String;
        private var _initLayerId:String;

        private var _compareDate:String;
        private var _isStaticres:String;

        //rendeType 配置面板字段
        private var _rendeType:String;

        private var _isNew:String; //是否使用蒙版，如果为1使用蒙版，否则不使用

        private var _newAdded:String; //是否从定制场景跳转过来；

        private var _pointlongitude:String; //从定制场景跳转过来 的中心点
        private var _pointlatitude:String; //定制场景跳转过来 的中心点
        private var _labelTypeId:String;

        private var _isGisFlag:String; // 1 :是gis定位  0 ：不是gis定位
		// gis渲染是否完成，默认是完成，只有当需要gis渲染时，并且未完成渲染才为false;
		private var _isGisFinished:Boolean=true; 
		
		public function get isGisFinished():Boolean
		{
			return _isGisFinished;
		}

		public function set isGisFinished(value:Boolean):void
		{
			_isGisFinished = value;
		}

        public function set account(value:String):void
        {
            _account = value;
        }

        public function get account():String
        {
            return _account;
        }

        public function set areaId(value:String):void
        {
            _areaId = value;
        }

        public function get areaId():String
        {
            return _areaId;
        }

        public function get context():String
        {
            return _context;
        }

        public function set context(value:String):void
        {
            _context = value;
        }

        public function get sceneId():String
        {
            return _sceneId;
        }

        public function set sceneId(value:String):void
        {
            _sceneId = value;
        }

        public function get level():String
        {
            return _level;
        }

        public function set level(value:String):void
        {
            _level = value;
        }

        public function get sceneTypeId():String
        {
            return _sceneTypeId;
        }

        [Bindable]
        public function set sceneTypeId(value:String):void
        {
            _sceneTypeId = value;
        }

        public function get alarmParam():String
        {
            return _alarmParam;
        }

        public function set alarmParam(value:String):void
        {
            _alarmParam = value;
        }

        public function get usinglayer():String
        {
            return _usinglayer;
        }

        public function set usinglayer(value:String):void
        {
            _usinglayer = value;
        }

        public function get layerurl():String
        {
            return _layerurl;
        }

        public function set layerurl(value:String):void
        {
            _layerurl = value;
        }

        public function get kpiId():String
        {
            return _kpiId;
        }

        public function set kpiId(value:String):void
        {
            _kpiId = value;
        }

        public function get showMoLayer():String
        {
            return _showMoLayer;
        }

        public function set showMoLayer(value:String):void
        {
            _showMoLayer = value;
        }

        public function get floatId():String
        {
            return _floatId;
        }

        public function set floatId(value:String):void
        {
            _floatId = value;
        }

        public function get floatLevel():String
        {
            return _floatLevel;
        }

        public function set floatLevel(value:String):void
        {
            _floatLevel = value;
        }

        public function get kpiName():String
        {
            return _kpiName;
        }

        public function set kpiName(value:String):void
        {
            _kpiName = value;
        }

        public function get rn():String
        {
            return _rn;
        }

        public function set rn(value:String):void
        {
            _rn = value;
        }

        public function get refreshPolygon():Boolean
        {
            return _refreshPolygon;
        }

        public function set refreshPolygon(value:Boolean):void
        {
            _refreshPolygon = value;
        }

        public function get layerId():String
        {
            return _layerId;
        }

        public function set layerId(value:String):void
        {
            _layerId = value;
        }

        public function get showBadMoPoints():Boolean
        {
            return _showBadMoPoints;
        }

        public function set showBadMoPoints(value:Boolean):void
        {
            _showBadMoPoints = value;
        }

        public function get perfClass():int
        {
            return _perfClass;
        }

        public function set perfClass(value:int):void
        {
            _perfClass = value;
        }

        public function get dateFlag():String
        {
            return _dateFlag;
        }

        public function set dateFlag(value:String):void
        {
            _dateFlag = value;
        }

        public function get cityId():String
        {
            return _cityId;
        }

        public function set cityId(value:String):void
        {
            _cityId = value;
        }

        public function get timeInterval():String
        {
            return _timeInterval;
        }

        public function set timeInterval(value:String):void
        {
            _timeInterval = value;
        }

        public function get moTypeId():String
        {
            return _moTypeId;
        }

        public function set moTypeId(value:String):void
        {
            _moTypeId = value;
        }

        public function get mapType():String
        {
            return _mapType;
        }

        public function set mapType(value:String):void
        {
            _mapType = value;
        }

        public function get currentMapType():String
        {
            return _currentMapType;
        }

        public function set currentMapType(value:String):void
        {
            _currentMapType = value;
        }

        public function get kpiIdList():String
        {
            return _kpiIdList;
        }

        public function set kpiIdList(value:String):void
        {
            _kpiIdList = value;
        }

        public function get startTime():String
        {
            return _startTime;
        }

        public function set startTime(value:String):void
        {
            _startTime = value;
        }

        public function get endTime():String
        {
            return _endTime;
        }

        public function set endTime(value:String):void
        {
            _endTime = value;
        }


        public function get hisFlag():String
        {
            return _hisFlag;
        }

        public function set hisFlag(value:String):void
        {
            _hisFlag = value;
        }

        public function get isDrillDown():Boolean
        {
            return _isDrillDown;
        }

        public function set isDrillDown(value:Boolean):void
        {
            _isDrillDown = value;
        }

        public function get initSceneId():String
        {
            return _initSceneId;
        }

        public function set initSceneId(value:String):void
        {
            _initSceneId = value;
        }

        public function get moId():String
        {
            return _moId;
        }


        public function set moId(value:String):void
        {
            _moId = value;
        }

        public function get moTypeIdList():String
        {
            return _moTypeIdList;
        }

        public function set moTypeIdList(value:String):void
        {
            _moTypeIdList = value;
        }

        public function get compareDate():String
        {
            return _compareDate;
        }

        public function set compareDate(value:String):void
        {
            _compareDate = value;
        }

        public function get initLayerUrl():String
        {
            return _initLayerUrl;
        }

        public function set initLayerUrl(value:String):void
        {
            _initLayerUrl = value;
        }

        public function get initLayerId():String
        {
            return _initLayerId;
        }

        public function set initLayerId(value:String):void
        {
            _initLayerId = value;
        }

        public function get floatTime():String
        {
            return _floatTime;
        }

        public function set floatTime(value:String):void
        {
            _floatTime = value;
        }

        public function get cityName():String
        {
            return _cityName;
        }

        public function set cityName(value:String):void
        {
            _cityName = value;
        }

        public function get isStaticres():String
        {
            return _isStaticres;
        }

        public function set isStaticres(value:String):void
        {
            _isStaticres = value;
        }

        public function get rendeType():String
        {
            return _rendeType;
        }

        public function set rendeType(value:String):void
        {
            _rendeType = value;
        }

        public function get isNew():String
        {
            return _isNew;
        }

        public function set isNew(value:String):void
        {
            _isNew = value;
        }

        public function get configPerfClass():int
        {
            return _configPerfClass;
        }

        public function set configPerfClass(value:int):void
        {
            _configPerfClass = value;
        }

        public function get newAdded():String
        {
            return _newAdded;
        }

        public function set newAdded(value:String):void
        {
            _newAdded = value;
        }

        public function get pointlongitude():String
        {
            return _pointlongitude;
        }

        public function set pointlongitude(value:String):void
        {
            _pointlongitude = value;
        }

        public function get pointlatitude():String
        {
            return _pointlatitude;
        }

        public function set pointlatitude(value:String):void
        {
            _pointlatitude = value;
        }

        public function get labelTypeId():String
        {
            return _labelTypeId;
        }

        public function set labelTypeId(value:String):void
        {
            _labelTypeId = value;
        }

        public function get isGisFlag():String
        {
            return _isGisFlag;
        }

        public function set isGisFlag(value:String):void
        {
            _isGisFlag = value;
        }

        public function get lastTimeStamp():Number
        {
            return _lastTimeStamp;
        }

        public function set lastTimeStamp(value:Number):void
        {
            _lastTimeStamp = value;
        }


    }
}

