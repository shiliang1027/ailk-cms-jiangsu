package com.linkage.module.cms.groupmonitor.custscene.dao
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.groupmonitor.custscene.domain.common.IUser;

	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	/**
	 *
	 *
	 * @author 华伟 (69088)
	 * @version 1.0
	 * @date 2012-10-11
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */
	public class CustSceneDao implements ICustSceneDao
	{
		private var log:ILogger=Log.getLoggerByClass(CustSceneDao);
		private var _destination:String;
		private var _endpoint:String;

		private var rmtObj:RemoteObject;

		[Inject]
		public var user:IUser;

		[Init]
		public function init():void
		{
			rmtObj=new RemoteObject(_destination);
			rmtObj.endpoint=_endpoint;
		}

		public function loadBaseTree(p:Object):AsyncToken
		{
			return rmtObj.loadBaseTree(p);
		}

		public function loadPageTree(param:Object):AsyncToken
		{
			return rmtObj.loadPageTree(param);
		}

		public function loadBigCustData(param:Object):AsyncToken
		{
			return rmtObj.loadBigCustData(param);
		}

		public function loadUserCust(param:Object):AsyncToken
		{
			return rmtObj.loadUserCust(param);
		}

		public function loadDispaterData(param:Object):AsyncToken
		{
			return rmtObj.loadDispaterData(param);
		}

		public function loadDispaterDataById(param:Object):AsyncToken
		{
			return rmtObj.loadDispaterDataById(param);
		}

		public function queryFaultOrdersByCity(param:Object):AsyncToken
		{
			return rmtObj.queryFaultOrdersByCity(param);
		}

		public function queryComplaintsOrdersByCity(param:Object):AsyncToken
		{
			return rmtObj.queryComplaintsOrdersByCity(param);
		}

		public function loadServerTypeByCustId(param:Object):AsyncToken
		{
			return rmtObj.loadServerTypeByCustId(param);
		}

		public function loadKpiGroupBySver(param:Object):AsyncToken
		{
			return rmtObj.loadKpiGroupBySver(param);
		}

		public function loadPerfChartData(param:Object):AsyncToken
		{
			return rmtObj.loadPerfChartData(param);
		}

		public function getServByCust(param:Object):AsyncToken
		{
			return rmtObj.getServByCust(param);
		}

		public function loadKpiByCustId(param:Object):AsyncToken
		{
			return rmtObj.loadKpiByCustId(param);
		}

		public function getServertarget(param:Object):AsyncToken
		{
			return rmtObj.getServertarget(param);
		}

		public function getRealPm(param:Object):AsyncToken
		{
			return rmtObj.getRealPm(param);
		}

		public function getAreaUserCustData(param:Object):AsyncToken
		{
			return rmtObj.getAreaUserCustData(param);
		}

		public function queryAlarmByIds(param:Object):AsyncToken
		{
			return rmtObj.queryAlarmByIds(param);
		}

		public function queryTotalInfo():AsyncToken
		{
			return rmtObj.queryTotalInfo();
		}

		public function queryTotalInfoByCustNo(param:Object):AsyncToken
		{
			return rmtObj.queryTotalInfoByCustNo(param);
		}

		public function loadUserKpiByGruoupCust(param:Object):AsyncToken
		{
			return rmtObj.loadUserKpiByGruoupCust(param);
		}

		public function getSelects():AsyncToken
		{
			return rmtObj.getSelects();
		}

		public function queryGroupUsers(param:Object):AsyncToken
		{
			return rmtObj.queryGroupUsers(param);
		}

		public function saveUserInfo(param:Object):AsyncToken
		{
			return rmtObj.saveUserInfo(param);
		}

		public function getOverCitySpec(param:Object):AsyncToken
		{
			return rmtObj.getOverCitySpec(param);
		}

		public function updateUserName(param:Object):AsyncToken
		{
			return rmtObj.updateUserName(param);
		}

		public function saveXYValues(param:Object):AsyncToken
		{
			return rmtObj.saveXYValues(param);
		}

		public function getOverAreaSpec(param:Object):AsyncToken
		{
			return rmtObj.getOverAreaSpec(param);
		}

		public function queryGroupCustByName(param:Object):AsyncToken
		{
			return rmtObj.queryGroupCustByName(param);
		}

		public function saveColor(param:Object):AsyncToken
		{
			return rmtObj.saveColor(param);
		}

		public function getUsersInSQLByCustId(param:Object):AsyncToken
		{
			return rmtObj.getUsersInSQLByCustId(param);
		}

		public function queryTotalInfoByCityId(param:Object):AsyncToken
		{
			return rmtObj.queryTotalInfoByCityId(param);
		}

		public function LoadExportData(param:Object):AsyncToken
		{
			return rmtObj.LoadExportData(param);
		}



		public function set destination(value:String):void
		{
			_destination=value;
		}

		public function set endpoint(value:String):void
		{
			_endpoint=value;
		}
	}
}