package com.linkage.module.cms.general.regional.mss.module.dao.data
{
	import com.linkage.system.rpc.remoting.BlazeDSUtil;

	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;

	/**
	 *信息发布Data实现类
	 * @author mengqiang
	 *
	 */
	public class MsgDataImp implements MsgData
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.general.regional.mss.module.dao.data.MsgDataImp");
		/**
		 * 发送数据的source
		 */
		private var remoteSource:String="com.linkage.module.cms.general.regional.view.mss.serv.MssServiceImpl";
		/**
		 * 发送数据的web目的地
		 */
		private var remoteDestination:String="flexdestination_cms_regional_mssService";
		/**
		 *suffix
		 */
		public static const endpoint_SUFFIX:String="/messagebroker/amf";
		/**
		 *endpoint
		 */
		protected var endpoint:String=null;

		public function MsgDataImp(context:String)
		{
			context=context.replace(/\//g, "");
			endpoint="/" + context + endpoint_SUFFIX;
		}

		public function getAllSegmentList(param:Object, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【信息发布】加载配置指标列表数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【信息发布】加载配置指标列表数据失败" + event);
				});
			log.info("【信息发布】加载配置指标列表数据开始");
			remoteService.getAllSegmentList(param);
		}

		public function getAllTemplateByType(param:Object, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【信息发布】加载所有已经配置的模板数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【信息发布】加载所有已经配置的模板数据失败" + event);
				});
			log.info("【信息发布】加载所有已经配置的模板数据开始");
			remoteService.getAllTemplateByType(param);
		}

		public function getTemplateInfoByTempId(param:Object, success:Function):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【信息发布】加载某个模板已经配置的所有信息数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【信息发布】加载某个模板已经配置的所有信息数据失败" + event);
				});
			log.info("【信息发布】加载某个模板已经配置的所有信息数据开始");
			remoteService.getTemplateInfoByTempId(param);
		}

		public function saveOrUpdateTemplate(param:Object, success:Function, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function():void
				{
					log.info("【信息发布】更新模板信息数据成功");
					success.call(this);
				}, function(event:FaultEvent):void
				{
					log.info("【信息发布】更新模板信息数据失败" + event);
					if (error != null)
					{
						error.call(this, event);
					}
				});
			log.info("【信息发布】更新模板信息数据开始");
			remoteService.saveOrUpdateTemplate(param);
		}

		public function saveOrUpdateSegment(param:Object, success:Function, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Object):void
				{
					log.info("【信息发布】保存模板指标数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【信息发布】保存模板指标数据失败" + event);
					if (error != null)
					{
						error.call(this, event);
					}
				});
			log.info("【信息发布】保存模板指标数据开始");
			remoteService.saveOrUpdateSegment(param);
		}

		public function deleteTemplate(param:Object, success:Function, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function():void
				{
					log.info("【信息发布】删除某个模板和对应配置的指标信息数据成功");
					success.call(this);
				}, function(event:FaultEvent):void
				{
					log.info("【信息发布】删除某个模板和对应配置的指标信息数据失败" + event);
					if (error != null)
					{
						error.call(this, event);
					}
				});
			log.info("【信息发布】删除某个模板和对应配置的指标信息数据开始");
			remoteService.deleteTemplate(param);
		}

		public function sendMediaMessage(param:Object, success:Function, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Boolean):void
				{
					log.info("【信息发布】发送彩信接口数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【信息发布】发送彩信接口数据失败" + event);
					if (error != null)
					{
						error.call(this, event);
					}
				});
			log.info("【信息发布】发送彩信接口数据开始");
			remoteService.sendMediaMessage(param);
		}

		public function sendShortMessage(param:Object, success:Function, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Boolean):void
				{
					log.info("【信息发布】发送短信接口数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【信息发布】发送短信接口数据失败" + event);
					if (error != null)
					{
						error.call(this, event);
					}
				});
			log.info("【信息发布】发送短信接口数据开始");
			remoteService.sendShortMessage(param);
		}

		public function uploadePicture(param:Object, success:Function, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function(result:Boolean):void
				{
					log.info("【信息发布】上传图片数据成功");
					success.call(this, result);
				}, function(event:FaultEvent):void
				{
					log.info("【信息发布】上传图片数据失败" + event);
					if (error != null)
					{
						error.call(this, event);
					}
				});
			log.info("【信息发布】上传图片数据开始");
			remoteService.uploadePicture(param);
		}

		public function deleteUploadPicture(param:Object, success:Function, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function():void
				{
					log.info("【信息发布】删除图片数据成功");
					success.call(this);
				}, function(event:FaultEvent):void
				{
					log.info("【信息发布】删除图片数据失败" + event);
					if (error != null)
					{
						error.call(this, event);
					}
				});
			log.info("【信息发布】删除图片数据开始");
			remoteService.deleteUploadPicture(param);
		}

		public function insertnetPictureUrl(param:Object, success:Function, error:Function=null):void
		{
			var remoteService:RemoteObject=BlazeDSUtil.newService(remoteDestination, remoteSource, endpoint, function():void
				{
					log.info("【信息发布】插入网络图片数据成功");
					success.call(this);
				}, function(event:FaultEvent):void
				{
					log.info("【信息发布】插入网络图片数据失败" + event);
					if (error != null)
					{
						error.call(this, event);
					}
				});
			log.info("【信息发布】插入网络图片数据开始");
			remoteService.insertnetPictureUrl(param);
		}
	}
}