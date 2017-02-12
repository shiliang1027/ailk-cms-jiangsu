package com.linkage.module.cms.groupmonitor.custscene.domain
{
	import mx.collections.ArrayCollection;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-10-11
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class CustSceneDM
	{
		private var _treeData:XML;

		private var _selCustList:ArrayCollection=new ArrayCollection();

		[Bindbale]
		public var topuData:ArrayCollection=new ArrayCollection();

		private var _userCustList:ArrayCollection=new ArrayCollection();

		//public var topuData:ArrayCollection=new ArrayCollection([{"custname": "da kehu", "custid": "1", "isbig": "1"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "1", "isbig": "0"}, {"custname": "kehu1", "custid": "2", "isbig": "0"}, {"custname": "kehu1", "custid": "3", "isbig": "0"}, {"custname": "kehu1", "custid": "4", "isbig": "0"}, {"custname": "kehu1", "custid": "5", "isbig": "0"}]);

		//告警工单
		[Bindable]
		public var faultDispatchList:ArrayCollection=new ArrayCollection();

		//投诉工地那
		[Bindable]
		public var complaintDispatch:ArrayCollection=new ArrayCollection();

		//服务类型
		private var _realServTypeBar:ArrayCollection=new ArrayCollection();

		//是否有告警
		private var _hasAlarmList:ArrayCollection=new ArrayCollection();

		//地图左边的面板
		private var _panelLeftList:ArrayCollection=new ArrayCollection();

		//地图右边的面板
		private var _panelRightList:ArrayCollection=new ArrayCollection();

		//性能面板使用客户
		private var _userCustForPerfList:ArrayCollection=new ArrayCollection();

		//性能面板使用客户指标数据集
		private var _userCustKpiDataMap:Object=new Object();

		//区县下专线数量
		private var _disSpecNumList:ArrayCollection=new ArrayCollection();

		private var _cityList:ArrayCollection=new ArrayCollection();

		private var _industryList:ArrayCollection=new ArrayCollection();

		private var _userLvl:ArrayCollection=new ArrayCollection();

		private var _servLvl:ArrayCollection=new ArrayCollection();

		private var _usersList:ArrayCollection=new ArrayCollection();

		private var _selUsersList:ArrayCollection=new ArrayCollection();

		private var _proOverCitySpecList:ArrayCollection=new ArrayCollection();

		private var _overAreaSpecList:ArrayCollection=new ArrayCollection();

		private var _userInSql:String="";

		[Bindable]
		public function get treeData():XML
		{
			return _treeData;
		}

		public function set treeData(value:XML):void
		{
			_treeData=value;
		}

		[Bindable]
		public function get realServTypeBar():ArrayCollection
		{
			return _realServTypeBar;
		}

		public function set realServTypeBar(value:ArrayCollection):void
		{
			_realServTypeBar=value;
		}

		[Bindable]
		public function get hasAlarmList():ArrayCollection
		{
			return _hasAlarmList;
		}

		public function set hasAlarmList(value:ArrayCollection):void
		{
			_hasAlarmList=value;
		}

		[Bindable]
		public function get panelLeftList():ArrayCollection
		{
			return _panelLeftList;
		}

		public function set panelLeftList(value:ArrayCollection):void
		{
			_panelLeftList=value;
		}

		[Bindable]
		public function get panelRightList():ArrayCollection
		{
			return _panelRightList;
		}

		public function set panelRightList(value:ArrayCollection):void
		{
			_panelRightList=value;
		}

		[Bindable]
		public function get userCustList():ArrayCollection
		{
			return _userCustList;
		}

		public function set userCustList(value:ArrayCollection):void
		{
			_userCustList=value;
		}

		[Bindable]
		public function get userCustForPerfList():ArrayCollection
		{
			return _userCustForPerfList;
		}

		public function set userCustForPerfList(value:ArrayCollection):void
		{
			_userCustForPerfList=value;
		}

		[Bindable]
		public function get userCustKpiDataMap():Object
		{
			return _userCustKpiDataMap;
		}

		public function set userCustKpiDataMap(value:Object):void
		{
			_userCustKpiDataMap=value;
		}

		[Bindable]
		public function get disSpecNumList():ArrayCollection
		{
			return _disSpecNumList;
		}

		public function set disSpecNumList(value:ArrayCollection):void
		{
			_disSpecNumList=value;
		}

		[Bindable]
		public function get cityList():ArrayCollection
		{
			return _cityList;
		}

		public function set cityList(value:ArrayCollection):void
		{
			_cityList=value;
		}

		[Bindable]
		public function get industryList():ArrayCollection
		{
			return _industryList;
		}

		public function set industryList(value:ArrayCollection):void
		{
			_industryList=value;
		}

		[Bindable]
		public function get userLvl():ArrayCollection
		{
			return _userLvl;
		}

		public function set userLvl(value:ArrayCollection):void
		{
			_userLvl=value;
		}

		[Bindable]
		public function get servLvl():ArrayCollection
		{
			return _servLvl;
		}

		public function set servLvl(value:ArrayCollection):void
		{
			_servLvl=value;
		}

		[Bindable]
		public function get usersList():ArrayCollection
		{
			return _usersList;
		}

		public function set usersList(value:ArrayCollection):void
		{
			_usersList=value;
		}

		[Bindable]
		public function get selUsersList():ArrayCollection
		{
			return _selUsersList;
		}

		public function set selUsersList(value:ArrayCollection):void
		{
			_selUsersList=value;
		}

		[Bindable]
		public function get proOverCitySpecList():ArrayCollection
		{
			return _proOverCitySpecList;
		}

		public function set proOverCitySpecList(value:ArrayCollection):void
		{
			_proOverCitySpecList=value;
		}

		[Bindable]
		public function get overAreaSpecList():ArrayCollection
		{
			return _overAreaSpecList;
		}

		public function set overAreaSpecList(value:ArrayCollection):void
		{
			_overAreaSpecList=value;
		}

		[Bindable]
		public function get selCustList():ArrayCollection
		{
			return _selCustList;
		}

		public function set selCustList(value:ArrayCollection):void
		{
			_selCustList=value;
		}

		[Bindable]
		public function get userInSql():String
		{
			return _userInSql;
		}

		public function set userInSql(value:String):void
		{
			_userInSql = value;
		}


	}
}