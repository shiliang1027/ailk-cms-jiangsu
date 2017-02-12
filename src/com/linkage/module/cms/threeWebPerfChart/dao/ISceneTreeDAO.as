package com.linkage.module.cms.threeWebPerfChart.dao
{
	import mx.rpc.AsyncToken;

	public interface ISceneTreeDAO
	{
		/**
		 * 获取场景tree
		 * */
		function getSceneAreaList(param:Object = null):AsyncToken;
		/**
		 * 获取场景tree（新场景）
		 * */
		function getSceneTree(param:Object = null):AsyncToken;
	}
}