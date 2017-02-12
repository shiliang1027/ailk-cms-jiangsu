package com.linkage.module.cms.general.regional.important.venue.view.element
{
	import com.linkage.module.cms.general.regional.important.venue.common.util.FileUtil;
	import com.linkage.module.cms.general.regional.important.venue.common.util.VenueUtil;

	import flash.display.Bitmap;
	import flash.events.IOErrorEvent;
	import flash.events.MouseEvent;

	import mx.controls.Label;
	import mx.core.UIComponent;
	import mx.graphics.SolidColorStroke;

	import spark.components.BorderContainer;
	import spark.components.HGroup;
	import spark.components.VGroup;
	import spark.filters.GlowFilter;

	/**
	 *图片节点
	 * @author mengqiang
	 *
	 */
	public class ImageNode extends VGroup
	{
		/**
		 *边框容器
		 */
		private var borderContainer:BorderContainer=null;
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
		 *告警等级
		 */
		private var _venueLevel:String=null;
		/**
		 *当前节点宽度
		 */
		private var _curWidth:Number=0;
		/**
		 *当前节点高度
		 */
		private var _curHeight:Number=0;

		public function ImageNode(curWidth:Number, curHeight:Number, imageId:String, imageUrl:String, imageName:String, venueLevel:String)
		{
			//1.初始化参数
			_imageId=imageId;
			_imageUrl=imageUrl;
			_imageName=imageName;
			_curWidth=curWidth;
			_curHeight=curHeight;
			_venueLevel=venueLevel;

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
//				skinUi.addEventListener(MouseEvent.MOUSE_OVER, imageNodeOver);
//				skinUi.addEventListener(MouseEvent.MOUSE_OUT, imageNodeOut);
				//生成边框
				var color:uint=VenueUtil.alarmLevelColor(venueLevel);
				if (color != 0)
				{
					borderContainer=new BorderContainer();
					borderContainer.height=curHeight - 8;
					borderContainer.borderStroke=new SolidColorStroke(color, 6);
					borderContainer.addElement(skinUi);
					addElement(borderContainer);
				}
				else
				{
					addElement(skinUi);
				}
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

//		//鼠标悬停事件
//		private function imageNodeOver(event:MouseEvent):void
//		{
//			filters=[new GlowFilter(0x000000)];
//		}
//
//		//鼠标移出事件
//		private function imageNodeOut(event:MouseEvent):void
//		{
//			filters=[];
//		}

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

		public function get venueLevel():String
		{
			return _venueLevel;
		}
	}
}