package com.linkage.module.cms.groupclientalarm.renderer
{
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;
	
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	import mx.controls.CheckBox;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridHeaderRenderer;

	/**
	 *表头复选框渲染器
	 * @author mengqiang
	 *
	 */
	public class HeaderCheckRenderer extends AdvancedDataGridHeaderRenderer
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.groupclient.renderer.HeaderCheckRenderer");
		/**
		 *全选按钮
		 */
		private var selCheckBox:CheckBox=null;

		public function HeaderCheckRenderer()
		{
			super();
			//初始化全选标签
			selCheckBox = new CheckBox();
			selCheckBox.label = "全选";
			selCheckBox.mouseEnabled = false;
			addChild(selCheckBox);
			addEventListener(MouseEvent.CLICK, clickSelectCheckBox);
		}

		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);

			//设置全选标签坐标
			selCheckBox.x = 11;
			selCheckBox.y = (unscaledHeight - selCheckBox.height) / 2;
		}

		//点击全选按钮
		private function clickSelectCheckBox(event:MouseEvent):void
		{
			selCheckBox.selected = !selCheckBox.selected;
			
			parentDocument.setAllAlarmSelected(selCheckBox.selected);
		}
	}
}