package com.linkage.module.cms.scene.domain.roam
{
	import mx.collections.ArrayCollection;

	public class RoamDM
	{
		//导航栏数据
		private var _tabBarData:ArrayCollection=new ArrayCollection();

		//分钟下拉框
		private var _timeData:ArrayCollection=new ArrayCollection([{label: "00:00", hour: 0}, {label: "01:00", hour: 1}, {label: "02:00", hour: 2}, {label: "03:00", hour: 3}, {label: "04:00", hour: 4}, {label: "05:00", hour: 5}, {label: "06:00", hour: 6}, {label: "07:00", hour: 7}, {label: "08:00", hour: 8}, {label: "09:00", hour: 9}, {label: "10:00", hour: 10}, {label: "11:00", hour: 11}, {label: "12:00", hour: 12}, {label: "13:00", hour: 13}, {label: "14:00", hour: 14}, {label: "15:00", hour: 15}, {label: "16:00", hour: 16}, {label: "17:00", hour: 17}, {label: "18:00", hour: 18}, {label: "19:00", hour: 19}, {label: "20:00", hour: 20}, {label: "21:00", hour: 21}, {label: "22:00", hour: 22}, {label: "23:00", hour: 23}]);

		//漫入  漫出
		//private var _roamTypes:Object = {"roam_in": "1", "roam_out":"2"};

		//颜色数据
		private var _colorLegends:ArrayCollection=new ArrayCollection();

		//漫入 或者漫出 标志
		//private var _roamType:String = "1";

		//地图列表数据集
		private var _mapDadaList:ArrayCollection=new ArrayCollection();

		//趋势图数据集
		private var _chartDataList:ArrayCollection=new ArrayCollection();

		//保存图例信息结果
		private var _result:String;

		[Bindable]
		public function get tabBarData():ArrayCollection
		{
			return _tabBarData;
		}

		public function set tabBarData(value:ArrayCollection):void
		{
			_tabBarData=value;
		}

		[Bindable]
		public function get timeData():ArrayCollection
		{
			return _timeData;
		}

		public function set timeData(value:ArrayCollection):void
		{
			_timeData=value;
		}

//		public function get roamTypes():Object
//		{
//			return _roamTypes;
//		}
//
//		public function set roamTypes(value:Object):void
//		{
//			_roamTypes = value;
//		}

		[Bindable]
		public function get mapDadaList():ArrayCollection
		{
			return _mapDadaList;
		}

		public function set mapDadaList(value:ArrayCollection):void
		{
			_mapDadaList=value;
		}

//		public function get roamType():String
//		{
//			return _roamType;
//		}
//
//		public function set roamType(value:String):void
//		{
//			_roamType = value;
//		}

		[Bindable]
		public function get chartDataList():ArrayCollection
		{
			return _chartDataList;
		}

		public function set chartDataList(value:ArrayCollection):void
		{
			_chartDataList=value;
		}

		[Bindable]
		public function get colorLegends():ArrayCollection
		{
			return _colorLegends;
		}

		public function set colorLegends(value:ArrayCollection):void
		{
			_colorLegends=value;
		}

		public function get result():String
		{
			return _result;
		}

		public function set result(value:String):void
		{
			_result=value;
		}


	}
}