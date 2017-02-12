package com.linkage.module.cms.alarm.eventwindow.dao
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	public class EventWindowDAOImpl implements EventWindowDAO
	{
		public function EventWindowDAOImpl()
		{
		}
		
		private var log:ILogger=Log.getLoggerByClass(EventWindowDAOImpl);
		
		[Inject("remoteObject")]
		public var rmtObj:RemoteObject;
		[Inject("remoteObjectIVR")]
		public var ivrObj:RemoteObject;
		[Inject("remoteObjetUpdate")]
		public var remUpdate:RemoteObject;
		
		/**
		 * 查询事件数据
		 * 
		 * @param param
		 * @return AsyncToken
		 * 
		 */
		public function queryEventData(param:Object):AsyncToken{
			return remUpdate.queryIvrevens(param);
		}
//		public function queryIvrevens(param:Object):AsyncToken{
//			return remUpdate.queryIvrevens(param);
//		}
		/**
		 * ivr呼叫
		 * 
		 * @param param
		 * @return AsyncToken
		 * 
		 */
		public function callIVR(param:Object):AsyncToken{
			return ivrObj.callIVR(param);
		}
		/**
		 * 删除事件
		 * 
		 * @param param
		 * @return AsyncToken
		 * 
		 */
		public function deleteEvent(param:Object):AsyncToken{
			return ivrObj.updateIvrevensStatus(param);
		}
		/**
		 * 查询事件备注
		 * 
		 * @param param
		 * @return AsyncToken
		 * 
		 */
		public function selectRemarkById(param:Object):AsyncToken{
			return remUpdate.selectRemarkById(param);
		}
		/**
		 * 更新事件备注
		 * 
		 * @param param
		 * @return AsyncToken
		 * 
		 */
		public function updateRemarkById(param:Object):AsyncToken{
			return remUpdate.updateRemarkById(param);
		}
		/**
		 * 查询条件结果集
		 * 
		 * @param param
		 * @return AsyncToken
		 * 
		 */
		public function selectFilterDatas():AsyncToken{
			return remUpdate.qureyCond();
		}
	}
}