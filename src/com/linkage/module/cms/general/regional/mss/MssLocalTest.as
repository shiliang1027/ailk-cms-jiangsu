package com.linkage.module.cms.general.regional.mss
{
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;

	public class MssLocalTest
	{
		public static function getAllSegmentList():ArrayList
		{
			var result:ArrayList=new ArrayList();
			result.addItem({mo_type_id: 'cell', perf_type_id: 'xx', show_name: '话务量', perf_algorithm: 'day'});
			result.addItem({mo_type_id: 'cell', perf_type_id: 'xx', show_name: '短信量', perf_algorithm: 'day'});
			result.addItem({mo_type_id: 'ucell', perf_type_id: 'xx', show_name: '彩信量', perf_algorithm: 'day'});
			result.addItem({mo_type_id: 'ucell', perf_type_id: 'xx', show_name: '用户数', perf_algorithm: 'day'});
			return result;
		}

		public static function getAllTemplateByType():ArrayCollection
		{
			var result:ArrayCollection=new ArrayCollection();
			result.addItem({msg_temp_id: '1', monitor_id: '1', msg_temp_name: '标题1', send_target: '15050502525', msg_title: '话务量', net_img_url: 'http://www.baidu.com'});
			result.addItem({msg_temp_id: '2', monitor_id: '1', msg_temp_name: '标题2', send_target: '15050502525', msg_title: '话务量', net_img_url: 'http://www.baidu.com'});
			result.addItem({msg_temp_id: '3', monitor_id: '1', msg_temp_name: '标题3', send_target: '15050502525', msg_title: '话务量', net_img_url: 'http://www.baidu.com'});
			return result;
		}

		public static function getTemplateInfoByTempId():Object
		{
			var result:Object=new Object();
			result["template"]={msg_temp_id: '1', monitor_id: '1', msg_temp_name: '标题1', send_target: '15050502525', msg_title: '话务量', msg_content: '话务量正常', net_img_url: 'http://www.baidu.com'};
			var array:ArrayCollection=new ArrayCollection();

			var list:ArrayCollection=new ArrayCollection();
			list.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '08:30:00'});
			list.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '09:00:00'});
			list.addItem({perf_value: '31.2', show_name: '话务量', gather_time: '09:30:00'});
			list.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '10:00:00'});
			list.addItem({perf_value: '32.2', show_name: '话务量', gather_time: '10:30:00'});
			list.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '11:00:00'});
			list.addItem({perf_value: '23.2', show_name: '话务量', gather_time: '11:30:00'});
			list.addItem({perf_value: '13.1', show_name: '话务量', gather_time: '12:00:00'});
			list.addItem({perf_value: '13.2', show_name: '话务量', gather_time: '12:30:00'});
			list.addItem({perf_value: '31.1', show_name: '话务量', gather_time: '13:00:00'});
			list.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '13:30:00'});
			array.addItem({statDataOutline: '截至到2011年4月7日14:00止,话务量为XXX', latestData: 'XXX最近一次数据是46.3', statData: list});

			var list1:ArrayCollection=new ArrayCollection();
			list1.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '08:30:00'});
			list1.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '09:00:00'});
			list1.addItem({perf_value: '31.2', show_name: '话务量', gather_time: '09:30:00'});
			list1.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '10:00:00'});
			list1.addItem({perf_value: '32.2', show_name: '话务量', gather_time: '10:30:00'});
			list1.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '11:00:00'});
			list1.addItem({perf_value: '23.2', show_name: '话务量', gather_time: '11:30:00'});
			list1.addItem({perf_value: '13.1', show_name: '话务量', gather_time: '12:00:00'});
			list1.addItem({perf_value: '13.2', show_name: '话务量', gather_time: '12:30:00'});
			list1.addItem({perf_value: '31.1', show_name: '话务量', gather_time: '13:00:00'});
			list1.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '13:30:00'});
			array.addItem({statDataOutline: '截至到2011年4月7日14:00止,话务量为XXX', latestData: 'XXX最近一次数据是46.3', statData: list1});

			var list2:ArrayCollection=new ArrayCollection();
			list2.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '08:30:00'});
			list2.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '09:00:00'});
			list2.addItem({perf_value: '31.2', show_name: '话务量', gather_time: '09:30:00'});
			list2.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '10:00:00'});
			list2.addItem({perf_value: '32.2', show_name: '话务量', gather_time: '10:30:00'});
			list2.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '11:00:00'});
			list2.addItem({perf_value: '23.2', show_name: '话务量', gather_time: '11:30:00'});
			list2.addItem({perf_value: '13.1', show_name: '话务量', gather_time: '12:00:00'});
			list2.addItem({perf_value: '13.2', show_name: '话务量', gather_time: '12:30:00'});
			list2.addItem({perf_value: '31.1', show_name: '话务量', gather_time: '13:00:00'});
			list2.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '13:30:00'});
			array.addItem({statDataOutline: '截至到2011年4月7日14:00止,话务量为XXX', latestData: 'XXX最近一次数据是46.3', statData: list2});

			var list3:ArrayCollection=new ArrayCollection();
			list3.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '08:30:00'});
			list3.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '09:00:00'});
			list3.addItem({perf_value: '31.2', show_name: '话务量', gather_time: '09:30:00'});
			list3.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '10:00:00'});
			list3.addItem({perf_value: '32.2', show_name: '话务量', gather_time: '10:30:00'});
			list3.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '11:00:00'});
			list3.addItem({perf_value: '23.2', show_name: '话务量', gather_time: '11:30:00'});
			list3.addItem({perf_value: '13.1', show_name: '话务量', gather_time: '12:00:00'});
			list3.addItem({perf_value: '13.2', show_name: '话务量', gather_time: '12:30:00'});
			list3.addItem({perf_value: '31.1', show_name: '话务量', gather_time: '13:00:00'});
			list3.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '13:30:00'});
			array.addItem({statDataOutline: '截至到2011年4月7日14:00止,话务量为XXX', latestData: 'XXX最近一次数据是46.3', statData: list3});

			result["segmentList"]=array;
			return result;
		}

		public static function saveOrUpdateSegment():Object
		{
			var list3:ArrayCollection=new ArrayCollection();
			list3.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '08:30:00'});
			list3.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '09:00:00'});
			list3.addItem({perf_value: '31.2', show_name: '话务量', gather_time: '09:30:00'});
			list3.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '10:00:00'});
			list3.addItem({perf_value: '32.2', show_name: '话务量', gather_time: '10:30:00'});
			list3.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '11:00:00'});
			list3.addItem({perf_value: '23.2', show_name: '话务量', gather_time: '11:30:00'});
			list3.addItem({perf_value: '13.1', show_name: '话务量', gather_time: '12:00:00'});
			list3.addItem({perf_value: '13.2', show_name: '话务量', gather_time: '12:30:00'});
			list3.addItem({perf_value: '31.1', show_name: '话务量', gather_time: '13:00:00'});
			list3.addItem({perf_value: '33.2', show_name: '话务量', gather_time: '13:30:00'});
			return {statDataOutline: '截至到2011年4月7日14:00止,话务量为XXX', latestData: 'XXX最近一次数据是46.3', statData: list3};
		}
	}
}