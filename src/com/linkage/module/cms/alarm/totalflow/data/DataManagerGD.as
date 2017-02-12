package com.linkage.module.cms.alarm.totalflow.data
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;

	/**
	 * 获取数据的实现类
	 * @author mengqiang
	 *
	 */
	public class DataManagerGD extends DataManager
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.alarm.totalflowalarm.data.DataManagerGD");
		/**
		 * 发送数据的web目的地
		 */
		private var _remoteDestination:String="flexdestination_ims_alarm_totalflowAlarmView_service";
		/**
		 * 发送数据的source
		 */
		private var _remoteSource:String="com.linkage.module.cms.alarm.totalflowalarm.serv.TotalFlowAlarmViewGDServImp";

		public function DataManagerGD(mapInfo:Object)
		{
			super(mapInfo);
		}

		override public function get remoteDestination():String
		{
			return _remoteDestination;
		}

		override public function get remoteSource():String
		{
			return _remoteSource;
		}
	}
}