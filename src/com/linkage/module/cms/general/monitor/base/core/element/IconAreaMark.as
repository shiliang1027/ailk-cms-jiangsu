package com.linkage.module.cms.general.monitor.base.core.element
{

	public class IconAreaMark extends AreaMark
	{
		public function IconAreaMark()
		{
			super();
		}

		override public function set changeValue(value:String):void
		{
			icon=value;
		}
	}
}