package com.linkage.module.cms.general.regional.important.scene.view.element
{
	import com.linkage.module.cms.general.regional.important.scene.common.util.FileUtil;

	import flash.display.Bitmap;
	import flash.events.IOErrorEvent;

	import mx.controls.Label;
	import mx.core.UIComponent;

	import spark.components.HGroup;
	import spark.components.VGroup;

	/**
	 *图片节点
	 * @author mengqiang
	 *
	 */
	public class ImageNode extends VGroup
	{
		/**
		 *皮肤容器
		 */
		private var skinUi:UIComponent=null;
		/**
		 *标签容器
		 */
		private var labelGroup:HGroup=null;
		/**
		 *图片ID
		 */
		private var _imageId:String=null;
		/**
		 *图片URL
		 */
		private var _imageUrl:String=null;
		/**
		 *图片名称
		 */
		private var _imageName:String=null;
		/**
		 *当前节点宽度
		 */
		private var _curWidth:Number=0;
		/**
		 *当前节点高度
		 */
		private var _curHeight:Number=0;

		public function ImageNode(curWidth:Number, curHeight:Number, imageId:String, imageUrl:String, imageName:String)
		{
			//1.初始化参数
			_imageId=imageId;
			_imageUrl=imageUrl;
			_imageName=imageName;
			_curWidth=curWidth;
			_curHeight=curHeight;

			//2.初始化图片节点
			initImageNode();
		}

		//初始化图片节点
		private function initImageNode():void
		{
			FileUtil.urlLoader(imageUrl, function(result:Object):void
				{
					var bitmap:Bitmap=result.content as Bitmap;
					addSceneImageNode(bitmap);

				}, function(event:IOErrorEvent):void
				{
					throw new Error("加载场馆图片失败.");
				});
		}

		//添加场馆图片
		private function addSceneImageNode(bitmap:Bitmap):void
		{
			//1.设置节点宽和高
			width=curWidth;
			height=curHeight;
			buttonMode=true;

			//2.添加图片信息
			if (bitmap != null)
			{
				bitmap.width=curWidth;
				bitmap.height=curHeight - 20;
				skinUi=new UIComponent();
				skinUi.width=curWidth;
				skinUi.height=curHeight - 20;
				skinUi.addChild(bitmap);
				addElement(skinUi);
			}

			//3.添加场馆名称
			labelGroup=new HGroup();
			labelGroup.width=curWidth;
			labelGroup.height=20
			labelGroup.horizontalCenter=0;
			labelGroup.horizontalAlign="center";
			var label:Label=new Label();
			label.text=imageName;
			labelGroup.addElement(label);
			addElement(labelGroup);
		}

		public function get imageId():String
		{
			return _imageId;
		}

		public function get imageUrl():String
		{
			return _imageUrl;
		}

		public function get imageName():String
		{
			return _imageName;
		}

		public function get curWidth():Number
		{
			return _curWidth;
		}

		public function get curHeight():Number
		{
			return _curHeight;
		}
	}
}