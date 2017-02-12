package com.linkage.module.cms.general.regional.data
{
	/**
	 * 现场图片监控数据接口
	 * @author czm
	 *
	 */
	public interface SpotPicServ
	{
		/**
		 * 获取现场图片信息
		 * @param monitorId 场景Id
		 * @return List<Map> 返回的List中Map的格式{"id":"1","img_name":"test","img_type":"movie或者是picture","img_url":"movie/1.flv","longitdue":"113.289518","latitude":"23.23172"}
		 */
		function getSpotPicInfoList(monitorId:String,success:Function, complete:Function = null, error:Function = null):void;
	}
}