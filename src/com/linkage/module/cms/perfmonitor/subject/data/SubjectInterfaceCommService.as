package com.linkage.module.cms.perfmonitor.subject.data
{
	public interface SubjectInterfaceCommService
	{
		/**
		 * 单个网元的详细信息
		 * @param paramMap {mo_id:"test_id"}
		 * @return 具体格式待定
		 */
		function moDetailInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 单个网元的性能信息
		 * @param paramMap {mo_id:"test_id"}
		 * @return 具体格式待定 
		 */
		function moPerfInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 单个网元的告警信息
		 * @param paramMap {mo_id:"test_id"}
		 * @return 具体格式待定 
		 */
		function moAlarmInfo(paramMap:Object, success:Function, complete:Function = null, error:Function = null):void;
		
		/**
		 * 查询所有属地信息
		 * @return [{"city_id":"1","city_name":"江苏省","city_layer":"1","parent_id":"-1"}]
		 */
		function getAllCityTree(success:Function, complete:Function = null, error:Function = null):void;
	}
}