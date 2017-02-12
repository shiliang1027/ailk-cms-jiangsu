package com.linkage.module.cms.perfmonitornew.alarm
{
	import mx.controls.listClasses.TileListItemRenderer;
	
	import spark.components.DataGroup;
	
	public class MyTileRenderer extends TileListItemRenderer
	{
		public function MyTileRenderer()
		{
			super();
		}
		
		
		private var childList:DataGroup;
		override protected function createChildren():void
		{
			super.createChildren();
			
			if(!childList && data.children){
				childList = new DataGroup();
				childList.percentWidth=100;
				childList.dataProvider = data.children;
				this.addChild(childList);
			}
		}
	}
}