package com.linkage.module.cms.general.regional.mss.module.dao.data
{

	/**
	 *信息发布Data
	 * @author mengqiang
	 *
	 */
	public interface MsgData
	{
		/**
		 * 获取配置指标列表
		 * @param paramMap 格式：{moTypeId："网元类型",monitorId:"场景Id"}
		 * @return List<Map> 格式：{mo_type_id："网元类型",
		 * perf_type_id:"指标Id",show_name:"指标名称",
		 * perf_algorithm:"指标统计方法",perf_class:"指标类别（1彩信，2短信）"}
		 */
		function getAllSegmentList(param:Object, success:Function):void;
		/**
		 * 按类型获取所有已经配置的模板
		 * @param paramMap 参数Map,格式：{monitorId:"场景Id",msgTempType:"模板类型，1代表彩信模板，2代表短信模板"}
		 * @return 返回Map的格式：{msg_temp_id："模板Id",
		 * monitor_id:"场景Id"，msg_temp_name："模板名称"，
		 * send_target："发送目标",msg_title:"模板标题",
		 * net_img_url:"网络图片URL"}
		 */
		function getAllTemplateByType(param:Object, success:Function):void;
		/**
		 * 获取某个模板已经配置的所有信息列表
		 *
		 * @param paramMap 格式：
		 * {monitorId："场景Id"，
		 * msgTempType："模板类型，1彩信，2短信"，
		 * msgTempId："模板Id"}
		 *
		 * @return Map 格式：
		 * {
		 * template：{msg_temp_name:"模板名称",send_target:"发送目标",
		 * msg_title:"模板标题"，net_img_url："URL",add_time:"time"，msg_content："发送内容"}
		 *
		 * segmentList:[{statDataOutline:"截至到2011年4月7日14:00止,话务量为XXX",
		 * latestData："XXX最近一次数据是46.3",
		 * statData:[{perf_value:"33.2",show_name:"话务量",gather_time:"2011-07-01 08:30:00"},{},{},{}......]},{},{}....
		 * ]
		 * }
		 */
		function getTemplateInfoByTempId(param:Object, success:Function):void;
		/**
		 * 保存更新模板信息
		 * @param paramMap 格式：
		 * {monitorId:"场景Id",msgTempId:"模板Id（如果是新增模板置为空）",
		 * msgTempName:"模板名称",sendTarget:"发送对象",msgTitle:"标题名称",
		 * netImgUrl:"网络图片URL",msgTempType:"模板类型：1彩信，2短信"}
		 */
		function saveOrUpdateTemplate(param:Object, success:Function, error:Function=null):void;
		/**
		 * 保存模板指标
		 * @param paramMap 格式：
		 * {msgTempId："模板Id",moTypeId:"网元类型",showName:"网元名称"
		 * perfTypeId:"指标Id",timeInterval:"周期",time:"查询时间"}
		 *
		 * @return Map {statDataOutline:"截至到2011年4月7日14:00止,话务量为XXX",
		 * latestData："XXX最近一次数据是46.3",
		 * statData:[{perf_value:"33.2",show_name:"话务量",gather_time:"2011-07-01 08:30:00"},{},{}.....]}
		 *
		 */
		function saveOrUpdateSegment(param:Object, success:Function, error:Function=null):void;
		function deleteTemplate(param:Object, success:Function, error:Function=null):void;
		/**
		 * 发送彩信接口
		 * @param paramMap
		 * @return
		 */
		function sendMediaMessage(param:Object, success:Function, error:Function=null):void;
		/**
		 * 发送短信接口
		 * @param paramMap
		 * @return
		 */
		function sendShortMessage(param:Object, success:Function, error:Function=null):void;
		/**
		 * 上传图片
		 * @param paramMap
		 * @return
		 */
		function uploadePicture(param:Object, success:Function, error:Function=null):void;
		/**
		 * 删除上传图片
		 * @param paramMap
		 * @return
		 */
		function deleteUploadPicture(param:Object, success:Function, error:Function=null):void;
		/**
		 * 插入网络图片
		 * @param paramMap
		 */
		function insertnetPictureUrl(param:Object, success:Function, error:Function=null):void;
	}
}