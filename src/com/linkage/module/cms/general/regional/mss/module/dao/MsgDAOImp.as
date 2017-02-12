package com.linkage.module.cms.general.regional.mss.module.dao
{
	import com.linkage.module.cms.general.regional.mss.module.dao.data.MsgData;
	import com.linkage.module.cms.general.regional.mss.module.dao.data.MsgDataImp;

	public class MsgDAOImp implements MsgDAO
	{
		/**
		 *信息发布Data
		 */
		private var msgData:MsgData=null;

		public function MsgDAOImp(context:String)
		{
			msgData=new MsgDataImp(context);
		}

		public function getAllSegmentList(param:Object, success:Function):void
		{
			msgData.getAllSegmentList(param, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		public function getAllTemplateByType(param:Object, success:Function):void
		{
			msgData.getAllTemplateByType(param, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		public function getTemplateInfoByTempId(param:Object, success:Function):void
		{
			msgData.getTemplateInfoByTempId(param, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		public function saveOrUpdateTemplate(param:Object, success:Function, error:Function=null):void
		{
			msgData.saveOrUpdateTemplate(param, function():void
				{
					success.call(this);
				}, error);
		}

		public function saveOrUpdateSegment(param:Object, success:Function, error:Function=null):void
		{
			msgData.saveOrUpdateSegment(param, function(result:Object):void
				{
					success.call(this, result);
				}, error);
		}

		public function deleteTemplate(param:Object, success:Function, error:Function=null):void
		{
			msgData.deleteTemplate(param, function():void
				{
					success.call(this);
				}, error);
		}

		public function sendMediaMessage(param:Object, success:Function, error:Function=null):void
		{
			msgData.sendMediaMessage(param, function(result:Boolean):void
				{
					success.call(this, result);
				}, error);
		}

		public function sendShortMessage(param:Object, success:Function, error:Function=null):void
		{
			msgData.sendShortMessage(param, function(result:Boolean):void
				{
					success.call(this, result);
				}, error);
		}

		public function uploadePicture(param:Object, success:Function, error:Function=null):void
		{
			msgData.uploadePicture(param, function(result:Boolean):void
				{
					success.call(this, result);
				}, error);
		}

		public function deleteUploadPicture(param:Object, success:Function, error:Function=null):void
		{
			msgData.deleteUploadPicture(param, function():void
				{
					success.call(this);
				}, error);
		}

		public function insertnetPictureUrl(param:Object, success:Function, error:Function=null):void
		{
			msgData.insertnetPictureUrl(param, function():void
				{
					success.call(this);
				}, error);
		}
	}
}