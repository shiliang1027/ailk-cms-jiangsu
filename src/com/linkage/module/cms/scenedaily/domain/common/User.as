package com.linkage.module.cms.scenedaily.domain.common
{
	import com.linkage.module.cms.scenedaily.event.SceneDailyEvent;

	public class User implements IUser
	{



		[MessageDispatcher]
		public var msgDispatcher:Function;

		private var _context:String;
		private var _account:String;
		private var _areaId:String;

		private var _kpiId:String;

		private var _kpiName:String;
		private var _kpiValue:String;

		private var _interval:String;

		private var _moTypeId:String;

		private var _resId:String;

		private var _isHealthOrThreshold:String;

		private var _resType:String;

		private var _viewType:String;

		private var _gatherTime:String;

		private var _cityId:String;

		private var _perfTypeId:String;

		private var _timeGranular:String;

		private var _stateTime:String;

		private var _isLeaderPef:String;
		//重点指标信息选择信息索引
		private var _kpiCurrentSelectIndex:int;
		//重点指标当前页索引
		private var _kpiCurrentPageIndex:int = 1;
		//点击事件保存当前页
		private var _kpiClickPageIndex:int;
		//点击事件保存当前索引
		private var _kpiClickSelectIndex:int;
		//记录地图点击
		private var _kpiMapClickFlag:Boolean = false;

		private var _isHis:String;

		private var _perfName:String;

		public function get kpiId():String
		{
			return _kpiId;
		}

		public function set kpiId(value:String):void
		{
			_kpiId = value;
			msgDispatcher(new SceneDailyEvent(SceneDailyEvent.CMS_SCENEDAILY_COMMON_KPICHANGE));
		}

		public function get kpiName():String
		{
			return _kpiName;
		}

		public function set kpiName(value:String):void
		{
			_kpiName = value;
		}

		public function get moTypeId():String
		{
			return _moTypeId;
		}

		public function set moTypeId(value:String):void
		{
			_moTypeId = value;
		}

		public function get resId():String
		{
			return _resId;
		}

		public function set resId(value:String):void
		{
			_resId = value;
		}

		public function get isHealthOrThreshold():String
		{
			return _isHealthOrThreshold;
		}

		public function set isHealthOrThreshold(value:String):void
		{
			_isHealthOrThreshold = value;
		}

		public function get resType():String
		{
			return _resType;
		}

		public function set resType(value:String):void
		{
			_resType = value;
		}

		public function get viewType():String
		{
			return _viewType;
		}

		public function set viewType(value:String):void
		{
			_viewType = value;
		}

		public function get gatherTime():String
		{
			return _gatherTime;
		}

		public function set gatherTime(value:String):void
		{
			_gatherTime = value;
		}

		public function get cityId():String
		{
			return _cityId;
		}

		public function set cityId(value:String):void
		{
			_cityId = value;
		}

		public function get interval():String
		{
			return _interval;
		}

		public function set interval(value:String):void
		{
			_interval = value;
		}

		public function get context():String
		{
			return _context;
		}

		public function set context(value:String):void
		{
			_context = value;
		}

		public function get account():String
		{
			return _account;
		}

		public function set account(value:String):void
		{
			_account = value;
		}

		public function get areaId():String
		{
			return _areaId;
		}

		public function set areaId(value:String):void
		{
			_areaId = value;
		}

		public function get perfTypeId():String
		{
			return _perfTypeId;
		}

		public function set perfTypeId(value:String):void
		{
			_perfTypeId = value;
		}

		public function get timeGranular():String
		{
			return _timeGranular;
		}

		public function set timeGranular(value:String):void
		{
			_timeGranular = value;
		}

		public function get stateTime():String
		{
			return _stateTime;
		}

		public function set stateTime(value:String):void
		{
			_stateTime = value;
		}

		public function get isLeaderPef():String
		{
			return _isLeaderPef;
		}

		public function set isLeaderPef(value:String):void
		{
			_isLeaderPef = value;
		}

		public function get kpiValue():String
		{
			return _kpiValue;
		}

		public function set kpiValue(value:String):void
		{
			_kpiValue = value;
		}

		public function get kpiCurrentSelectIndex():int
		{
			return _kpiCurrentSelectIndex;
		}

		public function set kpiCurrentSelectIndex(value:int):void
		{
			_kpiCurrentSelectIndex = value;
		}

		public function get kpiCurrentPageIndex():int
		{
			return _kpiCurrentPageIndex;
		}

		public function set kpiCurrentPageIndex(value:int):void
		{
			_kpiCurrentPageIndex = value;
		}

		public function get kpiClickPageIndex():int
		{
			return _kpiClickPageIndex;
		}

		public function set kpiClickPageIndex(value:int):void
		{
			_kpiClickPageIndex = value;
		}

		public function get kpiClickSelectIndex():int
		{
			return _kpiClickSelectIndex;
		}

		public function set kpiClickSelectIndex(value:int):void
		{
			_kpiClickSelectIndex = value;
		}

		public function get kpiMapClickFlag():Boolean
		{
			return _kpiMapClickFlag;
		}

		public function set kpiMapClickFlag(value:Boolean):void
		{
			_kpiMapClickFlag = value;
		}

		public function get isHis():String
		{
			return _isHis;
		}

		public function set isHis(value:String):void
		{
			_isHis = value;
		}

		public function get perfName():String
		{
			return _perfName;
		}

		public function set perfName(value:String):void
		{
			_perfName = value;
		}


	}
}

