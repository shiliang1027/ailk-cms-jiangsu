package com.linkage.module.cms.general.regional.main.multiview
{

	public class MultiViewLocalTest
	{
		public static function loadAlarmTotal():Object
		{
			var result:Array=new Array();
			for (var i:int=1; i <= 6; i++)
			{
				var obj:Object=new Object();
				obj["spec"]=i;
				obj["level1"]=i * 100 % 6;
				obj["level2"]=i * 100 % 5;
				obj["level3"]=i * 100 % 3;
				obj["level4"]=i * 100 % 2;
				result.push(obj);
			}
			return result;
		}

		public static function getSegmentList():Object
		{
			var result:Array=new Array();
			var obj:Object=new Object();
			obj["mo_type_id"]="1";
			obj["show_name"]="话务量";
			obj["perf_type_id"]="1";
			result.push(obj);

			var obj1:Object=new Object();
			obj1["mo_type_id"]="2";
			obj1["show_name"]="最坏小区";
			obj1["perf_type_id"]="2";
			result.push(obj1);

			var obj2:Object=new Object();
			obj2["mo_type_id"]="3";
			obj2["show_name"]="短信量";
			obj2["perf_type_id"]="3";
			result.push(obj2);

			return result;
		}

		public static function getSegmentData():Object
		{
			var resultObj:Object=new Object();
			var result:Array=new Array();
			var obj:Object=new Object();
			obj["perf_time"]="08:15";
			obj["perf_value"]="93";
			result.push(obj);

			var obj1:Object=new Object();
			obj1["perf_time"]="08:30";
			obj1["perf_value"]="83";
			result.push(obj1);

			var obj2:Object=new Object();
			obj2["perf_time"]="08:45";
			obj2["perf_value"]="90";
			result.push(obj2);

			var obj3:Object=new Object();
			obj3["perf_time"]="09:00";
			obj3["perf_value"]="100";
			result.push(obj3);

			var obj4:Object=new Object();
			obj4["perf_time"]="09:15";
			obj4["perf_value"]="70";
			result.push(obj4);

			var obj5:Object=new Object();
			obj5["perf_time"]="09:30";
			obj5["perf_value"]="60";
			result.push(obj5);

			var obj6:Object=new Object();
			obj6["perf_time"]="09:45";
			obj6["perf_value"]="70";
			result.push(obj6);

			var obj7:Object=new Object();
			obj7["perf_time"]="10:00";
			obj7["perf_value"]="90";
			result.push(obj7);

			var obj8:Object=new Object();
			obj8["perf_time"]="10:15";
			obj8["perf_value"]="80";
			result.push(obj8);

			resultObj["1_1"]=result;
			resultObj["2_2"]=result;
			resultObj["3_3"]=result;

			return resultObj;
		}

		public static function getAlarmFilter():String
		{
			return "(specialty=交换|specialty=2G无线)&(alarmseverity=1)";
		}
	}
}