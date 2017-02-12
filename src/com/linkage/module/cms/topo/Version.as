package com.linkage.module.cms.topo
{
	import com.linkage.system.logging.ILogger;
	import com.linkage.system.logging.Log;

	public class Version
	{
		// log
		private var log:ILogger = Log.getLogger("com.linkage.module.cms.topo.Version");

		/**
		 * 版本号
		 *
		 * <p>历史版本回顾:</p>
		 *
		 * <ul>
		 * <li> <b>1.1.10.120525</b> 使用flex builder 4.6 打包版本</li>
		 * <li> <b>1.1.9.120508</b>  修改网元定位,从除集客以为的MC中查询网元.定位集客从集客MC中查找 </li>
		 * <li> <b>1.1.8.120507</b>  修改拓扑搜索正则表达式,包装器会传入 <i>默认搜索regex</i> 与 <i>集客搜索regex</i>; 集客属地云图查看告警使用新的集客属地字段; 初始化告警流水时增加获取数据列配置 </li>
		 * <li> <b>1.1.7.120506</b>  TopoComponent中loadTopo 增加是否启用画布topoName与是否resetCanvas的标志位</li>
		 * <li> <b>1.1.6.120221</b>  集客中搜索有告警传输电路,搜索范围根据正则表达式由mc处获取,不再写死</li>
		 * <li> <b>1.1.5.120217</b>  鹰眼,标尺的样式可定制,增加黑白两套鹰眼,标尺的样式</li>
		 * <li> <b>1.1.4.120205</b>  流水增加角色id的参数</li>
		 * <li> <b>1.1.3.111228</b>  增加标尺显隐切换按钮</li>
		 * <li> <b>1.1.2.111222</b>  修改拓扑搜索机制,通过传入需要搜索的正则表达式去拓扑服务查询符合条件的toponame(集客搜索使用)</li>
		 * <li> <b>1.1.1.111220</b>  修改面板机制,提高首次打开时的速度</li>
		 * <li> <b>1.0.38.111214</b> 增加工具条上面按钮权限控制</li>
		 * <li> <b>1.0.37.111209</b> 增加传输网元拓扑定位后高亮关联网元功能</li>
		 * <li> <b>1.0.36.111207</b> 增加比例尺,修改loading提示机制</li>
		 * <li> <b>1.0.35.111206</b> 增加批量保存对象的接口</li>
		 * <li> <b>1.0.34.111130</b> 增加Grid对象</li>
		 * <li> <b>1.0.33.111117</b> 增加是否渲染告警数量的配置项</li>
		 * <li> <b>1.0.32.111103</b> 集客的toponame不再写死,在包装器中配置,key=jkTopoNames</li>
		 * <li> <b>1.0.31.111102</b> 修正数据网ip承载,cmnet,wlan,gprs获取告警的规则</li>
		 * <li> <b>1.0.30.111025</b> 修正添加线对象后不能画链路的bug</li>
		 * <li> <b>1.0.29.111024</b> 获取拓扑树的接口中增加topoSql</li>
		 * <li> <b>1.0.28.111022</b> 增加线对象的绘制</li>
		 * <li> <b>1.0.27.111021</b> 拓扑树中增加展现网元的状态(0:隐藏,1:可见,2:全部)</li>
		 * <li> <b>1.0.26.111019</b> 形状中增加是否启用阴影的配置项</li>
		 * <li> <b>1.0.25.110928</b> 二次高亮网元; TopoCanvas中增加 一屏显示,正常显示 的方法.</li>
		 * </ul>
		 */
		public static const VERSION:String = "1.1.10.120525";

		/**
		 * 拓扑图版本信息
		 * @return
		 *
		 */
		public static function get info():String
		{
			return "[拓扑版本] " + VERSION;
		}
	}
}