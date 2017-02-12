package com.linkage.module.cms.topo.view.component.toolbar.action
{
	import com.linkage.module.topo.framework.controller.action.canvas.CanvasAction;
	import com.linkage.module.topo.framework.controller.event.TopoEvent;
	import com.linkage.module.topo.framework.core.Feature;
	import com.linkage.module.topo.framework.view.component.TopoCanvas;

	public class AdvanceSearchAction extends CanvasAction
	{
		public function AdvanceSearchAction(canvas:TopoCanvas)
		{
			super(canvas);
		}
		
		override public function get name():String
		{
			return "高级检索模式";
		}
		
	}
}