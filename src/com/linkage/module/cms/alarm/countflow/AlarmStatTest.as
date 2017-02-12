package com.linkage.module.cms.alarm.countflow
{
	import mx.collections.ArrayCollection;

	public class AlarmStatTest
	{
		//加载告警统计趋势图数据
		public static function loadWarnLineData():Object
		{
			var arrayCollection:ArrayCollection=new ArrayCollection();
			arrayCollection.addItem({gathertime: '2011-12-7', bussname: '核心网', value: '10'});
			arrayCollection.addItem({gathertime: '2011-12-8', bussname: '核心网', value: '20'});
			arrayCollection.addItem({gathertime: '2011-12-9', bussname: '核心网', value: '130'});

			arrayCollection.addItem({gathertime: '2011-12-7', bussname: '2G无线', value: '20'});
			arrayCollection.addItem({gathertime: '2011-12-8', bussname: '2G无线', value: '10'});
			arrayCollection.addItem({gathertime: '2011-12-9', bussname: '2G无线', value: '10'});

			arrayCollection.addItem({gathertime: '2011-12-7', bussname: '3G无线', value: '20'});
			arrayCollection.addItem({gathertime: '2011-12-8', bussname: '3G无线', value: '30'});
			arrayCollection.addItem({gathertime: '2011-12-9', bussname: '3G无线', value: '10'});
			return arrayCollection;
		}

		//加载工单统计趋势图数据
		public static function loadSheetLineData():Object
		{
			var arrayCollection:ArrayCollection=new ArrayCollection();
			arrayCollection.addItem({gathertime: '2011-12-7', bussname: '核心网', value: '10'});
			arrayCollection.addItem({gathertime: '2011-12-8', bussname: '核心网', value: '20'});
			arrayCollection.addItem({gathertime: '2011-12-9', bussname: '核心网', value: '130'});

			arrayCollection.addItem({gathertime: '2011-12-7', bussname: '2G无线', value: '20'});
			arrayCollection.addItem({gathertime: '2011-12-8', bussname: '2G无线', value: '10'});
			arrayCollection.addItem({gathertime: '2011-12-9', bussname: '2G无线', value: '10'});

			arrayCollection.addItem({gathertime: '2011-12-7', bussname: '3G无线', value: '20'});
			arrayCollection.addItem({gathertime: '2011-12-8', bussname: '3G无线', value: '30'});
			arrayCollection.addItem({gathertime: '2011-12-9', bussname: '3G无线', value: '10'});
			return arrayCollection;
		}

		//加载关联统计趋势图数据
		public static function loadRelaLineData():Object
		{
			var arrayCollection:ArrayCollection=new ArrayCollection();
			arrayCollection.addItem({gathertime: '2011-12-7', bussname: '集客监控', value: '10'});
			arrayCollection.addItem({gathertime: '2011-12-8', bussname: '集客监控', value: '20'});
			arrayCollection.addItem({gathertime: '2011-12-9', bussname: '集客监控', value: '130'});

			arrayCollection.addItem({gathertime: '2011-12-7', bussname: '基站跨专业', value: '20'});
			arrayCollection.addItem({gathertime: '2011-12-8', bussname: '基站跨专业', value: '10'});
			arrayCollection.addItem({gathertime: '2011-12-9', bussname: '基站跨专业', value: '10'});

			arrayCollection.addItem({gathertime: '2011-12-7', bussname: '集中性能', value: '20'});
			arrayCollection.addItem({gathertime: '2011-12-8', bussname: '集中性能', value: '30'});
			arrayCollection.addItem({gathertime: '2011-12-9', bussname: '集中性能', value: '10'});
			return arrayCollection;
		}

		//获取告警统计数据
		public static function getWarnStatInfoList():Object
		{
			var arrayCollection:ArrayCollection=new ArrayCollection();
			arrayCollection.addItem({spec_id: '1', spec_name: '核心', oneequipmentalarm: '12', onecapabilityalarm: '21', effectuser: '2'});
			arrayCollection.addItem({spec_id: '1', spec_name: '2G无线', oneequipmentalarm: '12', onecapabilityalarm: '21', effectuser: '2'});
			arrayCollection.addItem({spec_id: '1', spec_name: '3G无线', oneequipmentalarm: '16', onecapabilityalarm: '21', effectuser: '2'});
			arrayCollection.addItem({spec_id: '1', spec_name: '动环', oneequipmentalarm: '12', onecapabilityalarm: '21', effectuser: '2'});
			arrayCollection.addItem({spec_id: '1', spec_name: '传输', oneequipmentalarm: '11', onecapabilityalarm: '21', effectuser: '2'});
			arrayCollection.addItem({spec_id: '1', spec_name: '数据', oneequipmentalarm: '15', onecapabilityalarm: '21', effectuser: '2'});
			return arrayCollection;
		}

		//获取工单统计数据
		public static function getSheetWarnStatInfoList():Object
		{
			var arrayCollection:ArrayCollection=new ArrayCollection();
			arrayCollection.addItem({spec_id: '1', spec_name: '核心', dispatch: '3', process: '0', overtime: '3'});
			arrayCollection.addItem({spec_id: '1', spec_name: '2G无线', dispatch: '3', process: '0', overtime: '3'});
			arrayCollection.addItem({spec_id: '1', spec_name: '3G无线', dispatch: '3', process: '0', overtime: '3'});
			arrayCollection.addItem({spec_id: '1', spec_name: '动环', dispatch: '3', process: '0', overtime: '3'});
			arrayCollection.addItem({spec_id: '1', spec_name: '传输', dispatch: '3', process: '0', overtime: '3'});
			arrayCollection.addItem({spec_id: '1', spec_name: '数据', dispatch: '3', process: '0', overtime: '3'});
			return arrayCollection;
		}

		//获取告警关联统计数据
		public static function getRelaWarnStatData():Object
		{
			var arrayCollection:ArrayCollection=new ArrayCollection();
			arrayCollection.addItem({name: '集客监控', rule_context: 'customerflag=1', bnum: '23', anum: '222', sendnum: '32', cancelnum: '12'});
			arrayCollection.addItem({name: '基站跨专业', rule_context: 'customerflag=1', bnum: '23', anum: '228', sendnum: '32', cancelnum: '12'});
			arrayCollection.addItem({name: '集中性能', rule_context: 'customerflag=1', bnum: '23', anum: '227', sendnum: '32', cancelnum: '12'});
			arrayCollection.addItem({name: '其他监控', rule_context: 'customerflag=1', bnum: '23', anum: '221', sendnum: '32', cancelnum: '12'});
			arrayCollection.addItem({name: '故障预判', rule_context: 'customerflag=1', bnum: '23', anum: '226', sendnum: '32', cancelnum: '12'});
			return arrayCollection;
		}

		//获取告警关联统计数据
		public static function loadSheetDetailData():Object
		{
			var arrayCollection:ArrayCollection=new ArrayCollection();
			arrayCollection.addItem({specId: '1', specName: '核心', cityName: '南京市', num: '23'});
			arrayCollection.addItem({specId: '1', specName: '核心', cityName: '无锡市', num: '23'});
			arrayCollection.addItem({specId: '1', specName: '核心', cityName: '苏州市', num: '23'});
			arrayCollection.addItem({specId: '1', specName: '核心', cityName: '常州市', num: '23'});
			arrayCollection.addItem({specId: '1', specName: '核心', cityName: '镇江市', num: '23'});
			return arrayCollection;
		}

		//获取告警关联统计列表
		public static function loadSheetDetailInfo():Object
		{
			var arrayCollection:ArrayCollection=new ArrayCollection();
			arrayCollection.addItem({form_no: '1', nename: 'm1', alarmtitle: '工单1'});
			arrayCollection.addItem({form_no: '2', nename: 'm2', alarmtitle: '工单2'});
			arrayCollection.addItem({form_no: '3', nename: 'm3', alarmtitle: '工单3'});
			return arrayCollection;
		}
	}
}