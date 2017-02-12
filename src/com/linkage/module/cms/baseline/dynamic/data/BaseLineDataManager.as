package com.linkage.module.cms.baseline.dynamic.data
{
	/**
	 * 该as的描述信息
	 * @category com.linkage.module.cms.baseline.dynamic.data
	 * @copyright 南京联创科技 网管开发部
	 */
	public interface BaseLineDataManager
	{
		/**
		 *
		 * 加载左边的树
		 * 
		 **/
		function getFullTreeInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		/**
		 * 
		 * 根据指定的网元Id加载左边的树
		 * 
		 **/
		function getDefaultMoTreeInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		/**
		 * 
		 * 加载树的下一页请求
		 * 
		 **/
		function getTreeInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void;

		/**
		 * 
		 * 加载网元指标数据
		 * 
		 **/
		function getBaseLineInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 * 
		 * 保存修改的指标信息
		 * 
		 **/
		function saveManualBaseLineInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		/**
		 * 
		 * 加载网元指标的样本数据
		 * 
		 **/
		function getBaseLineSwatchInfo(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		
		/**
		 * 
		 * 加载指标数据
		 * 
		 **/
		function loadKPIList(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 * 
		 * 加载网元类型数据（查询条件）
		 * 
		 **/
		function loadMoTypeList(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 * 加载网元数据（查询在动态基线里的或者没配置在动态基线的）
		 **/
		function getBaseLineMos(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 * 生成基线
		 **/
		function createBaseLines(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 * 修改指标基线状态
		 **/
		function doChangeKPIBaseLineStatus(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 * 查询指标异常值设置
		 **/
		function loadOutliers(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 * 异常值设置
		 **/
		function saveOutliers(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 * 查询指标基线容忍度
		 **/
		function loadTolerance(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 * 保存基线容忍度
		 **/
		function saveTolerance(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 * 保存基线算法类型
		 **/
		function saveBSLineEvaltype(param:Object,success:Function,complete:Function=null,error:Function=null):void;
		/**
		 * 删除基线
		 **/
		function deleteBaseLine(param:Object,success:Function,complete:Function=null,error:Function=null):void;
	}
}