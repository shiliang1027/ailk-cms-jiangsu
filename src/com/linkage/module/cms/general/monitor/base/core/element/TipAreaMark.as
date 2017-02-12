package com.linkage.module.cms.general.monitor.base.core.element
{

	public class TipAreaMark extends AreaMark
	{
		public function TipAreaMark()
		{
			super();
		}

		override public function set changeValue(value:String):void
		{
			text = value;
		}
	}
}