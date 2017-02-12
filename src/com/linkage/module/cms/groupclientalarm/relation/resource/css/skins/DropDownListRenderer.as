package com.linkage.module.cms.groupclientalarm.relation.resource.css.skins
{
	import com.linkage.module.cms.groupclientalarm.relation.resource.imagesclass.IconParam;

	import mx.controls.Image;

	import spark.skins.spark.DefaultItemRenderer;

	public class DropDownListRenderer extends DefaultItemRenderer
	{
		/**
		 *向右图片按钮
		 */
		private var leftImg:Image=null;

		public function DropDownListRenderer()
		{
			leftImg=new Image();
			leftImg.width=12;
			leftImg.height=12;
			leftImg.source=IconParam.leftIcon;
		}

		override protected function createChildren():void
		{
			super.createChildren();

			//添加下拉框图片
			addChild(leftImg);
		}

		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);

			//设置下拉图片坐标
			leftImg.x=3;
			leftImg.y=(unscaledHeight - leftImg.height) / 2;
		}
	}
}