package com.linkage.module.cms.oneline.dao.wireless
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * 
	 *
	 * @author shiliang (66614)
	 * @version 1.0
	 * @date 2012-11-22
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class WirelessDAO implements IWirelessDAO
	{
		private var log:ILogger = Log.getLoggerByClass(WirelessDAO);
		
		public var rmtObj:RemoteObject;
		
		private var _destination:String;
		private var _endpoint:String;
		
		[Init]
		public function init():void
		{
			if(rmtObj == null)
			{
				rmtObj = new RemoteObject(_destination);
				rmtObj.endpoint = _endpoint;
//				rmtObj.requestTimeout=20;
				rmtObj.showBusyCursor=true;
				log.info("WirelessDAO.init" + _destination + "" + _endpoint);
				log.info(rmtObj);
			}
		}
		
		/**
		 * 获取KPI列表 
		 * @param param
		 * @return
		 *
		 */		
		public function getKpiSet(param:Object):AsyncToken{
			return rmtObj.getKpiSet(param);
		}
		/**
		 * 获取指标汇总趋势数据 
		 * @param param
		 * @return
		 *
		 */		
		public function getHourPerfData(param:Object):AsyncToken{
			return rmtObj.getHourPerfData(param);
		}
		
		/**
		 * 获取劣化指标数据 
		 * @param param
		 * @return 
		 * 
		 */		
		public function getBadMatrix(param:Object):AsyncToken{
			return rmtObj.getBadMatrix(param);
		}
		
		/**
		 * 获取指标表格数据 
		 * @param param
		 * @return 
		 * 
		 */		
		public function getPerfData(param:Object):AsyncToken{
			return rmtObj.getPerfData(param);
		}
		
		public function get destination():String
		{
			return _destination;
		}
		
		public function set destination(value:String):void
		{
			_destination = value;
		}
		
		public function get endpoint():String
		{
			return _endpoint;
		}
		
		public function set endpoint(value:String):void
		{
			_endpoint = value;
		}

	}
}