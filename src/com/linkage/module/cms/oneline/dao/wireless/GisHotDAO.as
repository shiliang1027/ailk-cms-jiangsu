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
	 * @date 2012-12-10
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class GisHotDAO implements IGisHotDAO
	{
		private var log:ILogger=Log.getLoggerByClass(GisHotDAO);

		public var rmtObj:RemoteObject;

		private var _destination:String;
		private var _endpoint:String;

		[Init]
		public function init():void
		{
			if (rmtObj == null)
			{
				rmtObj=new RemoteObject(_destination);
				rmtObj.endpoint=_endpoint;
				//				rmtObj.requestTimeout=20;
				rmtObj.showBusyCursor=true;
				log.info("GisHotDAO.init" + _destination + "" + _endpoint);
				log.info(rmtObj);
			}
		}

		public function getCitys(param:Object):AsyncToken
		{
			return rmtObj.getCitys(param);
		}
		
		public function getHotSpotCell(param:Object):AsyncToken
		{
			return rmtObj.getHotSpotCell(param);
		}
		
		public function getHistoryHotSpot(param:Object):AsyncToken
		{
			return rmtObj.getHistoryHotSpot(param);
		}
		
		public function queryMapContainsMo(param:Object):AsyncToken
		{
			return rmtObj.queryMapContainsMo(param);
		}
		
		public function getHisInfo(param:Object):AsyncToken
		{
			return rmtObj.getHisInfo(param);
		}
		
		public function getGisInfo(param:Object):AsyncToken
		{
			return rmtObj.getGisInfo(param);
		}
		public function getHotHistoryGisInfo(param:Object):AsyncToken
		{
			return rmtObj.getHotHistoryGisInfo(param);
		}
		public function getKpiInfo(param:Object):AsyncToken
		{
			return rmtObj.getKpiInfo(param);
		}
		
		public function getRadius(param:Object):AsyncToken
		{
			return rmtObj.getRadius();
		}
		
		public function updateRadius(param:Object):AsyncToken
		{
			return rmtObj.updateRadius(param);
		}
		
		public function saveRemark(param:Object):AsyncToken{
			return rmtObj.saveRemark(param);
		}
		
		public function getHisKpiInfo(param:Object):AsyncToken{
			return rmtObj.getHisKpiInfo(param);
		}
		
		public function getKpiByMoId(param:Object):AsyncToken{
			return rmtObj.getKpiByMoId();
		}
		
		public function getKpiByMoTypeId(param:Object):AsyncToken{
			return rmtObj.getKpiByMoTypeId(param);
		}
		public function getLastWeekAnd24hKpiinfo(param:Object):AsyncToken{
			return rmtObj.getLastWeekAnd24hKpiinfo(param);
		}
		
		public function saveScene(param:Object):AsyncToken{
			return rmtObj.saveScene(param);
		}
		public function getSpecialPhoneInfo(param:Object):AsyncToken{
			return rmtObj.getSpecialPhoneInfo(param);
		}
		public function getNormalCellGisInfo(param:Object):AsyncToken{
			return rmtObj.getNormalCellGisInfo(param);
		}
		public function get destination():String
		{
			return _destination;
		}

		public function set destination(value:String):void
		{
			_destination=value;
		}

		public function get endpoint():String
		{
			return _endpoint;
		}

		public function set endpoint(value:String):void
		{
			_endpoint=value;
		}
	}
}