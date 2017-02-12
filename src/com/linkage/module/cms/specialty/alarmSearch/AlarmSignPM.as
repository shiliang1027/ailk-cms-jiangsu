package com.linkage.module.cms.specialty.alarmSearch
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.view.components.util.FileUpDownLoad;
	import com.linkage.module.cms.specialty.alarmSearch.domain.AlarmSignDM;
	import com.linkage.module.cms.specialty.alarmSearch.event.AlarmSignEvent;

	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.net.URLVariables;

	import mx.collections.ArrayCollection;

	import org.spicefactory.lib.reflect.types.Void;

	/**
	 *
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2013-2-27
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class AlarmSignPM
	{
		private var log:ILogger = Log.getLoggerByClass(AlarmSignPM);
		private var fileRefer:FileReference = new FileReference();
		private var fileUpDownLoad:FileUpDownLoad;
		[Bindable]
		[Inject("alarmSignDM")]
		public var alarmSignDM:AlarmSignDM;
		[MessageDispatcher]
		public var dispatchMsg:Function;

		public function queryAlarmList(param:Object):void
		{
			log.debug("pm---");
			var evt:AlarmSignEvent = new AlarmSignEvent(AlarmSignEvent.CMS_ALARMSEARCH_QUERY_ALARM_LIST);
			evt.param = param;
			dispatchMsg(evt);
		}

		//导出
		public function export(param:Object):void
		{
			log.debug("pm_导出....");
			var fileType:FileFilter = new FileFilter("Excel", "*.xls");
			var fileTypes:Array = new Array(fileType);
			fileUpDownLoad = new FileUpDownLoad();
			var downLoadUrl:URLRequest = new URLRequest("/cms/warn/groupcustomer/menu/menuremoveAction!getExcel.action");
			var downLoadData:URLVariables = new URLVariables();
			downLoadData.startTime = param.startTime;
			downLoadData.endTime = param.endTime;
			downLoadData.alarmTitle = param.alarmTitle;
			downLoadData.alarmLevel = param.alarmLevel;
			downLoadData.currentPage = param.currentPage;
			downLoadData.pageSize = param.pageSize;
			downLoadData.type = param.type;
			downLoadUrl.data = downLoadData;
			fileUpDownLoad.downLoadURLRequest = downLoadUrl;
			fileUpDownLoad.fileFilters = fileTypes;
			fileUpDownLoad.downLoad();
		}

		//清除标记
		public function alarmClear(param:Object):void
		{
			var evt:AlarmSignEvent = new AlarmSignEvent(AlarmSignEvent.CMS_ALARMSEARCH_ALARM_DELETE);
			evt.param = param;
			dispatchMsg(evt);
		}

		//标记
		public function alarmSign(param:Object):void
		{
			log.debug("标记....");
			var evt:AlarmSignEvent = new AlarmSignEvent(AlarmSignEvent.CMS_ALARMSEARCH_ALARM_SIGN);
			evt.param = param;
			log.debug(evt.param);
			dispatchMsg(evt);
		}
	}
}