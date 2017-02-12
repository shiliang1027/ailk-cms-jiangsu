package com.linkage.module.cms.scene.view.components.renderer
{
	import com.linkage.module.cms.scene.event.SceneEvent;
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;

	import flash.events.MouseEvent;

	import mx.controls.Alert;
	import mx.controls.CheckBox;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridHeaderRenderer;

	/**
	 *表头复选框渲染器
	 */
	public class CheckBoxSelectHeaderRenderer extends AdvancedDataGridHeaderRenderer
	{
		/**
		 *日志记录器
		 */
		private var log:ILogger=Log.getLogger("com.linkage.module.cms.specialty.alarmSearch.common.HeaderCheckRenderer");
		/**
		 *全选按钮
		 */
		private var selCheckBox:CheckBox=null;

		public function CheckBoxSelectHeaderRenderer()
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

			log.info("点击表头：{0}", event);
			var evt:SceneEvent = new SceneEvent(SceneEvent.CHECKBOX_ALL_SELECTED, true, true);
			evt.param = new Object;
			if(selCheckBox.selected)
				evt.param = "1";
			else
				evt.param = "0";
			log.info(evt.param);
			dispatchEvent(evt);
		}
	}
}

