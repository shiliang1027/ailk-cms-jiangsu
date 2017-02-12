package com.linkage.module.cms.general.regional.important.venue
{
	import mx.collections.ArrayCollection;

	public class VenueLocalTest
	{
		public static function getVenueInfo():Object
		{
			var result:Array=new Array();
			var obj:Object=new Object();
			obj["venue_id"]="1";
			obj["venue_name"]="场馆1";
			obj["alarm_level"]="1";
			obj["venue_image"]="./resouce/1.jpg";
			result.push(obj);

			var obj1:Object=new Object();
			obj1["venue_id"]="2";
			obj1["venue_name"]="场馆2";
			obj1["alarm_level"]="2";
			obj1["venue_image"]="./resouce/2.jpg";
			result.push(obj1);

			var obj2:Object=new Object();
			obj2["venue_id"]="3";
			obj2["venue_name"]="场馆3";
			obj2["alarm_level"]="24267342";
			obj2["venue_image"]="./resouce/3.jpg";
			result.push(obj2);

			var obj3:Object=new Object();
			obj3["venue_id"]="4";
			obj3["venue_name"]="场馆4";
			obj3["alarm_level"]="3";
			obj3["venue_image"]="./resouce/4.jpg";
			result.push(obj3);

			var obj4:Object=new Object();
			obj4["venue_id"]="5";
			obj4["venue_name"]="场馆5";
			obj4["alarm_level"]="1";
			obj4["venue_image"]="./resouce/5.jpg";
			result.push(obj4);

			var obj5:Object=new Object();
			obj5["venue_id"]="6";
			obj5["venue_name"]="场馆6";
			obj5["alarm_level"]="2";
			obj5["venue_image"]="./resouce/6.jpg";
			result.push(obj5);

			var obj6:Object=new Object();
			obj6["venue_id"]="7";
			obj6["venue_name"]="场馆7";
			obj6["alarm_level"]="4";
			obj6["venue_image"]="./resouce/7.jpg";
			result.push(obj6);

			var obj7:Object=new Object();
			obj7["venue_id"]="8";
			obj7["venue_name"]="场馆8";
			obj7["alarm_level"]="2";
			obj7["venue_image"]="./resouce/8.jpg";
			result.push(obj7);

			return result;
		}

		public static function getVenuePerfInfo():Object
		{
			var result:ArrayCollection=new ArrayCollection();

			var columnArray1:Array=new Array();
			columnArray1.push("index");
			columnArray1.push("venue_name");
			columnArray1.push("venue_value");

			var nameArray1:Array=new Array();
			nameArray1.push("序号");
			nameArray1.push("场馆名称");
			nameArray1.push("场馆指标值");

			var dataListArray1:ArrayCollection=new ArrayCollection();
			dataListArray1.addItem({index: '1', venue_name: '1号场馆', venue_value: '123'});
			dataListArray1.addItem({index: '2', venue_name: '2号场馆', venue_value: '23'});
			dataListArray1.addItem({index: '3', venue_name: '3号场馆', venue_value: '223'});
			dataListArray1.addItem({index: '4', venue_name: '4号场馆', venue_value: '23'});
			dataListArray1.addItem({index: '5', venue_name: '5号场馆', venue_value: '12'});

			result.addItem({'title': '短信量(2G)', 'column': columnArray1, 'name': nameArray1, 'dataList': dataListArray1});

			var columnArray2:Array=new Array();
			columnArray2.push("index");
			columnArray2.push("venue_name");
			columnArray2.push("venue_value");

			var nameArray2:Array=new Array();
			nameArray2.push("序号");
			nameArray2.push("场馆名称");
			nameArray2.push("场馆指标值");

			var dataListArray2:ArrayCollection=new ArrayCollection();
			dataListArray2.addItem({index: '1', venue_name: '1号场馆', venue_value: '123'});
			dataListArray2.addItem({index: '2', venue_name: '2号场馆', venue_value: '23'});
			dataListArray2.addItem({index: '3', venue_name: '3号场馆', venue_value: '223'});
			dataListArray2.addItem({index: '4', venue_name: '4号场馆', venue_value: '23'});
			dataListArray2.addItem({index: '5', venue_name: '5号场馆', venue_value: '12'});

			result.addItem({'title': '彩信量(2G)', 'column': columnArray2, 'name': nameArray2, 'dataList': dataListArray2});

			var columnArray3:Array=new Array();
			columnArray3.push("index");
			columnArray3.push("venue_name");
			columnArray3.push("venue_value");

			var nameArray3:Array=new Array();
			nameArray3.push("序号");
			nameArray3.push("场馆名称");
			nameArray3.push("场馆指标值");

			var dataListArray3:ArrayCollection=new ArrayCollection();
			dataListArray3.addItem({index: '1', venue_name: '1号场馆', venue_value: '123'});
			dataListArray3.addItem({index: '2', venue_name: '2号场馆', venue_value: '23'});
			dataListArray3.addItem({index: '3', venue_name: '3号场馆', venue_value: '223'});
			dataListArray3.addItem({index: '4', venue_name: '4号场馆', venue_value: '23'});
			dataListArray3.addItem({index: '5', venue_name: '5号场馆', venue_value: '12'});

			result.addItem({'title': '彩信量(2G)', 'column': columnArray3, 'name': nameArray3, 'dataList': dataListArray3});

			var columnArray4:Array=new Array();
			columnArray4.push("index");
			columnArray4.push("venue_name");
			columnArray4.push("venue_value");

			var nameArray4:Array=new Array();
			nameArray4.push("序号");
			nameArray4.push("场馆名称");
			nameArray4.push("场馆指标值");

			var dataListArray4:ArrayCollection=new ArrayCollection();
			dataListArray4.addItem({index: '1', venue_name: '1号场馆', venue_value: '144'});
			dataListArray4.addItem({index: '4', venue_name: '4号场馆', venue_value: '44'});
			dataListArray4.addItem({index: '4', venue_name: '4号场馆', venue_value: '444'});
			dataListArray4.addItem({index: '4', venue_name: '4号场馆', venue_value: '44'});
			dataListArray4.addItem({index: '5', venue_name: '5号场馆', venue_value: '14'});

			result.addItem({'title': '彩信量(4G)', 'column': columnArray4, 'name': nameArray4, 'dataList': dataListArray4});

			var columnArray5:Array=new Array();
			columnArray5.push("index");
			columnArray5.push("venue_name");
			columnArray5.push("venue_value");

			var nameArray5:Array=new Array();
			nameArray5.push("序号");
			nameArray5.push("场馆名称");
			nameArray5.push("场馆指标值");

			var dataListArray5:ArrayCollection=new ArrayCollection();
			dataListArray5.addItem({index: '1', venue_name: '1号场馆', venue_value: '155'});
			dataListArray5.addItem({index: '5', venue_name: '5号场馆', venue_value: '55'});
			dataListArray5.addItem({index: '5', venue_name: '5号场馆', venue_value: '555'});
			dataListArray5.addItem({index: '5', venue_name: '5号场馆', venue_value: '55'});
			dataListArray5.addItem({index: '5', venue_name: '5号场馆', venue_value: '15'});

			result.addItem({'title': '彩信量(5G)', 'column': columnArray5, 'name': nameArray5, 'dataList': dataListArray5});

			var columnArray6:Array=new Array();
			columnArray6.push("index");
			columnArray6.push("venue_name");
			columnArray6.push("venue_value");

			var nameArray6:Array=new Array();
			nameArray6.push("序号");
			nameArray6.push("场馆名称");
			nameArray6.push("场馆指标值");

			var dataListArray6:ArrayCollection=new ArrayCollection();
			dataListArray6.addItem({index: '1', venue_name: '1号场馆', venue_value: '166'});
			dataListArray6.addItem({index: '6', venue_name: '6号场馆', venue_value: '66'});
			dataListArray6.addItem({index: '6', venue_name: '6号场馆', venue_value: '666'});
			dataListArray6.addItem({index: '6', venue_name: '6号场馆', venue_value: '66'});
			dataListArray6.addItem({index: '6', venue_name: '6号场馆', venue_value: '16'});

			result.addItem({'title': '彩信量(6G)', 'column': columnArray6, 'name': nameArray6, 'dataList': dataListArray6});

			var columnArray7:Array=new Array();
			columnArray7.push("index");
			columnArray7.push("venue_name");
			columnArray7.push("venue_value");

			var nameArray7:Array=new Array();
			nameArray7.push("序号");
			nameArray7.push("场馆名称");
			nameArray7.push("场馆指标值");

			var dataListArray7:ArrayCollection=new ArrayCollection();
			dataListArray7.addItem({index: '1', venue_name: '1号场馆', venue_value: '177'});
			dataListArray7.addItem({index: '7', venue_name: '7号场馆', venue_value: '77'});
			dataListArray7.addItem({index: '7', venue_name: '7号场馆', venue_value: '777'});
			dataListArray7.addItem({index: '7', venue_name: '7号场馆', venue_value: '77'});
			dataListArray7.addItem({index: '7', venue_name: '7号场馆', venue_value: '17'});

			result.addItem({'title': '彩信量(7G)', 'column': columnArray7, 'name': nameArray7, 'dataList': dataListArray7});
			return result;
		}

		public static function getVenueAlarmInfo():Object
		{
			var result:Array=new Array();
			result.push("1、1号场馆发生性能告警");
			result.push("2、2号场馆发生性能告警");
			result.push("3、3号场馆发生性能告警");
			result.push("4、4号场馆发生性能告警");
			result.push("5、5号场馆发生性能告警");
			result.push("6、6号场馆发生性能告警");
			return result;
		}

		public static function getVenMaAla():Object
		{
			var columnArray1:ArrayCollection=new ArrayCollection();
			columnArray1.addItem("venue_name");
			columnArray1.addItem("venue_info");
			columnArray1.addItem("level1_num");
			columnArray1.addItem("cell_alarm");

			var nameArray1:ArrayCollection=new ArrayCollection();
			nameArray1.addItem("场馆名称");
			nameArray1.addItem("场馆赛事");
			nameArray1.addItem("一级告警");
			nameArray1.addItem("小区退服告警");

			var dataListArray1:ArrayCollection=new ArrayCollection();
			dataListArray1.addItem({'venue_name': '1号场馆', 'venue_info': '暂无赛事', 'level1_num': '0', 'level1_num_level': '0', 'cell_alarm': '2', 'cell_alarm_level': '0'});
			dataListArray1.addItem({'venue_name': '2号场馆', 'venue_info': '暂无赛事', 'level1_num': '0', 'level1_num_level': '0', 'cell_alarm': '3', 'cell_alarm_level': '0'});
			dataListArray1.addItem({'venue_name': '3号场馆', 'venue_info': '篮球赛', 'level1_num': '6', 'level1_num_level': '1', 'cell_alarm': '0', 'cell_alarm_level': '3'});
			dataListArray1.addItem({'venue_name': '4号场馆', 'venue_info': '暂无赛事', 'level1_num': '0', 'level1_num_level': '0', 'cell_alarm': '0', 'cell_alarm_level': '0'});
			dataListArray1.addItem({'venue_name': '5号场馆', 'venue_info': '暂无赛事', 'level1_num': '0', 'level1_num_level': '0', 'cell_alarm': '0', 'cell_alarm_level': '0'});

			return {'column': columnArray1, 'name': nameArray1, 'dataList': dataListArray1};
		}

		public static function getVenPerfList():Object
		{
			var result:ArrayCollection=new ArrayCollection();

			var columnArray1:ArrayCollection=new ArrayCollection();
			columnArray1.addItem("index");
			columnArray1.addItem("venue_name");
			columnArray1.addItem("venue_value");

			var nameArray1:ArrayCollection=new ArrayCollection();
			nameArray1.addItem("序号");
			nameArray1.addItem("场馆名称");
			nameArray1.addItem("场馆指标值");

			var dataListArray1:ArrayCollection=new ArrayCollection();
			dataListArray1.addItem({index: '1', 'venue_name': '1号场馆', 'venue_value': '123'});
			dataListArray1.addItem({index: '2', 'venue_name': '2号场馆', 'venue_value': '23'});
			dataListArray1.addItem({index: '3', 'venue_name': '3号场馆', 'venue_value': '223'});
			dataListArray1.addItem({index: '4', 'venue_name': '4号场馆', 'venue_value': '23'});
			dataListArray1.addItem({index: '5', 'venue_name': '5号场馆', 'venue_value': '12'});

			result.addItem({'title': '短信量(2G)', 'column': columnArray1, 'name': nameArray1, 'dataList': dataListArray1});

			var columnArray2:ArrayCollection=new ArrayCollection();
			columnArray2.addItem("index");
			columnArray2.addItem("venue_name");
			columnArray2.addItem("venue_value");

			var nameArray2:ArrayCollection=new ArrayCollection();
			nameArray2.addItem("序号");
			nameArray2.addItem("场馆名称");
			nameArray2.addItem("场馆指标值");

			var dataListArray2:ArrayCollection=new ArrayCollection();
			dataListArray2.addItem({index: '1', 'venue_name': '1号场馆', 'venue_value': '123'});
			dataListArray2.addItem({index: '2', 'venue_name': '2号场馆', 'venue_value': '23'});
			dataListArray2.addItem({index: '3', 'venue_name': '3号场馆', 'venue_value': '223'});
			dataListArray2.addItem({index: '4', 'venue_name': '4号场馆', 'venue_value': '23'});
			dataListArray2.addItem({index: '5', 'venue_name': '5号场馆', 'venue_value': '12'});

			result.addItem({'title': '彩信量(2G)', 'column': columnArray2, 'name': nameArray2, 'dataList': dataListArray2});

			var columnArray3:ArrayCollection=new ArrayCollection();
			columnArray3.addItem("index");
			columnArray3.addItem("venue_name");
			columnArray3.addItem("venue_value");

			var nameArray3:ArrayCollection=new ArrayCollection();
			nameArray3.addItem("序号");
			nameArray3.addItem("场馆名称");
			nameArray3.addItem("场馆指标值");

			var dataListArray3:ArrayCollection=new ArrayCollection();
			dataListArray3.addItem({index: '1', venue_name: '1号场馆', venue_value: '123'});
			dataListArray3.addItem({index: '2', venue_name: '2号场馆', venue_value: '23'});
			dataListArray3.addItem({index: '3', venue_name: '3号场馆', venue_value: '223'});
			dataListArray3.addItem({index: '4', venue_name: '4号场馆', venue_value: '23'});
			dataListArray3.addItem({index: '5', venue_name: '5号场馆', venue_value: '12'});

			result.addItem({'title': '彩信量(2G)', 'column': columnArray3, 'name': nameArray3, 'dataList': dataListArray3});

			var columnArray4:ArrayCollection=new ArrayCollection();
			columnArray4.addItem("index");
			columnArray4.addItem("venue_name");
			columnArray4.addItem("venue_value");

			var nameArray4:ArrayCollection=new ArrayCollection();
			nameArray4.addItem("序号");
			nameArray4.addItem("场馆名称");
			nameArray4.addItem("场馆指标值");

			var dataListArray4:ArrayCollection=new ArrayCollection();
			dataListArray4.addItem({index: '1', venue_name: '1号场馆', venue_value: '144'});
			dataListArray4.addItem({index: '4', venue_name: '4号场馆', venue_value: '44'});
			dataListArray4.addItem({index: '4', venue_name: '4号场馆', venue_value: '444'});
			dataListArray4.addItem({index: '4', venue_name: '4号场馆', venue_value: '44'});
			dataListArray4.addItem({index: '5', venue_name: '5号场馆', venue_value: '14'});

			result.addItem({'title': '彩信量(4G)', 'column': columnArray4, 'name': nameArray4, 'dataList': dataListArray4});

			var columnArray5:ArrayCollection=new ArrayCollection();
			columnArray5.addItem("index");
			columnArray5.addItem("venue_name");
			columnArray5.addItem("venue_value");

			var nameArray5:ArrayCollection=new ArrayCollection();
			nameArray5.addItem("序号");
			nameArray5.addItem("场馆名称");
			nameArray5.addItem("场馆指标值");

			var dataListArray5:ArrayCollection=new ArrayCollection();
			dataListArray5.addItem({index: '1', venue_name: '1号场馆', venue_value: '155'});
			dataListArray5.addItem({index: '5', venue_name: '5号场馆', venue_value: '55'});
			dataListArray5.addItem({index: '5', venue_name: '5号场馆', venue_value: '555'});
			dataListArray5.addItem({index: '5', venue_name: '5号场馆', venue_value: '55'});
			dataListArray5.addItem({index: '5', venue_name: '5号场馆', venue_value: '15'});

			result.addItem({'title': '彩信量(5G)', 'column': columnArray5, 'name': nameArray5, 'dataList': dataListArray5});

			var columnArray6:ArrayCollection=new ArrayCollection();
			columnArray6.addItem("index");
			columnArray6.addItem("venue_name");
			columnArray6.addItem("venue_value");

			var nameArray6:ArrayCollection=new ArrayCollection();
			nameArray6.addItem("序号");
			nameArray6.addItem("场馆名称");
			nameArray6.addItem("场馆指标值");

			var dataListArray6:ArrayCollection=new ArrayCollection();
			dataListArray6.addItem({index: '1', venue_name: '1号场馆', venue_value: '166'});
			dataListArray6.addItem({index: '6', venue_name: '6号场馆', venue_value: '66'});
			dataListArray6.addItem({index: '6', venue_name: '6号场馆', venue_value: '666'});
			dataListArray6.addItem({index: '6', venue_name: '6号场馆', venue_value: '66'});
			dataListArray6.addItem({index: '6', venue_name: '6号场馆', venue_value: '16'});

			result.addItem({'title': '彩信量(6G)', 'column': columnArray6, 'name': nameArray6, 'dataList': dataListArray6});

			var columnArray7:ArrayCollection=new ArrayCollection();
			columnArray7.addItem("index");
			columnArray7.addItem("venue_name");
			columnArray7.addItem("venue_value");

			var nameArray7:ArrayCollection=new ArrayCollection();
			nameArray7.addItem("序号");
			nameArray7.addItem("场馆名称");
			nameArray7.addItem("场馆指标值");

			var dataListArray7:ArrayCollection=new ArrayCollection();
			dataListArray7.addItem({index: '1', venue_name: '1号场馆', venue_value: '177'});
			dataListArray7.addItem({index: '7', venue_name: '7号场馆', venue_value: '77'});
			dataListArray7.addItem({index: '7', venue_name: '7号场馆', venue_value: '777'});
			dataListArray7.addItem({index: '7', venue_name: '7号场馆', venue_value: '77'});
			dataListArray7.addItem({index: '7', venue_name: '7号场馆', venue_value: '17'});

			result.addItem({'title': '彩信量(7G)', 'column': columnArray7, 'name': nameArray7, 'dataList': dataListArray7});
			return result;
		}
	}
}