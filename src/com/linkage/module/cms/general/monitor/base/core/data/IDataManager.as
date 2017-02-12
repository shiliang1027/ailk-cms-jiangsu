package com.linkage.module.cms.general.monitor.base.core.data
{


	/**
	 *Action管理器,将与web交互的Action集中管理
	 * @author mengqiang
	 *
	 */
	public interface IDataManager
	{
		/**
		 *通过url加载数据
		 * @param url 配置文件数据url
		 * @param success 执行成功执行的回调方法
		 * @param error 执行失败执行的回调方法
		 *
		 */
		function loadDataByUrl(url:String, success:Function, error:Function = null):void;
		/**
		 *通过属地id数组和请求地址加载视图数据
		 * @param areaIdArr 标记数组[0001,0002,0003]
		 * @param url 请求地址
		 * @param success 执行成功执行的回调方法
		 * @param error 执行失败执行的回调方法
		 *
		 */
		function loadViewDataByAreaIdAndUrl(areaIdArr:String, url:String, success:Function, error:Function = null):void;
		/**
		 *获取数据通过参数和URL
		 * @param param 参数
		 * @param url 链接地址
		 * @param success 成功执行方法
		 * @param error 失败执行方法
		 *
		 */
		function loadDataByParamAndUrl(param:String, url:String, success:Function, error:Function = null):void;
	}
}