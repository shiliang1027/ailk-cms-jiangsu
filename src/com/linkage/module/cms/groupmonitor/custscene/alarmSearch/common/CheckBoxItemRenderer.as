package com.linkage.module.cms.groupmonitor.custscene.alarmSearch.common
{
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;

	import flash.events.Event;

	import mx.controls.CheckBox;
	import mx.controls.listClasses.ListBase;
	import mx.events.FlexEvent;
	import mx.utils.ArrayUtil;

	import spark.components.ComboBox;

	public class CheckBoxItemRenderer extends CheckBox
	{
		private var logger:ILogger = Log.getLogger("com.linkage.module.cms.groupmonitor.custscene.alarmSeach.common.CheckBoxItemRenderer");

		/**存储当前列数据对象**/
		private var currData:Object;

		public function CheckBoxItemRenderer()
		{
			super();
			this.addEventListener(Event.CHANGE, onClickCheckBox);
		}

		override public function set data(value:Object):void
		{
			this.selected = value.selected;
			this.currData = value;
			this.label = value.label;
//			logger.error("set data");

		}

		override public function set enabled(value:Boolean):void
		{
			if (currData)
			{
				value = currData.enabled == false ? false : true;
			}
			super.enabled = value;
		}

		private function onClickCheckBox(e:Event):void
		{
			var listBase:MyComboBox = MyComboBox(listData.owner.owner);
			var selectedItems:Array = listBase.selectedItems;
			currData.selected = this.selected;
			if (this.selected)
			{
				selectedItems.push(currData);
			}
			else
			{
				selectedItems.splice(ArrayUtil.getItemIndex(currData, selectedItems), 1);
			}
			listBase.selectedItems = selectedItems;
		}
	}
}