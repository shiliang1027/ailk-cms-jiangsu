package com.linkage.module.cms.perfmonitor.monitor.alarm
{
	import mx.collections.ArrayCollection;

	public class AlarmMonitorTest
	{
		public static function loadStatData():Object
		{
			var result:Object=new Object();

			var arrayCollection1:ArrayCollection=new ArrayCollection();
			arrayCollection1.addItem({id: '1', name: '核心网', level1: '12000', level2: '21'});
			arrayCollection1.addItem({id: '7', name: '无线网', level1: '12', level2: '21'});
			arrayCollection1.addItem({id: '2', name: '数据网', level1: '12', level2: '21'});

			var arrayCollection2:ArrayCollection=new ArrayCollection();
			arrayCollection2.addItem({id: '41', name: '基础话音数据', level1: '12', level2: '21'});
			arrayCollection2.addItem({id: '42', name: '短信', level1: '12', level2: '21'});
			arrayCollection2.addItem({id: '43', name: '彩信', level1: '12', level2: '21'});
			arrayCollection2.addItem({id: '44', name: 'WLAN', level1: '12', level2: '21'});
			arrayCollection2.addItem({id: '45', name: 'CMNET', level1: '12', level2: '21'});

			var arrayCollection3:ArrayCollection=new ArrayCollection();
			arrayCollection3.addItem({id: '61', name: '小区专题', total: '12', maxseverity: '1'});
			arrayCollection3.addItem({id: '62', name: 'WLAN专题', total: '12', maxseverity: '2'});
			arrayCollection3.addItem({id: '63', name: '动环专题', total: '12', maxseverity: '2'});

			result.equit=arrayCollection1;
			result.buss=arrayCollection2;
			result.subject=arrayCollection3;

			return result;
		}
	}
}