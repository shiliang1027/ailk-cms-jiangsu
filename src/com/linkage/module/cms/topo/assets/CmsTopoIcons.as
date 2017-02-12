package com.linkage.module.cms.topo.assets
{

	/**
	 * 拓扑图图标
	 * @author duangr
	 *
	 */
	public class CmsTopoIcons
	{
		[Bindable]
		[Embed(source="com/linkage/module/cms/topo/assets/images/增加.png")]
		/**
		 * 新增
		 */
		public static var addIcon:Class;

		[Bindable]
		[Embed(source="com/linkage/module/cms/topo/assets/images/删除.png")]
		/**
		 * 删除
		 */
		public static var delIcon:Class;

		[Bindable]
		[Embed(source="com/linkage/module/cms/topo/assets/images/显示全部.gif")]
		/**
		 * 显示全部
		 */
		public static var viewAllIcon:Class;

		[Bindable]
		[Embed(source="com/linkage/module/cms/topo/assets/images/工程.png")]
		/**
		 * 工程状态: 工程
		 */
		public static var workStatusIcon_1:Class;

		[Bindable]
		[Embed(source="com/linkage/module/cms/topo/assets/images/工程实施状态.png")]
		/**
		 * 工程状态: 维护
		 */
		public static var workStatusIcon_3:Class;
		[Bindable]
		[Embed(source="com/linkage/module/cms/topo/assets/images/工程现网状态.png")]
		/**
		 * 工程状态: 在网运行
		 */
		public static var workStatusIcon_4:Class;
		[Bindable]
		[Embed(source="com/linkage/module/cms/topo/assets/images/工程.png")]
		/**
		 * 工程状态: 工程新建
		 */
		public static var workStatusIcon_5:Class;
		[Bindable]
		[Embed(source="com/linkage/module/cms/topo/assets/images/工程退网状态.png")]
		/**
		 * 工程状态: 临时退网(中断)
		 */
		public static var workStatusIcon_6:Class;
		[Bindable]
		[Embed(source="com/linkage/module/cms/topo/assets/images/工程现网容灾备份状态.png")]
		/**
		 * 工程状态: 备份网元
		 */
		public static var workStatusIcon_7:Class;
		
		[Bindable]
		[Embed(source="com/linkage/module/cms/topo/assets/images/查询.png")]
		public static var advanceSearchIcon:Class;
	}
}