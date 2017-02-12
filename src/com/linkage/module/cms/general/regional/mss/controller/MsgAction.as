package com.linkage.module.cms.general.regional.mss.controller
{
	import com.linkage.module.cms.general.regional.mss.MssLocalTest;
	import com.linkage.module.cms.general.regional.mss.controller.fo.MsgFO;
	import com.linkage.module.cms.general.regional.mss.module.dao.MsgDAO;
	import com.linkage.module.cms.general.regional.mss.module.dao.MsgDAOImp;

	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;

	/**
	 *信息发布Action
	 * @author mengqiang
	 *
	 */
	public class MsgAction extends EventDispatcher implements IEventDispatcher
	{
		/**
		 *信息发布FO
		 */
		private var _msgFO:MsgFO=null;
		/**
		 *信息发布DAO
		 */
		private var _msgDAO:MsgDAO=null;

		public function MsgAction(params:Object)
		{
			//1.初始化FO
			_msgFO=new MsgFO(params);

			//2.初始化DAO
			_msgDAO=new MsgDAOImp(msgFO.context);
		}

		//获取配置指标列表
		public function getAllSegmentList(param:Object, success:Function):void
		{
			//本地调试
			if (msgFO.local)
			{
				var result:ArrayList=MssLocalTest.getAllSegmentList();
				success.call(this, result);
				return;
			}
			//服务器运行
			_msgDAO.getAllSegmentList(param, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		//按类型获取所有已经配置的模板
		public function getAllTemplateByType(paramMap:Object, success:Function):void
		{
			//本地调试
			if (msgFO.local)
			{
				var result:ArrayCollection=MssLocalTest.getAllTemplateByType();
				success.call(this, result);
				return;
			}
			//服务器运行
			_msgDAO.getAllTemplateByType(paramMap, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		//获取某个模板已经配置的所有信息列表
		public function getTemplateInfoByTempId(paramMap:Object, success:Function):void
		{
			//本地调试
			if (msgFO.local)
			{
				var result:Object=MssLocalTest.getTemplateInfoByTempId();
				success.call(this, result);
				return;
			}
			//服务器运行
			_msgDAO.getTemplateInfoByTempId(paramMap, function(result:Object):void
				{
					success.call(this, result);
				});
		}

		//保存更新模板信息
		public function saveOrUpdateTemplate(param:Object, success:Function, error:Function=null):void
		{
			//本地调试
			if (msgFO.local)
			{
				success.call(this);
				return;
			}
			//服务器运行
			_msgDAO.saveOrUpdateTemplate(param, function():void
				{
					success.call(this);
				}, error);
		}

		//保存模板指标
		public function saveOrUpdateSegment(param:Object, success:Function, error:Function=null):void
		{
			//本地调试
			if (msgFO.local)
			{
				var result:Object=MssLocalTest.saveOrUpdateSegment();
				success.call(this, result);
				return;
			}
			//服务器运行
			_msgDAO.saveOrUpdateSegment(param, function(result:Object):void
				{
					success.call(this, result);
				}, error);
		}

		//删除某个模板和对应配置的指标信息
		public function deleteTemplate(param:Object, success:Function, error:Function=null):void
		{
			_msgDAO.deleteTemplate(param, function():void
				{
					success.call(this);
				}, error);
		}

		//发送彩信接口
		public function sendMediaMessage(param:Object, success:Function, error:Function=null):void
		{
			_msgDAO.sendMediaMessage(param, function(result:Boolean):void
				{
					success.call(this, result);
				}, error);
		}

		//发送短信接口
		public function sendShortMessage(param:Object, success:Function, error:Function=null):void
		{
			_msgDAO.sendShortMessage(param, function(result:Boolean):void
				{
					success.call(this, result);
				}, error);
		}

		//上传图片
		public function uploadePicture(param:Object, success:Function, error:Function=null):void
		{
			_msgDAO.uploadePicture(param, function(result:Boolean):void
				{
					success.call(this, result);
				}, error);
		}

		//删除上传图片
		public function deleteUploadPicture(param:Object, success:Function, error:Function=null):void
		{
			_msgDAO.deleteUploadPicture(param, function():void
				{
					success.call(this);
				}, error);
		}

		//插入网络图片
		public function insertnetPictureUrl(param:Object, success:Function, error:Function=null):void
		{
			_msgDAO.insertnetPictureUrl(param, function():void
				{
					success.call(this);
				}, error);
		}

		public function get msgFO():MsgFO
		{
			return _msgFO;
		}
	}
}