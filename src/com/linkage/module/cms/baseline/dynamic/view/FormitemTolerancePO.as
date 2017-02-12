package com.linkage.module.cms.baseline.dynamic.view
{
	/**
	 * 该as的描述信息
	 * @author 
	 * @version 1.0
	 * @category 
	 * @copyright 南京联创科技 网管开发部
	 */
	public class FormitemTolerancePO
	{
		[Bindable]
		public var up:String="0";
		[Bindable]
		public var down:String="0";
		[Bindable]
		public var alarmLevel:String="0";
		[Bindable]
		public var activeLimit:String="0";
		[Bindable]
		public var clearLimit:String="0";
		public function FormitemTolerancePO(up:String,down:String,alarmLevel:String,activeLimit:String,clearLimit:String){
			this.up=up;
			this.down=down;
			this.alarmLevel=alarmLevel;
			this.activeLimit=activeLimit;
			this.clearLimit=clearLimit;
		}
	}
	
}