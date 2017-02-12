package com.linkage.module.cms.scenedaily.view.components.healthreport
{
	import com.ailk.common.system.logging.ILogger;
	import com.ailk.common.system.logging.Log;
	import com.linkage.module.cms.scenedaily.event.healthreport.HealthReportSetEvent;

	import flash.events.MouseEvent;

	import mx.controls.CheckBox;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridHeaderRenderer;

	/**
	 * 健康指标分类设置表头全选渲染器
	 *
	 * @author 张传存 (69207)
	 * @version 1.0
	 * @date 2012-9-7
	 * @langversion 3.0
	 * @playerversion Flash 11
	 * @productversion Flex 4
	 * @copyright Ailk NBS-Network Mgt. RD Dept.
	 *
	 */

	public class HealthHeaderCheckRenderer extends AdvancedDataGridHeaderRenderer
	{
		private var log:ILogger = Log.getLoggerByClass(HealthHeaderCheckRenderer);
		/**
		 *全选按钮
		 */
		private var selCheckBox:CheckBox = null;

		public function HealthHeaderCheckRenderer()
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

			parentDocument.setAllSelected(selCheckBox.selected);

		}
	}
}