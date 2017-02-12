package com.linkage.module.cms.topo.data.remoting
{
	import com.linkage.module.cms.topo.data.ICmsDataSource;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.rpc.remoting.BlazeDSUtil;
	
	import mx.collections.IList;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * CMS业务的BlazeDS数据源
	 * @author duangr
	 *
	 */
	public class CmsRemoteDataSource implements ICmsDataSource
	{
		// log
		private var log:ILogger = Log.getLogger("com.linkage.module.cms.topo.data.remoting.CmsDataSource");

		private static const DESTINATION:String = "flexdestination_cms_webtopo_topo_toposervice";
		private static const SOURCE:String = "com.linkage.module.cms.webtopo.topo.flexds.CmsTopoFlexDSImp";
		private static const endpoint_SUFFIX:String = "/messagebroker/amf";

		// 用户对象
		private var _user:Object = null;
		
		private var param:Object = new Object() ;
		// url上下文
		private var _urlContext:String = null;
		// EndPoint
		private var _endpoint:String = null;

		public function CmsRemoteDataSource(user:Object, urlContext:String)
		{
			this._user = user;
			this._urlContext = urlContext;
			this._endpoint = this._urlContext + endpoint_SUFFIX;
		}

		/**
		 * 执行无参数的回调
		 * @param callback
		 *
		 */
		private function noParamCallBack(callback:Function):void
		{
			if (callback != null)
			{
				callback.call();
			}
		}

		public function queryCitys(success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start queryCitys");
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
				{
					log.debug("queryCitys Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(result.toString()));
					noParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				}, true, "queryCitys");
			remoteService.queryCitys(_user);
		}

		public function queryAllCitys(success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start queryAllCitys");
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
				{
					log.debug("queryAllCitys Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(result.toString()));
					noParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				}, true, "queryAllCitys");
			remoteService.queryAllCitys(_user);
		}

		public function querySubCitys(cityId:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start querySubCitys cityId={0}", cityId);
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
				{
					log.debug("querySubCitys Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(result.toString()));
					noParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				}, true, "querySubCitys");
			remoteService.querySubCitys(_user, cityId);
		}

		public function queryServLevels(success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start queryServLevels");
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
				{
					log.debug("queryServLevels Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(result.toString()));
					noParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				}, true, "queryServLevels");
			remoteService.queryServLevels(_user);
		}

		public function querySpecs(success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start querySpecs");
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
				{
					log.debug("querySpecs Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(result.toString()));
					noParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				}, true, "querySpecs");
			remoteService.querySpecs(_user);
		}

		public function queryAllSpecs(success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start queryAllSpecs");
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
				{
					log.debug("queryAllSpecs Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(result.toString()));
					noParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				}, true, "queryAllSpecs");
			remoteService.queryAllSpecs(_user);
		}


		public function queryAllMoTypes(success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start queryAllMoTypes");
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
				{
					log.debug("queryAllMoTypes Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(result.toString()));
					noParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				}, true, "queryAllMoTypes");
			remoteService.queryAllMoTypes(_user);
		}

		public function queryMoTypesBySpec(specId:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start queryMoTypesBySpec  specId={0}", specId);
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
				{
					log.debug("queryMoTypesBySpec Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(result.toString()));
					noParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				}, true, "queryMoTypesBySpec");
			remoteService.queryMoTypesBySpec(_user, specId);
		}

		public function queryMoTypeAttrId(moTypeId:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start queryMoTypeAttrId  moTypeId={0}", moTypeId);
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
				{
					log.debug("queryMoTypeAttrId Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(result.toString()));
					noParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				}, true, "queryMoTypeAttrId");
			remoteService.queryMoTypeAttrId(_user, moTypeId);
		}

		public function queryMoAttrValue(moTypeId:String, attrId:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start queryMoAttrValue  moTypeId={0} attrId={1}", moTypeId, attrId);
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
				{
					log.debug("queryMoAttrValue Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(result.toString()));
					noParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				}, true, "queryMoAttrValue");
			remoteService.queryMoAttrValue(_user, moTypeId);
		}

		public function queryAreaMos(moName:String, cityId:String, specId:String, moType:String, attrs:Object, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start queryAreaMos  moName={0} cityId={1} specId={2} moType={3} attrs={4}", moName, cityId, specId, moType, attrs);
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
				{
					log.debug("queryAreaMos Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(result.toString()));
					noParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				}, true, "queryAreaMos");
			remoteService.queryAreaMos(_user, moName, cityId, specId, moType, attrs);
		}

		public function queryMos(moName:String, upperMoName:String, cityId:String, countyId:String, specId:String, moType:String, attrs:Object, success:Function, complete:Function = null, error:Function =
			null):void
		{
			log.debug("BlazeDS Start queryMos  moName={0} upperMoName={1} cityId={2} countyId={3} specId={4} moType={5} attrs={6}", moName, upperMoName, cityId, countyId, specId, moType, attrs);
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
				{
					log.debug("queryMos Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(result.toString()));
					noParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				}, true, "queryMos");
			remoteService.queryMos(_user, moName, upperMoName, cityId, countyId, specId, moType, attrs);
		}

		public function queryMoAttr(moId:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start queryMoAttr  moId={0}", moId);
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
				{
					log.debug("queryMoAttr Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(result.toString()));
					noParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				}, true, "queryMoAttr");
			remoteService.queryMoAttr(_user, moId);
		}

		public function queryLinkAttr(moId1:String, moId2:String, moTypeId1:String, moTypeId2:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start queryLinkAttr  moId1={0} moId2={1} moTypeId1={2} moTypeId2={3}", moId1, moId2, moTypeId1, moTypeId2);
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
				{
					log.debug("queryLinkAttr Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(result.toString()));
					noParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				}, true, "queryLinkAttr");
			remoteService.queryLinkAttr(_user, moId1, moId2, moTypeId1, moTypeId2);
		}

		public function queryCircuitAttr(cuid:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start queryCircuitAttr  cuid={0}", cuid);
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
				{
					log.debug("queryCircuitAttr Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(result.toString()));
					noParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				}, true, "queryCircuitAttr");
			remoteService.queryCircuitAttr(_user, cuid);

		}

		public function queryCircuits(moId1:String, moId2:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start queryCircuits  moId1={0} moId2={1}", moId1, moId2);
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
				{
					log.debug("queryCircuits Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(result.toString()));
					noParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				}, true, "queryCircuits");
			remoteService.queryCircuits(_user, moId1, moId2);
		}

		public function queryCircuitsByIdOrCode(circId:String, circCode:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start queryCircuitsByIdOrCode  circId={0} circCode={1}", circId, circCode);
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
				{
					log.debug("queryCircuitsByIdOrCode Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(result.toString()));
					noParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				}, true, "queryCircuitsByIdOrCode");
			remoteService.queryCircuitsByIdOrCode(_user, circId, circCode);
		}

		public function queryOpticRoutes(cuId:String, cuName:String, moA:String, moZ:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start queryOpticRoutes  cuId={0} cuName={1} moA={2} moZ={3}", cuId, cuName, moA, moZ);
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
				{
					log.debug("queryOpticRoutes Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(result.toString()));
					noParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				}, true, "queryOpticRoutes");
			remoteService.queryOpticRoutes(_user, cuId, cuName, moA, moZ);
		}

		public function queryWorkStatus(moIds:IList, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start queryWorkStatus  moIds.length={0}", moIds.length);
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
				{
					log.debug("queryWorkStatus Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(result.toString()));
					noParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				}, true, "queryWorkStatus");
			remoteService.queryWorkStatus(_user, moIds);
		}

		public function queryMoTranRelations(moId1:String, moId2:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start queryMoTranRelations  moId1={0} moId2={1}", moId1, moId2);
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
				{
					log.debug("queryMoTranRelations Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(result.toString()));
					noParamCallBack(complete);
				}, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				}, true, "queryMoTranRelations");
			remoteService.queryMoTranRelations(_user, moId1, moId2);
		}
		
		public function queryCustCommType(success:Function, error:Function = null):void
		{
			log.debug("BlazeDS Start queryCustCommType");
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
			{
				log.debug("queryCustCommType Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
				success.call(null, new XML(result.toString()));
			}, function(event:FaultEvent):void
			{
				noParamCallBack(error);
			}, true, "queryCustCommType");
			remoteService.queryCustCommType();
		}
		
		
		public function queryResouceInfo(param:Object,success:Function,complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start queryResouceInfo");
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
			{
				log.debug("queryResouceInfo Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				noParamCallBack(error);
			}, true, "queryResouceInfo");
			remoteService.queryResouceInfo(param);
		}
		
		public function queryTopoLinkObjects(param:Object,success:Function,complete:Function = null, error:Function = null):void
		{
			log.debug("BlazeDS Start queryTopoLinkObjects");
			var startTime:Number = new Date().getTime();
			var remoteService:RemoteObject = BlazeDSUtil.newService(DESTINATION, SOURCE, _endpoint, function(result:Object):void
			{
				log.debug("queryTopoLinkObjects Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
				log.info(result);
				success.call(null, result);
			}, function(event:FaultEvent):void
			{
				noParamCallBack(error);
			}, true, "queryTopoLinkObjects");
			remoteService.queryTopoLinkObjects(param);
		}
		
		
	}
}