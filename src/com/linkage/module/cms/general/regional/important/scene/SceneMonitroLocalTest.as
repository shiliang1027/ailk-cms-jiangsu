package com.linkage.module.cms.general.regional.important.scene
{
	import mx.collections.ArrayCollection;

	public class SceneMonitroLocalTest
	{
		public static function getVenueListInfo():Object
		{
			var result:Array=new Array();
			var obj:Object=new Object();
			obj["venue_id"]="1";
			obj["venue_name"]="场馆1";
			obj["venue_image"]="./resouce/1.jpg";
			result.push(obj);

			var obj1:Object=new Object();
			obj1["venue_id"]="2";
			obj1["venue_name"]="场馆2";
			obj1["venue_image"]="./resouce/2.jpg";
			result.push(obj1);

			var obj2:Object=new Object();
			obj2["venue_id"]="3";
			obj2["venue_name"]="场馆3";
			obj2["venue_image"]="./resouce/3.jpg";
			result.push(obj2);

			var obj3:Object=new Object();
			obj3["venue_id"]="4";
			obj3["venue_name"]="场馆4";
			obj3["venue_image"]="./resouce/4.jpg";
			result.push(obj3);

			var obj4:Object=new Object();
			obj4["venue_id"]="5";
			obj4["venue_name"]="场馆5";
			obj4["venue_image"]="./resouce/5.jpg";
			result.push(obj4);

			var obj5:Object=new Object();
			obj5["venue_id"]="6";
			obj5["venue_name"]="场馆6";
			obj5["venue_image"]="./resouce/6.jpg";
			result.push(obj5);

			var obj6:Object=new Object();
			obj6["venue_id"]="7";
			obj6["venue_name"]="场馆7";
			obj6["venue_image"]="./resouce/7.jpg";
			result.push(obj6);

			var obj7:Object=new Object();
			obj7["venue_id"]="8";
			obj7["venue_name"]="场馆8";
			obj7["venue_image"]="./resouce/8.jpg";
			result.push(obj7);

			var obj8:Object=new Object();
			obj8["venue_id"]="9";
			obj8["venue_name"]="场馆9";
			obj8["venue_image"]="./resouce/pic.jpg";
			result.push(obj8);

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

		public static function getVenuePicture():Object
		{
			var result:Object=new Object();
			result["img_id"]="123";
			result["img_name"]="图片名称";
//			var rd:int=int(Math.random() * 2);
//			if (rd % 2 == 0)
//			{
			result["img_url"]="./resouce/pic.jpg";
			result["img_type"]="picture";
//			}
//			else
//			{
//			result["img_url"]="./resouce/flv.flv";
//			result["img_type"]="movie";
//			}
			return result;
		}

		public static function getVenueOutlineInfo():Object
		{
			var result:Object=new Object();

			//1.资源信息
			var array:ArrayCollection=new ArrayCollection();
			array.addItem({'资源名称': 'MSC/MSS', '资源量': '1'});
			array.addItem({'资源名称': 'BSC/RNC', '资源量': '23'});
			array.addItem({'资源名称': '2G小区数', '资源量': '56'});
			array.addItem({'资源名称': 'TD小区数', '资源量': '33'});
			array.addItem({'资源名称': '应急通信车数', '资源量': '24'});
			array.addItem({'资源名称': '应急通信车小区数', '资源量': '80'});
			array.addItem({'资源名称': 'WLAN AP数', '资源量': '92'});
			result["资源信息"]=array;

			//2.业务量
			var array1:ArrayCollection=new ArrayCollection();
			array1.addItem({'统计时间': '2011-07-03 22:00:00', '业务名称': '话务量', '统计值': '12'});
			array1.addItem({'统计时间': '2011-07-03 21:00:00', '业务名称': '话务量', '统计值': '12'});
			array1.addItem({'统计时间': '2011-07-03 23:00:00', '业务名称': '话务量', '统计值': '2'});
			array1.addItem({'统计时间': '2011-07-03 12:00:00', '业务名称': '话务量', '统计值': '3'});
			array1.addItem({'统计时间': '2011-07-03 12:00:00', '业务名称': '话务量', '统计值': '12'});
			array1.addItem({'统计时间': '2011-07-03 22:00:00', '业务名称': '话务量', '统计值': '3'});
			array1.addItem({'统计时间': '2011-07-03 22:00:00', '业务名称': '话务量', '统计值': '12'});
			array1.addItem({'统计时间': '2011-07-03 22:00:00', '业务名称': '话务量', '统计值': '12'});
			result["业务量"]=array1;

			//2.性能信息
			var array2:ArrayCollection=new ArrayCollection();
			array2.addItem({'统计时间': '2011-07-03 22:00:00', '业务名称': 'TCH信道拥塞率', '统计值': '12'});
			array2.addItem({'统计时间': '2011-07-03 22:00:00', '业务名称': 'TCH信道拥塞率', '统计值': '12'});
			array2.addItem({'统计时间': '2011-07-03 22:00:00', '业务名称': 'TCH信道拥塞率', '统计值': '12'});
			array2.addItem({'统计时间': '2011-07-03 22:00:00', '业务名称': 'TCH信道拥塞率', '统计值': '2'});
			array2.addItem({'统计时间': '2011-07-03 22:00:00', '业务名称': 'TCH信道拥塞率', '统计值': '12'});
			array2.addItem({'统计时间': '2011-07-03 22:00:00', '业务名称': 'TCH信道拥塞率', '统计值': '5'});
			array2.addItem({'统计时间': '2011-07-03 22:00:00', '业务名称': 'TCH信道拥塞率', '统计值': '12'});
			array2.addItem({'统计时间': '2011-07-03 22:00:00', '业务名称': 'TCH信道拥塞率', '统计值': '11'});
			array2.addItem({'统计时间': '2011-07-03 22:00:00', '业务名称': 'TCH信道拥塞率', '统计值': '12'});
			result["性能信息"]=array2;

			return result;
		}

		public static function getVenueInfo():Object
		{
			var result:Object=new Object();
			result["venue_name"]="玄武体育中心";
			result["city_name"]="南京";
			result["location"]="月苑南路";
			result["seating"]="50000";
			result["curr_race"]="欧冠足球四分之一决赛";
			return result;
		}

		public static function getVenueEnsureDoc():Object
		{
			var result:Object=new Object();
			result["ensure_desc"]="4月3日15点10分，我省南京市舞台山体育馆开始进行足球赛，中国移动南京公司做出积极响应，启动应急保障方案，全力协助比赛主办方做好比赛通讯保障工作。";
			result["ensure_doc_url"]="http://www.baidu.com";
			return result;
		}

		public static function getVenueRaceInfo():Object
		{
			var result:ArrayCollection=new ArrayCollection();
			result.addItem({race_name: "足球赛", race_start: '2011-07-04 08:30:00', race_end: '2011-07-04 10:30:00'});
			result.addItem({race_name: "男子篮球赛", race_start: '2011-07-04 08:30:00', race_end: '2011-07-04 10:30:00'});
			result.addItem({race_name: "男子400米", race_start: '2011-07-04 08:30:00', race_end: '2011-07-04 10:30:00'});
			result.addItem({race_name: "马拉松", race_start: '2011-07-04 08:30:00', race_end: '2011-07-04 10:30:00'});
			result.addItem({race_name: "男子1000米", race_start: '2011-07-04 08:30:00', race_end: '2011-07-04 10:30:00'});
			return result;
		}

		public static function getAllVenueNe():Object
		{
			var result:ArrayCollection=new ArrayCollection();
			result.addItem({mo_id: '1', mo_name: '体育馆无线设备1', mo_type_name: 'bts', x: '323.6', y: '67.2', alarmLevel: '1'});
			result.addItem({mo_id: '2', mo_name: '体育馆无线设备2', mo_type_name: 'cell', x: '393.6', y: '396.2', alarmLevel: '2'});
			return result;
		}

		public static function getNeSegmentData():Object
		{
			var result:ArrayCollection=new ArrayCollection();
			result.addItem({show_name: 'GMS话务量', gather_time: '2011-07-01 08:00:00', perf_value: '187.2'});
			result.addItem({show_name: 'TD语音话务量', gather_time: '2011-07-01 08:00:00', perf_value: '187.2'});
			result.addItem({show_name: '2G话务量', gather_time: '2011-07-01 08:00:00', perf_value: '187.2'});
			result.addItem({show_name: '寻呼成功率', gather_time: '2011-07-01 08:00:00', perf_value: '187.2'});
			result.addItem({show_name: '小区拥塞率', gather_time: '2011-07-01 08:00:00', perf_value: '187.2'});
			return result;
		}

		public static function getNeSegment():Object
		{
			var result:ArrayCollection=new ArrayCollection();
			result.addItem({show_name: 'GMS话务量'});
			result.addItem({show_name: 'TD语音话务量'});
			result.addItem({show_name: '2G话务量'});
			result.addItem({show_name: '寻呼成功率'});
			result.addItem({show_name: '小区拥塞率'});
			return result;
		}

		public static function getVenueAlarmFilter():String
		{
			return "(specialty=交换|specialty=2G无线)&(alarmseverity=1)";
		}
	}
}