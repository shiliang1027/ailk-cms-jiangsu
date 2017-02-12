package com.linkage.module.cms.topo.data.http
{
	import com.linkage.module.cms.topo.data.ICmsDataSource;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	import com.linkage.system.rpc.http.HttpUtil;
	
	import flash.net.URLVariables;
	
	import mx.collections.ArrayList;
	import mx.collections.IList;
	import mx.rpc.events.FaultEvent;

	/**
	 * CMS 业务的HTTP数据源
	 * @author duangr
	 *
	 */
	public class CmsHttpDataSource implements ICmsDataSource
	{
		// log
		private var log:ILogger = Log.getLogger("com.linkage.module.cms.topo.data.http.CmsHttpDataSource");
		// 远程请求Action的前缀
		private static const ACTION_PREFIX:String = "/cms/webtopo/topo/cmsTopo!";
		// session Id
		private var _sessionId:String = null;
		// URL 上下文 (工程名)
		private var _urlContext:String = null;

		public function CmsHttpDataSource(sessionId:String, urlContext:String)
		{
			this._sessionId = sessionId;
			this._urlContext = urlContext;
		}

		/**
		 * 截取xml文件,将 最后一个 ">" 后面的内容去掉
		 * @param input
		 * @return
		 *
		 */
		private function subXmlStr(input:String):String
		{
			var index:int = input.lastIndexOf(">");
			if (index != -1)
			{
				return input.substring(0, index + 1);
			}
			else
			{
				return input;
			}
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
			log.debug("HTTP Start queryCitys ");
			var url:String = _urlContext + ACTION_PREFIX + "queryCitys.action";
			var params:URLVariables = new URLVariables();

			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
				{
					log.debug("queryCitys Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(subXmlStr(result as String)));
					noParamCallBack(complete);
				}, params, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				});
		}

		public function queryAllCitys(success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("HTTP Start queryAllCitys ");
			var url:String = _urlContext + ACTION_PREFIX + "queryAllCitys.action";
			var params:URLVariables = new URLVariables();

			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
				{
					log.debug("queryAllCitys Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(subXmlStr(result as String)));
					noParamCallBack(complete);
				}, params, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				});
		}

		public function querySubCitys(cityId:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("HTTP Start querySubCitys ");
			var url:String = _urlContext + ACTION_PREFIX + "querySubCitys.action";
			var params:URLVariables = new URLVariables();
			params.cityId = cityId;

			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
				{
					log.debug("querySubCitys Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(subXmlStr(result as String)));
					noParamCallBack(complete);
				}, params, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				});
		}

		public function queryServLevels(success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("HTTP Start queryServLevels ");
			var url:String = _urlContext + ACTION_PREFIX + "queryServLevels.action";
			var params:URLVariables = new URLVariables();

			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
				{
					log.debug("queryServLevels Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(subXmlStr(result as String)));
					noParamCallBack(complete);
				}, params, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				});
		}

		public function querySpecs(success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("HTTP Start querySpecs ");
			var url:String = _urlContext + ACTION_PREFIX + "querySpecs.action";
			var params:URLVariables = new URLVariables();

			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
				{
					log.debug("querySpecs Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(subXmlStr(result as String)));
					noParamCallBack(complete);
				}, params, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				});
		}

		public function queryAllSpecs(success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("HTTP Start queryAllSpecs ");
			var url:String = _urlContext + ACTION_PREFIX + "queryAllSpecs.action";
			var params:URLVariables = new URLVariables();

			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
				{
					log.debug("queryAllSpecs Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(subXmlStr(result as String)));
					noParamCallBack(complete);
				}, params, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				});
		}

		public function queryAllMoTypes(success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("HTTP Start queryAllMoTypes ");
			var url:String = _urlContext + ACTION_PREFIX + "queryAllMoTypes.action";
			var params:URLVariables = new URLVariables();

			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
				{
					log.debug("queryAllMoTypes Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(subXmlStr(result as String)));
					noParamCallBack(complete);
				}, params, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				});
		}

		public function queryMoTypesBySpec(specId:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("HTTP Start queryMoTypesBySpec specId={0}", specId);
			var url:String = _urlContext + ACTION_PREFIX + "queryMoTypesBySpec.action";
			var params:URLVariables = new URLVariables();
			params.specId = specId;

			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
				{
					log.debug("queryMoTypesBySpec Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(subXmlStr(result as String)));
					noParamCallBack(complete);
				}, params, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				});
		}

		public function queryMoTypeAttrId(moTypeId:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("HTTP Start queryMoTypeAttrId moTypeId={0}", moTypeId);
			var url:String = _urlContext + ACTION_PREFIX + "queryMoTypeAttrId.action";
			var params:URLVariables = new URLVariables();
			params.moTypeId = moTypeId;

			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
				{
					log.debug("queryMoTypeAttrId Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(subXmlStr(result as String)));
					noParamCallBack(complete);
				}, params, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				});
		}

		public function queryMoAttrValue(moTypeId:String, attrId:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("HTTP Start queryMoAttrValue moTypeId={0}, attrId={1}", moTypeId, attrId);
			var url:String = _urlContext + ACTION_PREFIX + "queryMoAttrValue.action";
			var params:URLVariables = new URLVariables();
			params.moTypeId = moTypeId;
			params.attrId = attrId;

			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
				{
					log.debug("queryMoAttrValue Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(subXmlStr(result as String)));
					noParamCallBack(complete);
				}, params, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				});
		}

		public function queryAreaMos(moName:String, cityId:String, specId:String, moTypeId:String, attrs:Object, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("HTTP Start queryAreaMos moName={0}, cityId={1}, specId={2}, moTypeId={3}, attrs={4}", moName, cityId, specId, moTypeId, attrs);
			var url:String = _urlContext + ACTION_PREFIX + "queryAreaMos.action";
			var params:URLVariables = new URLVariables();
			params.moName = moName;
			params.cityId = cityId;
			params.specId = specId;
			params.moTypeId = moTypeId;
			params.data = attrsToData(attrs);

			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
				{
					log.debug("queryAreaMos Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(subXmlStr(result as String)));
					noParamCallBack(complete);
				}, params, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				});
		}

		public function queryMos(moName:String, upperMoName:String, cityId:String, countyId:String, specId:String, moTypeId:String, attrs:Object, success:Function, complete:Function = null, error:Function =
			null):void
		{
			log.debug("HTTP Start queryMos moName={0}, upperMoName={1}, cityId={2}, countyId={3}, specId={4}, moTypeId={5}, attrs={6}", moName, upperMoName, cityId, countyId, specId, moTypeId, attrs);
			var url:String = _urlContext + ACTION_PREFIX + "queryMos.action";
			var params:URLVariables = new URLVariables();
			params.moName = moName;
			params.upperMoName = upperMoName;
			params.cityId = cityId;
			params.countyId = countyId;
			params.specId = specId;
			params.moTypeId = moTypeId;
			params.data = attrsToData(attrs);

			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
				{
					log.debug("queryMos Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(subXmlStr(result as String)));
					noParamCallBack(complete);
				}, params, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				});
		}

		/**
		 * 将 Map<属性key,属性值List> 转换为字符串<br>
		 * key,value1,value2#key,value1,value2,value3
		 * @param attrs
		 * @return
		 *
		 */
		private function attrsToData(attrs:Object):String
		{
			var data:Array = [];
			for (var key:String in attrs)
			{
				var value:ArrayList = attrs[key];
				if (value != null && value.source.length > 0)
				{
					data.push(key + "," + value.source.join(","));
				}
				else
				{
					data.push(key);
				}
			}
			return data.join("#");

		}

		public function queryMoAttr(moId:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("HTTP Start queryMoAttr moId={0}", moId);
			var url:String = _urlContext + ACTION_PREFIX + "queryMoAttr.action";
			var params:URLVariables = new URLVariables();
			params.moId1 = moId;

			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
				{
					log.debug("queryMoAttr Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(subXmlStr(result as String)));
					noParamCallBack(complete);
				}, params, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				});

		}

		public function queryLinkAttr(moId1:String, moId2:String, moTypeId1:String, moTypeId2:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("HTTP Start queryLinkAttr moId1={0} moId2={1} moTypeId1={2} moTypeId2={3}", moId1, moId2, moTypeId1, moTypeId2);
			var url:String = _urlContext + ACTION_PREFIX + "queryLinkAttr.action";
			var params:URLVariables = new URLVariables();
			params.moId1 = moId1;
			params.moId2 = moId2;
			params.moA = moTypeId1;
			params.moZ = moTypeId2;

			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
				{
					log.debug("queryLinkAttr Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(subXmlStr(result as String)));
					noParamCallBack(complete);
				}, params, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				});
		}

		public function queryCircuitAttr(circId:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("HTTP Start queryCircuitAttr circId={0}", circId);
			var url:String = _urlContext + ACTION_PREFIX + "queryCircuitAttr.action";
			var params:URLVariables = new URLVariables();
			params.circId = circId;

			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
				{
					log.debug("queryCircuitAttr Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(subXmlStr(result as String)));
					noParamCallBack(complete);
				}, params, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				});

		}

		public function queryCircuits(moId1:String, moId2:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("HTTP Start queryCircuits moId1={0} moId2={1}", moId1, moId2);
			var url:String = _urlContext + ACTION_PREFIX + "queryCircuits.action";
			var params:URLVariables = new URLVariables();
			params.moId1 = moId1;
			params.moId2 = moId2;

			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
				{
					log.debug("queryCircuits Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(subXmlStr(result as String)));
					noParamCallBack(complete);
				}, params, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				});
		}

		public function queryCircuitsByIdOrCode(circId:String, circCode:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("HTTP Start queryCircuitsByIdOrCode circId={0} circCode={1}", circId, circCode);
			var url:String = _urlContext + ACTION_PREFIX + "queryCircuitsByIdOrCode.action";
			var params:URLVariables = new URLVariables();
			params.circId = circId;
			params.circCode = circCode;

			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
				{
					log.debug("queryCircuitsByIdOrCode Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(subXmlStr(result as String)));
					noParamCallBack(complete);
				}, params, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				});
		}

		public function queryOpticRoutes(circId:String, circCode:String, moA:String, moZ:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("HTTP Start queryOptics circId={0} circCode={1} moA={2} moZ={3}", circId, circCode, moA, moZ);
			var url:String = _urlContext + ACTION_PREFIX + "queryOptics.action";
			var params:URLVariables = new URLVariables();
			params.circId = circId;
			params.circCode = circCode;
			params.moA = moA;
			params.moZ = moZ;

			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
				{
					log.debug("queryOptics Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(subXmlStr(result as String)));
					noParamCallBack(complete);
				}, params, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				});
		}

		public function queryWorkStatus(moIds:IList, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("HTTP Start queryWorkStatus moIds.length={0}", moIds.length);
			var url:String = _urlContext + ACTION_PREFIX + "queryWorkStatus.action";
			var params:URLVariables = new URLVariables();
			params.data = moIds.toArray().join(",");

			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
				{
					log.debug("queryWorkStatus Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(subXmlStr(result as String)));
					noParamCallBack(complete);
				}, params, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				});
		}

		public function queryMoTranRelations(moId1:String, moId2:String, success:Function, complete:Function = null, error:Function = null):void
		{
			log.debug("HTTP Start queryMoTranRelations   moId1={0} moId2={1}", moId1, moId2);
			var url:String = _urlContext + ACTION_PREFIX + "queryMoTranRelations.action";
			var params:URLVariables = new URLVariables();
			params.moId1 = moId1;
			params.moId2 = moId2;

			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
				{
					log.debug("queryMoTranRelations Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
					success.call(null, new XML(subXmlStr(result as String)));
					noParamCallBack(complete);
				}, params, function(event:FaultEvent):void
				{
					noParamCallBack(error);
					noParamCallBack(complete);
				});
		}

		public function queryCustCommType(success:Function, error:Function = null):void
		{
			log.debug("HTTP Start queryCustCommType");
			var url:String = _urlContext + ACTION_PREFIX + "queryCustCommType.action";
			
			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
			{
				log.debug("queryCustCommType Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
				success.call(null, new XML(subXmlStr(result as String)));
			}, null, function(event:FaultEvent):void
			{
				noParamCallBack(error);
			});
		}
		
		public function queryResouceInfo(param:Object,success:Function,complete:Function = null,error:Function = null):void
		{
			log.debug("HTTP Start queryResouceInfo");
			var params:URLVariables = new URLVariables();
			params.circId = param.cityId;
			params.subCityId = param.subCityId;
			params.servLevel = param.servLevel;
			params.custId = param.custId;
//			log.info("集客--queryResouceInfo----cityId="+cityId+"---subCityId="+subCityId+"----servLevel="+servLevel+"---custId="+custId);
			var url:String = _urlContext + ACTION_PREFIX + "queryResouceInfo.action";
			
			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
			{
				log.debug("queryResouceInfo Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
				success.call(null, new XML(subXmlStr(result as String)));
				noParamCallBack(complete);
			},  params, function(event:FaultEvent):void
			{
				noParamCallBack(error);
				noParamCallBack(complete);
			});
			
		}
		
		public function queryTopoLinkObjects(param:Object,success:Function,complete:Function = null, error:Function = null):void
		{
			log.debug("HTTP Start queryTopoLinkObjects");
			var params:URLVariables = new URLVariables();
			params.layerid = param.layerid;
			var url:String = _urlContext + ACTION_PREFIX + "queryTopoLinkObjects.action";
			
			var startTime:Number = new Date().getTime();
			HttpUtil.httpService(_sessionId, url, function(result:Object):void
			{
				log.debug("queryResouceInfo Success. SpendTime:{0}s", (new Date().getTime() - startTime) / 1000.00);
				success.call(null, result);
				noParamCallBack(complete);
			},  params, function(event:FaultEvent):void
			{
				noParamCallBack(error);
				noParamCallBack(complete);
			});
		}
	}
}