-- ============================================================
-- ERPNext 核心数据模型 MySQL 8 DDL 脚本
-- 来源: erpnext-er-diagram-01.html (112 实体 / 71 关系 / 11 业务域)
-- 规范:
--   1. 所有字段 NOT NULL, 除 text 等无法给默认值的类型外均提供默认值
--   2. 日期类型统一使用 datetime, 默认 CURRENT_TIMESTAMP
--   3. 每表统一附加基础字段: version/create_dept/create_time/create_by/
--      update_time/update_by/del_flag, 主键 id bigint 自增
--   4. 不创建二级索引与物理外键(逻辑外键, 应用层维护)
-- ============================================================
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- 一、基础配置域 Setup (12 表)
-- ============================================================

-- ----------------------------
-- 1、分公司表
-- ----------------------------
CREATE TABLE `rainy_biz_branch` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='分公司';

-- ----------------------------
-- 2、品牌表
-- ----------------------------
CREATE TABLE `rainy_biz_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='品牌';

-- ----------------------------
-- 3、公司表
-- ----------------------------
CREATE TABLE `rainy_biz_company` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `company_name` varchar(255) NOT NULL DEFAULT '' COMMENT '公司全称',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `default_finance_book` varchar(140) NOT NULL DEFAULT '' COMMENT '默认财务账簿',
  `parent_company` varchar(140) NOT NULL DEFAULT '' COMMENT '父公司',
  `default_holiday_list` varchar(140) NOT NULL DEFAULT '' COMMENT '默认假日列表',
  `default_warehouse_for_transit` varchar(140) NOT NULL DEFAULT '' COMMENT '默认在途仓库',
  `existing_company` varchar(140) NOT NULL DEFAULT '' COMMENT '已存在的公司',
  `default_bank_account` varchar(140) NOT NULL DEFAULT '' COMMENT '默认银行账户',
  `is_group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否分组',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='公司';

-- ----------------------------
-- 4、客户组表
-- ----------------------------
CREATE TABLE `rainy_biz_customer_group` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `customer_group_name` varchar(255) NOT NULL DEFAULT '' COMMENT '客户组名称',
  `parent_customer_group` varchar(140) NOT NULL DEFAULT '' COMMENT '父客户组',
  `default_price_list` varchar(140) NOT NULL DEFAULT '' COMMENT '默认价格表',
  `payment_terms` varchar(140) NOT NULL DEFAULT '' COMMENT '付款条款',
  `old_parent` varchar(140) NOT NULL DEFAULT '' COMMENT '旧父级',
  `is_group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否分组',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客户组';

-- ----------------------------
-- 5、部门表
-- ----------------------------
CREATE TABLE `rainy_biz_department` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `department_name` varchar(255) NOT NULL DEFAULT '' COMMENT '部门名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `parent_department` varchar(140) NOT NULL DEFAULT '' COMMENT '父部门',
  `is_group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否分组',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门';

-- ----------------------------
-- 6、员工表
-- ----------------------------
CREATE TABLE `rainy_biz_employee` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '员工编号',
  `employee_name` varchar(255) NOT NULL DEFAULT '' COMMENT '员工姓名',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `department` varchar(140) NOT NULL DEFAULT '' COMMENT '部门',
  `reports_to` varchar(140) NOT NULL DEFAULT '' COMMENT '汇报对象',
  `branch` varchar(140) NOT NULL DEFAULT '' COMMENT '分公司',
  `holiday_list` varchar(140) NOT NULL DEFAULT '' COMMENT '假日列表',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='员工';

-- ----------------------------
-- 7、假日列表表
-- ----------------------------
CREATE TABLE `rainy_biz_holiday_list` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `holiday_list_name` varchar(255) NOT NULL DEFAULT '' COMMENT '假日列表名称',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='假日列表';

-- ----------------------------
-- 8、物料组表
-- ----------------------------
CREATE TABLE `rainy_biz_item_group` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `item_group_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物料组名称',
  `parent_item_group` varchar(140) NOT NULL DEFAULT '' COMMENT '父物料组',
  `old_parent` varchar(140) NOT NULL DEFAULT '' COMMENT '旧父级',
  `is_group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否分组',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='物料组';

-- ----------------------------
-- 9、销售伙伴表
-- ----------------------------
CREATE TABLE `rainy_biz_sales_partner` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `territory` varchar(140) NOT NULL DEFAULT '' COMMENT '地区',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='销售伙伴';

-- ----------------------------
-- 10、供应商组表
-- ----------------------------
CREATE TABLE `rainy_biz_supplier_group` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `supplier_group_name` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商组名称',
  `parent_supplier_group` varchar(140) NOT NULL DEFAULT '' COMMENT '父供应商组',
  `payment_terms` varchar(140) NOT NULL DEFAULT '' COMMENT '付款条款',
  `old_parent` varchar(140) NOT NULL DEFAULT '' COMMENT '旧父级',
  `is_group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否分组',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='供应商组';

-- ----------------------------
-- 11、地区表
-- ----------------------------
CREATE TABLE `rainy_biz_territory` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `territory_name` varchar(255) NOT NULL DEFAULT '' COMMENT '地区名称',
  `parent_territory` varchar(140) NOT NULL DEFAULT '' COMMENT '父地区',
  `old_parent` varchar(140) NOT NULL DEFAULT '' COMMENT '旧父级',
  `is_group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否分组',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='地区';

-- ----------------------------
-- 12、计量单位表
-- ----------------------------
CREATE TABLE `rainy_biz_uom` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `uom_name` varchar(255) NOT NULL DEFAULT '' COMMENT '计量单位名称',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='计量单位';

-- ============================================================
-- 二、库存域 Stock (22 表)
-- ============================================================

-- ----------------------------
-- 13、批次表
-- ----------------------------
CREATE TABLE `rainy_biz_batch` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '批次编号',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `reference_name` varchar(140) NOT NULL DEFAULT '' COMMENT '关联单据编号',
  `supplier` varchar(140) NOT NULL DEFAULT '' COMMENT '供应商',
  `item` varchar(140) NOT NULL DEFAULT '' COMMENT '物料',
  `parent_batch` varchar(140) NOT NULL DEFAULT '' COMMENT '父批次',
  `stock_uom` varchar(140) NOT NULL DEFAULT '' COMMENT '库存单位',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='批次';

-- ----------------------------
-- 14、送货单表
-- ----------------------------
CREATE TABLE `rainy_biz_delivery_note` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `customer_name` varchar(255) NOT NULL DEFAULT '' COMMENT '客户名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `customer` varchar(140) NOT NULL DEFAULT '' COMMENT '客户',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `tax_category` varchar(140) NOT NULL DEFAULT '' COMMENT '税务类别',
  `shipping_rule` varchar(140) NOT NULL DEFAULT '' COMMENT '运输规则',
  `set_warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '默认仓库',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `grand_total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '含税总计',
  `total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '总计',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='送货单';

-- ----------------------------
-- 15、物料表
-- ----------------------------
CREATE TABLE `rainy_biz_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '物料编码',
  `item_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物料名称',
  `variant_of` varchar(140) NOT NULL DEFAULT '' COMMENT '变体母物料',
  `item_group` varchar(140) NOT NULL DEFAULT '' COMMENT '物料组',
  `stock_uom` varchar(140) NOT NULL DEFAULT '' COMMENT '库存单位',
  `asset_category` varchar(140) NOT NULL DEFAULT '' COMMENT '资产类别',
  `brand` varchar(140) NOT NULL DEFAULT '' COMMENT '品牌',
  `weight_uom` varchar(140) NOT NULL DEFAULT '' COMMENT '重量单位',
  `purchase_uom` varchar(140) NOT NULL DEFAULT '' COMMENT '采购单位',
  `valuation_rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '评估单价',
  `is_stock_item` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否库存物料',
  `has_serial_no` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有序列号',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='物料';

-- ----------------------------
-- 16、物料价格表
-- ----------------------------
CREATE TABLE `rainy_biz_item_price` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `item_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物料名称',
  `customer` varchar(140) NOT NULL DEFAULT '' COMMENT '客户',
  `supplier` varchar(140) NOT NULL DEFAULT '' COMMENT '供应商',
  `price_list` varchar(140) NOT NULL DEFAULT '' COMMENT '价格表',
  `item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '物料编码',
  `uom` varchar(140) NOT NULL DEFAULT '' COMMENT '计量单位',
  `brand` varchar(140) NOT NULL DEFAULT '' COMMENT '品牌',
  `batch_no` varchar(140) NOT NULL DEFAULT '' COMMENT '批次编号',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='物料价格';

-- ----------------------------
-- 17、落地成本凭证表
-- ----------------------------
CREATE TABLE `rainy_biz_landed_cost_voucher` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `amended_from` varchar(140) NOT NULL DEFAULT '' COMMENT '修订自',
  `posting_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过账日期',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='落地成本凭证';

-- ----------------------------
-- 18、制造商表
-- ----------------------------
CREATE TABLE `rainy_biz_manufacturer` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='制造商';

-- ----------------------------
-- 19、物料申请单表
-- ----------------------------
CREATE TABLE `rainy_biz_material_request` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `customer` varchar(140) NOT NULL DEFAULT '' COMMENT '客户',
  `work_order` varchar(140) NOT NULL DEFAULT '' COMMENT '生产工单',
  `set_warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '默认仓库',
  `amended_from` varchar(140) NOT NULL DEFAULT '' COMMENT '修订自',
  `job_card` varchar(140) NOT NULL DEFAULT '' COMMENT '作业卡',
  `set_from_warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '默认来源仓库',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `transaction_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '交易日期',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='物料申请单';

-- ----------------------------
-- 20、价格表
-- ----------------------------
CREATE TABLE `rainy_biz_price_list` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `price_list_name` varchar(255) NOT NULL DEFAULT '' COMMENT '价格表名称',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='价格表';

-- ----------------------------
-- 21、采购收货单表
-- ----------------------------
CREATE TABLE `rainy_biz_purchase_receipt` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `supplier_name` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `supplier` varchar(140) NOT NULL DEFAULT '' COMMENT '供应商',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `tax_category` varchar(140) NOT NULL DEFAULT '' COMMENT '税务类别',
  `shipping_rule` varchar(140) NOT NULL DEFAULT '' COMMENT '运输规则',
  `set_warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '默认仓库',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `grand_total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '含税总计',
  `total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '总计',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='采购收货单';

-- ----------------------------
-- 22、质量检验表
-- ----------------------------
CREATE TABLE `rainy_biz_quality_inspection` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `item_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物料名称',
  `reference_name` varchar(140) NOT NULL DEFAULT '' COMMENT '关联单据编号',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '物料编码',
  `batch_no` varchar(140) NOT NULL DEFAULT '' COMMENT '批次编号',
  `bom_no` varchar(140) NOT NULL DEFAULT '' COMMENT '物料清单编号',
  `amended_from` varchar(140) NOT NULL DEFAULT '' COMMENT '修订自',
  `quality_inspection_template` varchar(140) NOT NULL DEFAULT '' COMMENT '质量检验模板',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='质量检验';

-- ----------------------------
-- 23、质量检验模板表
-- ----------------------------
CREATE TABLE `rainy_biz_quality_inspection_template` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `quality_inspection_template_name` varchar(255) NOT NULL DEFAULT '' COMMENT '质量检验模板名称',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='质量检验模板';

-- ----------------------------
-- 24、序列号批次束表
-- ----------------------------
CREATE TABLE `rainy_biz_serial_and_batch_bundle` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `item_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物料名称',
  `voucher_no` varchar(140) NOT NULL DEFAULT '' COMMENT '关联凭证编号',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '仓库',
  `item_group` varchar(140) NOT NULL DEFAULT '' COMMENT '物料组',
  `item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '物料编码',
  `amended_from` varchar(140) NOT NULL DEFAULT '' COMMENT '修订自',
  `total_qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '总数量',
  `has_serial_no` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有序列号',
  `has_batch_no` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有批次号',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='序列号批次束';

-- ----------------------------
-- 25、库存调拨单表
-- ----------------------------
CREATE TABLE `rainy_biz_stock_entry` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `supplier_name` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `supplier` varchar(140) NOT NULL DEFAULT '' COMMENT '供应商',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `work_order` varchar(140) NOT NULL DEFAULT '' COMMENT '生产工单',
  `purchase_order` varchar(140) NOT NULL DEFAULT '' COMMENT '采购订单',
  `outgoing_stock_entry` varchar(140) NOT NULL DEFAULT '' COMMENT '流出库存调拨单',
  `posting_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过账日期',
  `is_return` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否退货',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='库存调拨单';

-- ----------------------------
-- 26、库存对账表
-- ----------------------------
CREATE TABLE `rainy_biz_stock_reconciliation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `set_warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '默认仓库',
  `expense_account` varchar(140) NOT NULL DEFAULT '' COMMENT '费用科目',
  `amended_from` varchar(140) NOT NULL DEFAULT '' COMMENT '修订自',
  `posting_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过账日期',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='库存对账';

-- ----------------------------
-- 27、库存设置表
-- ----------------------------
CREATE TABLE `rainy_biz_stock_settings` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `item_group` varchar(140) NOT NULL DEFAULT '' COMMENT '物料组',
  `stock_uom` varchar(140) NOT NULL DEFAULT '' COMMENT '库存单位',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='库存设置';

-- ----------------------------
-- 28、仓库表
-- ----------------------------
CREATE TABLE `rainy_biz_warehouse` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '仓库编码',
  `warehouse_name` varchar(255) NOT NULL DEFAULT '' COMMENT '仓库名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `customer` varchar(140) NOT NULL DEFAULT '' COMMENT '客户',
  `account` varchar(140) NOT NULL DEFAULT '' COMMENT '科目',
  `parent_warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '父仓库',
  `old_parent` varchar(140) NOT NULL DEFAULT '' COMMENT '旧父级',
  `default_in_transit_warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '默认在途仓库',
  `is_group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否分组',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='仓库';

-- ----------------------------
-- 29、送货单行表
-- ----------------------------
CREATE TABLE `rainy_biz_delivery_note_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `item_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物料名称',
  `warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '仓库',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `purchase_order` varchar(140) NOT NULL DEFAULT '' COMMENT '采购订单',
  `item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '物料编码',
  `product_bundle` varchar(140) NOT NULL DEFAULT '' COMMENT '产品组合',
  `stock_uom` varchar(140) NOT NULL DEFAULT '' COMMENT '库存单位',
  `actual_qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '实际数量',
  `qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '数量',
  `rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '单价',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='送货单行';

-- ----------------------------
-- 30、按物料税务明细表
-- ----------------------------
CREATE TABLE `rainy_biz_item_wise_tax_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '税率',
  `amount` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '金额',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='按物料税务明细';

-- ----------------------------
-- 31、落地成本税费表
-- ----------------------------
CREATE TABLE `rainy_biz_landed_cost_taxes_and_charges` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `expense_account` varchar(140) NOT NULL DEFAULT '' COMMENT '费用科目',
  `qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '数量',
  `amount` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '金额',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='落地成本税费';

-- ----------------------------
-- 32、物料申请行表
-- ----------------------------
CREATE TABLE `rainy_biz_material_request_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `item_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物料名称',
  `warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '仓库',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `sales_order` varchar(140) NOT NULL DEFAULT '' COMMENT '销售订单',
  `item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '物料编码',
  `uom` varchar(140) NOT NULL DEFAULT '' COMMENT '计量单位',
  `stock_uom` varchar(140) NOT NULL DEFAULT '' COMMENT '库存单位',
  `actual_qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '实际数量',
  `qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '数量',
  `rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '单价',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='物料申请行';

-- ----------------------------
-- 33、采购收货行表
-- ----------------------------
CREATE TABLE `rainy_biz_purchase_receipt_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `item_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物料名称',
  `warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '仓库',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `sales_order` varchar(140) NOT NULL DEFAULT '' COMMENT '销售订单',
  `purchase_order` varchar(140) NOT NULL DEFAULT '' COMMENT '采购订单',
  `purchase_invoice` varchar(140) NOT NULL DEFAULT '' COMMENT '采购发票',
  `item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '物料编码',
  `valuation_rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '评估单价',
  `qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '数量',
  `rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '单价',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='采购收货行';

-- ----------------------------
-- 34、库存调拨明细表
-- ----------------------------
CREATE TABLE `rainy_biz_stock_entry_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `item_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物料名称',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `s_warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '源仓库',
  `t_warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '目标仓库',
  `item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '物料编码',
  `uom` varchar(140) NOT NULL DEFAULT '' COMMENT '计量单位',
  `stock_uom` varchar(140) NOT NULL DEFAULT '' COMMENT '库存单位',
  `valuation_rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '评估单价',
  `actual_qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '实际数量',
  `qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '数量',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='库存调拨明细';

-- ============================================================
-- 三、合作伙伴CRM域 (4 表)
-- ============================================================

-- ----------------------------
-- 35、营销活动表
-- ----------------------------
CREATE TABLE `rainy_biz_campaign` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `campaign_name` varchar(255) NOT NULL DEFAULT '' COMMENT '营销活动名称',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='营销活动';

-- ----------------------------
-- 36、线索表
-- ----------------------------
CREATE TABLE `rainy_biz_lead` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '线索编号',
  `lead_name` varchar(255) NOT NULL DEFAULT '' COMMENT '线索名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `customer` varchar(140) NOT NULL DEFAULT '' COMMENT '客户',
  `territory` varchar(140) NOT NULL DEFAULT '' COMMENT '地区',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='线索';

-- ----------------------------
-- 37、商机表
-- ----------------------------
CREATE TABLE `rainy_biz_opportunity` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `customer_name` varchar(255) NOT NULL DEFAULT '' COMMENT '客户名称',
  `party_name` varchar(140) NOT NULL DEFAULT '' COMMENT '交易方名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `territory` varchar(140) NOT NULL DEFAULT '' COMMENT '地区',
  `customer_group` varchar(140) NOT NULL DEFAULT '' COMMENT '客户组',
  `amended_from` varchar(140) NOT NULL DEFAULT '' COMMENT '修订自',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '总计',
  `transaction_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '交易日期',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='商机';

-- ----------------------------
-- 38、潜在客户表
-- ----------------------------
CREATE TABLE `rainy_biz_prospect` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `customer_group` varchar(140) NOT NULL DEFAULT '' COMMENT '客户组',
  `territory` varchar(140) NOT NULL DEFAULT '' COMMENT '地区',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='潜在客户';

-- ============================================================
-- 四、财务主数据域 Accounts (28 表)
-- ============================================================

-- ----------------------------
-- 39、会计科目表
-- ----------------------------
CREATE TABLE `rainy_biz_account` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '科目编码',
  `account_name` varchar(255) NOT NULL DEFAULT '' COMMENT '科目名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `parent_account` varchar(140) NOT NULL DEFAULT '' COMMENT '父科目',
  `is_group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否分组',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会计科目';

-- ----------------------------
-- 40、会计期间表
-- ----------------------------
CREATE TABLE `rainy_biz_accounting_period` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会计期间';

-- ----------------------------
-- 41、银行表
-- ----------------------------
CREATE TABLE `rainy_biz_bank` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `bank_name` varchar(255) NOT NULL DEFAULT '' COMMENT '银行名称',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='银行';

-- ----------------------------
-- 42、银行账户表
-- ----------------------------
CREATE TABLE `rainy_biz_bank_account` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '账户编号',
  `party` varchar(140) NOT NULL DEFAULT '' COMMENT '交易方',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `account` varchar(140) NOT NULL DEFAULT '' COMMENT '科目',
  `bank` varchar(140) NOT NULL DEFAULT '' COMMENT '银行',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='银行账户';

-- ----------------------------
-- 43、预算表
-- ----------------------------
CREATE TABLE `rainy_biz_budget` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `account` varchar(140) NOT NULL DEFAULT '' COMMENT '科目',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `amended_from` varchar(140) NOT NULL DEFAULT '' COMMENT '修订自',
  `from_fiscal_year` varchar(140) NOT NULL DEFAULT '' COMMENT '起始会计年度',
  `to_fiscal_year` varchar(140) NOT NULL DEFAULT '' COMMENT '结束会计年度',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='预算';

-- ----------------------------
-- 44、成本中心表
-- ----------------------------
CREATE TABLE `rainy_biz_cost_center` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心编码',
  `cost_center_name` varchar(255) NOT NULL DEFAULT '' COMMENT '成本中心名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `parent_cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '父成本中心',
  `old_parent` varchar(140) NOT NULL DEFAULT '' COMMENT '旧父级',
  `is_group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否分组',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='成本中心';

-- ----------------------------
-- 45、财务账簿表
-- ----------------------------
CREATE TABLE `rainy_biz_finance_book` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `finance_book_name` varchar(255) NOT NULL DEFAULT '' COMMENT '财务账簿名称',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='财务账簿';

-- ----------------------------
-- 46、会计年度表
-- ----------------------------
CREATE TABLE `rainy_biz_fiscal_year` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='会计年度';

-- ----------------------------
-- 47、物料税务模板表
-- ----------------------------
CREATE TABLE `rainy_biz_item_tax_template` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='物料税务模板';

-- ----------------------------
-- 48、付款方式表
-- ----------------------------
CREATE TABLE `rainy_biz_mode_of_payment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='付款方式';

-- ----------------------------
-- 49、付款条款表
-- ----------------------------
CREATE TABLE `rainy_biz_payment_term` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `payment_term_name` varchar(255) NOT NULL DEFAULT '' COMMENT '付款条款名称',
  `mode_of_payment` varchar(140) NOT NULL DEFAULT '' COMMENT '付款方式',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='付款条款';

-- ----------------------------
-- 50、付款条款模板表
-- ----------------------------
CREATE TABLE `rainy_biz_payment_terms_template` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='付款条款模板';

-- ----------------------------
-- 51、POS发票表
-- ----------------------------
CREATE TABLE `rainy_biz_pos_invoice` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `customer_name` varchar(255) NOT NULL DEFAULT '' COMMENT '客户名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `customer` varchar(140) NOT NULL DEFAULT '' COMMENT '客户',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `payment_terms_template` varchar(140) NOT NULL DEFAULT '' COMMENT '付款条款模板',
  `tax_category` varchar(140) NOT NULL DEFAULT '' COMMENT '税务类别',
  `shipping_rule` varchar(140) NOT NULL DEFAULT '' COMMENT '运输规则',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `grand_total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '含税总计',
  `total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '总计',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='POS发票';

-- ----------------------------
-- 52、POS配置表
-- ----------------------------
CREATE TABLE `rainy_biz_pos_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `customer` varchar(140) NOT NULL DEFAULT '' COMMENT '客户',
  `warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '仓库',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `tax_category` varchar(140) NOT NULL DEFAULT '' COMMENT '税务类别',
  `selling_price_list` varchar(140) NOT NULL DEFAULT '' COMMENT '销售价格表',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='POS配置';

-- ----------------------------
-- 53、定价规则表
-- ----------------------------
CREATE TABLE `rainy_biz_pricing_rule` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `customer` varchar(140) NOT NULL DEFAULT '' COMMENT '客户',
  `supplier` varchar(140) NOT NULL DEFAULT '' COMMENT '供应商',
  `warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '仓库',
  `other_item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '其他物料编码',
  `other_item_group` varchar(140) NOT NULL DEFAULT '' COMMENT '其他物料组',
  `other_brand` varchar(140) NOT NULL DEFAULT '' COMMENT '其他品牌',
  `rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '单价/折扣率',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定价规则';

-- ----------------------------
-- 54、采购发票表
-- ----------------------------
CREATE TABLE `rainy_biz_purchase_invoice` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `supplier_name` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `supplier` varchar(140) NOT NULL DEFAULT '' COMMENT '供应商',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `payment_terms_template` varchar(140) NOT NULL DEFAULT '' COMMENT '付款条款模板',
  `tax_category` varchar(140) NOT NULL DEFAULT '' COMMENT '税务类别',
  `shipping_rule` varchar(140) NOT NULL DEFAULT '' COMMENT '运输规则',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `grand_total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '含税总计',
  `total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '总计',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='采购发票';

-- ----------------------------
-- 55、采购税费模板表
-- ----------------------------
CREATE TABLE `rainy_biz_purchase_taxes_and_charges_template` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `tax_category` varchar(140) NOT NULL DEFAULT '' COMMENT '税务类别',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='采购税费模板';

-- ----------------------------
-- 56、销售发票表
-- ----------------------------
CREATE TABLE `rainy_biz_sales_invoice` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `customer_name` varchar(255) NOT NULL DEFAULT '' COMMENT '客户名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `customer` varchar(140) NOT NULL DEFAULT '' COMMENT '客户',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `payment_terms_template` varchar(140) NOT NULL DEFAULT '' COMMENT '付款条款模板',
  `tax_category` varchar(140) NOT NULL DEFAULT '' COMMENT '税务类别',
  `shipping_rule` varchar(140) NOT NULL DEFAULT '' COMMENT '运输规则',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `grand_total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '含税总计',
  `total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '总计',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='销售发票';

-- ----------------------------
-- 57、销售税费模板表
-- ----------------------------
CREATE TABLE `rainy_biz_sales_taxes_and_charges_template` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `tax_category` varchar(140) NOT NULL DEFAULT '' COMMENT '税务类别',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='销售税费模板';

-- ----------------------------
-- 58、运输规则表
-- ----------------------------
CREATE TABLE `rainy_biz_shipping_rule` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `account` varchar(140) NOT NULL DEFAULT '' COMMENT '科目',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='运输规则';

-- ----------------------------
-- 59、税务类别表
-- ----------------------------
CREATE TABLE `rainy_biz_tax_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='税务类别';

-- ----------------------------
-- 60、预扣税类别表
-- ----------------------------
CREATE TABLE `rainy_biz_tax_withholding_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='预扣税类别';

-- ----------------------------
-- 61、预算科目行表
-- ----------------------------
CREATE TABLE `rainy_biz_budget_account` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `account` varchar(140) NOT NULL DEFAULT '' COMMENT '科目',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='预算科目行';

-- ----------------------------
-- 62、定价规则明细表
-- ----------------------------
CREATE TABLE `rainy_biz_pricing_rule_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `pricing_rule` varchar(140) NOT NULL DEFAULT '' COMMENT '定价规则',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定价规则明细';

-- ----------------------------
-- 63、采购发票行表
-- ----------------------------
CREATE TABLE `rainy_biz_purchase_invoice_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `item_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物料名称',
  `warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '仓库',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `purchase_order` varchar(140) NOT NULL DEFAULT '' COMMENT '采购订单',
  `purchase_receipt` varchar(140) NOT NULL DEFAULT '' COMMENT '采购收货单',
  `item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '物料编码',
  `stock_uom` varchar(140) NOT NULL DEFAULT '' COMMENT '库存单位',
  `valuation_rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '评估单价',
  `qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '数量',
  `rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '单价',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='采购发票行';

-- ----------------------------
-- 64、采购税费表
-- ----------------------------
CREATE TABLE `rainy_biz_purchase_taxes_and_charges` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `account_head` varchar(140) NOT NULL DEFAULT '' COMMENT '税目科目',
  `total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '总计',
  `rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '税率',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='采购税费';

-- ----------------------------
-- 65、销售发票行表
-- ----------------------------
CREATE TABLE `rainy_biz_sales_invoice_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `item_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物料名称',
  `warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '仓库',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `sales_order` varchar(140) NOT NULL DEFAULT '' COMMENT '销售订单',
  `purchase_order` varchar(140) NOT NULL DEFAULT '' COMMENT '采购订单',
  `delivery_note` varchar(140) NOT NULL DEFAULT '' COMMENT '送货单',
  `asset` varchar(140) NOT NULL DEFAULT '' COMMENT '资产',
  `actual_qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '实际数量',
  `qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '数量',
  `rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '单价',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='销售发票行';

-- ----------------------------
-- 66、销售税费表
-- ----------------------------
CREATE TABLE `rainy_biz_sales_taxes_and_charges` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `account_head` varchar(140) NOT NULL DEFAULT '' COMMENT '税目科目',
  `total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '总计',
  `rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '税率',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='销售税费';

-- ============================================================
-- 五、销售流程域 Selling (6 表)
-- ============================================================

-- ----------------------------
-- 67、客户表
-- ----------------------------
CREATE TABLE `rainy_biz_customer` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '客户编码',
  `customer_name` varchar(255) NOT NULL DEFAULT '' COMMENT '客户名称',
  `tax_category` varchar(140) NOT NULL DEFAULT '' COMMENT '税务类别',
  `default_bank_account` varchar(140) NOT NULL DEFAULT '' COMMENT '默认银行账户',
  `lead_name` varchar(140) NOT NULL DEFAULT '' COMMENT '来源线索',
  `customer_group` varchar(140) NOT NULL DEFAULT '' COMMENT '客户组',
  `territory` varchar(140) NOT NULL DEFAULT '' COMMENT '地区',
  `represents_company` varchar(140) NOT NULL DEFAULT '' COMMENT '代表公司',
  `default_price_list` varchar(140) NOT NULL DEFAULT '' COMMENT '默认价格表',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='客户';

-- ----------------------------
-- 68、产品组合表
-- ----------------------------
CREATE TABLE `rainy_biz_product_bundle` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `new_item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '新产品编码',
  `amended_from` varchar(140) NOT NULL DEFAULT '' COMMENT '修订自',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='产品组合';

-- ----------------------------
-- 69、报价单表
-- ----------------------------
CREATE TABLE `rainy_biz_quotation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `customer_name` varchar(255) NOT NULL DEFAULT '' COMMENT '客户名称',
  `party_name` varchar(140) NOT NULL DEFAULT '' COMMENT '交易方名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `payment_terms_template` varchar(140) NOT NULL DEFAULT '' COMMENT '付款条款模板',
  `tax_category` varchar(140) NOT NULL DEFAULT '' COMMENT '税务类别',
  `shipping_rule` varchar(140) NOT NULL DEFAULT '' COMMENT '运输规则',
  `amended_from` varchar(140) NOT NULL DEFAULT '' COMMENT '修订自',
  `customer_group` varchar(140) NOT NULL DEFAULT '' COMMENT '客户组',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `grand_total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '含税总计',
  `total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '总计',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='报价单';

-- ----------------------------
-- 70、销售订单表
-- ----------------------------
CREATE TABLE `rainy_biz_sales_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `customer_name` varchar(255) NOT NULL DEFAULT '' COMMENT '客户名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `customer` varchar(140) NOT NULL DEFAULT '' COMMENT '客户',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `payment_terms_template` varchar(140) NOT NULL DEFAULT '' COMMENT '付款条款模板',
  `tax_category` varchar(140) NOT NULL DEFAULT '' COMMENT '税务类别',
  `shipping_rule` varchar(140) NOT NULL DEFAULT '' COMMENT '运输规则',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `grand_total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '含税总计',
  `total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '总计',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='销售订单';

-- ----------------------------
-- 71、报价单行表
-- ----------------------------
CREATE TABLE `rainy_biz_quotation_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `item_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物料名称',
  `prevdoc_docname` varchar(140) NOT NULL DEFAULT '' COMMENT '前置单据编号',
  `warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '仓库',
  `item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '物料编码',
  `product_bundle` varchar(140) NOT NULL DEFAULT '' COMMENT '产品组合',
  `stock_uom` varchar(140) NOT NULL DEFAULT '' COMMENT '库存单位',
  `uom` varchar(140) NOT NULL DEFAULT '' COMMENT '计量单位',
  `weight_uom` varchar(140) NOT NULL DEFAULT '' COMMENT '重量单位',
  `valuation_rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '评估单价',
  `actual_qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '实际数量',
  `qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '数量',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='报价单行';

-- ----------------------------
-- 72、销售订单行表
-- ----------------------------
CREATE TABLE `rainy_biz_sales_order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `item_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物料名称',
  `supplier` varchar(140) NOT NULL DEFAULT '' COMMENT '供应商',
  `warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '仓库',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `purchase_order` varchar(140) NOT NULL DEFAULT '' COMMENT '采购订单',
  `item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '物料编码',
  `product_bundle` varchar(140) NOT NULL DEFAULT '' COMMENT '产品组合',
  `valuation_rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '评估单价',
  `actual_qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '实际数量',
  `transaction_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '交易日期',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='销售订单行';

-- ============================================================
-- 六、采购流程域 Buying (4 表)
-- ============================================================

-- ----------------------------
-- 73、采购订单表
-- ----------------------------
CREATE TABLE `rainy_biz_purchase_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `supplier_name` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `customer` varchar(140) NOT NULL DEFAULT '' COMMENT '客户',
  `supplier` varchar(140) NOT NULL DEFAULT '' COMMENT '供应商',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `payment_terms_template` varchar(140) NOT NULL DEFAULT '' COMMENT '付款条款模板',
  `tax_category` varchar(140) NOT NULL DEFAULT '' COMMENT '税务类别',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `grand_total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '含税总计',
  `total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '总计',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='采购订单';

-- ----------------------------
-- 74、供应商表
-- ----------------------------
CREATE TABLE `rainy_biz_supplier` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '供应商编码',
  `supplier_name` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `tax_category` varchar(140) NOT NULL DEFAULT '' COMMENT '税务类别',
  `default_bank_account` varchar(140) NOT NULL DEFAULT '' COMMENT '默认银行账户',
  `tax_withholding_category` varchar(140) NOT NULL DEFAULT '' COMMENT '预扣税类别',
  `represents_company` varchar(140) NOT NULL DEFAULT '' COMMENT '代表公司',
  `supplier_group` varchar(140) NOT NULL DEFAULT '' COMMENT '供应商组',
  `default_price_list` varchar(140) NOT NULL DEFAULT '' COMMENT '默认价格表',
  `payment_terms` varchar(140) NOT NULL DEFAULT '' COMMENT '付款条款',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='供应商';

-- ----------------------------
-- 75、供应商报价表
-- ----------------------------
CREATE TABLE `rainy_biz_supplier_quotation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `supplier_name` varchar(255) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `supplier` varchar(140) NOT NULL DEFAULT '' COMMENT '供应商',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `tax_category` varchar(140) NOT NULL DEFAULT '' COMMENT '税务类别',
  `shipping_rule` varchar(140) NOT NULL DEFAULT '' COMMENT '运输规则',
  `amended_from` varchar(140) NOT NULL DEFAULT '' COMMENT '修订自',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `grand_total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '含税总计',
  `total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '总计',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='供应商报价';

-- ----------------------------
-- 76、采购订单行表
-- ----------------------------
CREATE TABLE `rainy_biz_purchase_order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `item_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物料名称',
  `warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '仓库',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `bom` varchar(140) NOT NULL DEFAULT '' COMMENT '物料清单',
  `sales_order` varchar(140) NOT NULL DEFAULT '' COMMENT '销售订单',
  `item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '物料编码',
  `stock_uom` varchar(140) NOT NULL DEFAULT '' COMMENT '库存单位',
  `actual_qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '实际数量',
  `qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '数量',
  `rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '单价',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='采购订单行';

-- ============================================================
-- 七、项目/资产/支持域 Projects (4 表)
-- ============================================================

-- ----------------------------
-- 77、活动类型表
-- ----------------------------
CREATE TABLE `rainy_biz_activity_type` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='活动类型';

-- ----------------------------
-- 78、工单表
-- ----------------------------
CREATE TABLE `rainy_biz_issue` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `subject` varchar(255) NOT NULL DEFAULT '' COMMENT '主题',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `customer` varchar(140) NOT NULL DEFAULT '' COMMENT '客户',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `lead` varchar(140) NOT NULL DEFAULT '' COMMENT '线索',
  `issue_split_from` varchar(140) NOT NULL DEFAULT '' COMMENT '拆分自工单',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工单';

-- ----------------------------
-- 79、项目表
-- ----------------------------
CREATE TABLE `rainy_biz_project` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '项目编码',
  `project_name` varchar(255) NOT NULL DEFAULT '' COMMENT '项目名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `customer` varchar(140) NOT NULL DEFAULT '' COMMENT '客户',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `sales_order` varchar(140) NOT NULL DEFAULT '' COMMENT '销售订单',
  `department` varchar(140) NOT NULL DEFAULT '' COMMENT '部门',
  `holiday_list` varchar(140) NOT NULL DEFAULT '' COMMENT '假日列表',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='项目';

-- ----------------------------
-- 80、任务表
-- ----------------------------
CREATE TABLE `rainy_biz_task` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '任务编号',
  `subject` varchar(255) NOT NULL DEFAULT '' COMMENT '主题',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `issue` varchar(140) NOT NULL DEFAULT '' COMMENT '工单',
  `parent_task` varchar(140) NOT NULL DEFAULT '' COMMENT '父任务',
  `department` varchar(140) NOT NULL DEFAULT '' COMMENT '部门',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `is_group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否分组',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务';

-- ============================================================
-- 八、制造域 Manufacturing (11 表)
-- ============================================================

-- ----------------------------
-- 81、物料清单表
-- ----------------------------
CREATE TABLE `rainy_biz_bom` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '物料清单编号',
  `item_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物料名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `item` varchar(140) NOT NULL DEFAULT '' COMMENT '物料',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `uom` varchar(140) NOT NULL DEFAULT '' COMMENT '计量单位',
  `quality_inspection_template` varchar(140) NOT NULL DEFAULT '' COMMENT '质量检验模板',
  `buying_price_list` varchar(140) NOT NULL DEFAULT '' COMMENT '采购价格表',
  `routing` varchar(140) NOT NULL DEFAULT '' COMMENT '工艺路线',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='物料清单';

-- ----------------------------
-- 82、作业卡表
-- ----------------------------
CREATE TABLE `rainy_biz_job_card` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `work_order` varchar(140) NOT NULL DEFAULT '' COMMENT '生产工单',
  `bom_no` varchar(140) NOT NULL DEFAULT '' COMMENT '物料清单编号',
  `workstation` varchar(140) NOT NULL DEFAULT '' COMMENT '工作中心',
  `operation` varchar(140) NOT NULL DEFAULT '' COMMENT '工序',
  `stock_uom` varchar(140) NOT NULL DEFAULT '' COMMENT '库存单位',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `posting_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过账日期',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='作业卡';

-- ----------------------------
-- 83、工序表
-- ----------------------------
CREATE TABLE `rainy_biz_operation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '工序编号',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `workstation` varchar(140) NOT NULL DEFAULT '' COMMENT '工作中心',
  `quality_inspection_template` varchar(140) NOT NULL DEFAULT '' COMMENT '质量检验模板',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工序';

-- ----------------------------
-- 84、生产计划表
-- ----------------------------
CREATE TABLE `rainy_biz_production_plan` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `customer` varchar(140) NOT NULL DEFAULT '' COMMENT '客户',
  `warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '仓库',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '物料编码',
  `amended_from` varchar(140) NOT NULL DEFAULT '' COMMENT '修订自',
  `for_warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '目标仓库',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `posting_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过账日期',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='生产计划';

-- ----------------------------
-- 85、工艺路线表
-- ----------------------------
CREATE TABLE `rainy_biz_routing` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `routing_name` varchar(255) NOT NULL DEFAULT '' COMMENT '工艺路线名称',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工艺路线';

-- ----------------------------
-- 86、生产工单表
-- ----------------------------
CREATE TABLE `rainy_biz_work_order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `item_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物料名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `sales_order` varchar(140) NOT NULL DEFAULT '' COMMENT '销售订单',
  `production_item` varchar(140) NOT NULL DEFAULT '' COMMENT '生产物料',
  `bom_no` varchar(140) NOT NULL DEFAULT '' COMMENT '物料清单编号',
  `wip_warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '在制仓库',
  `fg_warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '成品仓库',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '数量',
  `has_serial_no` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有序列号',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='生产工单';

-- ----------------------------
-- 87、工作中心表
-- ----------------------------
CREATE TABLE `rainy_biz_workstation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '工作中心编码',
  `workstation_name` varchar(255) NOT NULL DEFAULT '' COMMENT '工作中心名称',
  `warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '仓库',
  `holiday_list` varchar(140) NOT NULL DEFAULT '' COMMENT '假日列表',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工作中心';

-- ----------------------------
-- 88、BOM物料行表
-- ----------------------------
CREATE TABLE `rainy_biz_bom_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `item_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物料名称',
  `item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '物料编码',
  `operation` varchar(140) NOT NULL DEFAULT '' COMMENT '工序',
  `bom_no` varchar(140) NOT NULL DEFAULT '' COMMENT '物料清单编号',
  `source_warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '源仓库',
  `uom` varchar(140) NOT NULL DEFAULT '' COMMENT '计量单位',
  `stock_uom` varchar(140) NOT NULL DEFAULT '' COMMENT '库存单位',
  `original_item` varchar(140) NOT NULL DEFAULT '' COMMENT '原始物料',
  `is_stock_item` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否库存物料',
  `qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '数量',
  `rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '单价',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='BOM物料行';

-- ----------------------------
-- 89、BOM工序行表
-- ----------------------------
CREATE TABLE `rainy_biz_bom_operation` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `operation` varchar(140) NOT NULL DEFAULT '' COMMENT '工序',
  `workstation` varchar(140) NOT NULL DEFAULT '' COMMENT '工作中心',
  `finished_good` varchar(140) NOT NULL DEFAULT '' COMMENT '成品',
  `bom_no` varchar(140) NOT NULL DEFAULT '' COMMENT '物料清单编号',
  `wip_warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '在制仓库',
  `fg_warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '成品仓库',
  `source_warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '源仓库',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='BOM工序行';

-- ----------------------------
-- 90、作业卡物料表
-- ----------------------------
CREATE TABLE `rainy_biz_job_card_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `item_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物料名称',
  `item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '物料编码',
  `source_warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '源仓库',
  `uom` varchar(140) NOT NULL DEFAULT '' COMMENT '计量单位',
  `item_group` varchar(140) NOT NULL DEFAULT '' COMMENT '物料组',
  `stock_uom` varchar(140) NOT NULL DEFAULT '' COMMENT '库存单位',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='作业卡物料';

-- ----------------------------
-- 91、工单物料行表
-- ----------------------------
CREATE TABLE `rainy_biz_work_order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `item_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物料名称',
  `operation` varchar(140) NOT NULL DEFAULT '' COMMENT '工序',
  `item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '物料编码',
  `source_warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '源仓库',
  `stock_uom` varchar(140) NOT NULL DEFAULT '' COMMENT '库存单位',
  `rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '单价',
  `amount` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '金额',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工单物料行';

-- ============================================================
-- 九、收付款与总账域 Payments/GL (9 表)
-- ============================================================

-- ----------------------------
-- 92、日记账凭证表
-- ----------------------------
CREATE TABLE `rainy_biz_journal_entry` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `stock_entry` varchar(140) NOT NULL DEFAULT '' COMMENT '库存调拨单',
  `finance_book` varchar(140) NOT NULL DEFAULT '' COMMENT '财务账簿',
  `inter_company_journal_entry` varchar(140) NOT NULL DEFAULT '' COMMENT '关联公司凭证',
  `mode_of_payment` varchar(140) NOT NULL DEFAULT '' COMMENT '付款方式',
  `amended_from` varchar(140) NOT NULL DEFAULT '' COMMENT '修订自',
  `tax_withholding_category` varchar(140) NOT NULL DEFAULT '' COMMENT '预扣税类别',
  `total_debit` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '借方合计',
  `total_credit` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '贷方合计',
  `posting_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过账日期',
  `due_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '到期日期',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日记账凭证';

-- ----------------------------
-- 93、付款单表
-- ----------------------------
CREATE TABLE `rainy_biz_payment_entry` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `party` varchar(140) NOT NULL DEFAULT '' COMMENT '交易方',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `paid_from` varchar(140) NOT NULL DEFAULT '' COMMENT '付款账户',
  `paid_to` varchar(140) NOT NULL DEFAULT '' COMMENT '收款账户',
  `mode_of_payment` varchar(140) NOT NULL DEFAULT '' COMMENT '付款方式',
  `amended_from` varchar(140) NOT NULL DEFAULT '' COMMENT '修订自',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `paid_amount` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '已付金额',
  `posting_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过账日期',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='付款单';

-- ----------------------------
-- 94、付款申请表
-- ----------------------------
CREATE TABLE `rainy_biz_payment_request` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `subject` varchar(255) NOT NULL DEFAULT '' COMMENT '主题',
  `party` varchar(140) NOT NULL DEFAULT '' COMMENT '交易方',
  `reference_name` varchar(140) NOT NULL DEFAULT '' COMMENT '关联单据编号',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `mode_of_payment` varchar(140) NOT NULL DEFAULT '' COMMENT '付款方式',
  `bank_account` varchar(140) NOT NULL DEFAULT '' COMMENT '银行账户',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `grand_total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '含税总计',
  `outstanding_amount` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '未清金额',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='付款申请';

-- ----------------------------
-- 95、期间结转凭证表
-- ----------------------------
CREATE TABLE `rainy_biz_period_closing_voucher` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `fiscal_year` varchar(140) NOT NULL DEFAULT '' COMMENT '会计年度',
  `amended_from` varchar(140) NOT NULL DEFAULT '' COMMENT '修订自',
  `closing_account_head` varchar(140) NOT NULL DEFAULT '' COMMENT '结转科目',
  `transaction_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '交易日期',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='期间结转凭证';

-- ----------------------------
-- 96、预付款税费表
-- ----------------------------
CREATE TABLE `rainy_biz_advance_taxes_and_charges` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `account_head` varchar(140) NOT NULL DEFAULT '' COMMENT '税目科目',
  `total` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '总计',
  `rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '税率',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='预付款税费';

-- ----------------------------
-- 97、凭证行表
-- ----------------------------
CREATE TABLE `rainy_biz_journal_entry_account` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `party` varchar(140) NOT NULL DEFAULT '' COMMENT '交易方',
  `reference_name` varchar(140) NOT NULL DEFAULT '' COMMENT '关联单据编号',
  `account` varchar(140) NOT NULL DEFAULT '' COMMENT '科目',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `bank_account` varchar(140) NOT NULL DEFAULT '' COMMENT '银行账户',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='凭证行';

-- ----------------------------
-- 98、付款扣款行表
-- ----------------------------
CREATE TABLE `rainy_biz_payment_entry_deduction` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '描述',
  `account` varchar(140) NOT NULL DEFAULT '' COMMENT '科目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `amount` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '金额',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='付款扣款行';

-- ----------------------------
-- 99、付款核销行表
-- ----------------------------
CREATE TABLE `rainy_biz_payment_entry_reference` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `reference_name` varchar(140) NOT NULL DEFAULT '' COMMENT '关联单据编号',
  `advance_voucher_no` varchar(140) NOT NULL DEFAULT '' COMMENT '预付凭证编号',
  `account` varchar(140) NOT NULL DEFAULT '' COMMENT '科目',
  `payment_term` varchar(140) NOT NULL DEFAULT '' COMMENT '付款条款',
  `payment_request` varchar(140) NOT NULL DEFAULT '' COMMENT '付款申请',
  `outstanding_amount` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '未清金额',
  `due_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '到期日期',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='付款核销行';

-- ----------------------------
-- 100、预扣税分录表
-- ----------------------------
CREATE TABLE `rainy_biz_tax_withholding_entry` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `party` varchar(140) NOT NULL DEFAULT '' COMMENT '交易方',
  `withholding_name` varchar(140) NOT NULL DEFAULT '' COMMENT '预扣税名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `tax_withholding_category` varchar(140) NOT NULL DEFAULT '' COMMENT '预扣税类别',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='预扣税分录';

-- ============================================================
-- 十、资产管理域 Assets (9 表)
-- ============================================================

-- ----------------------------
-- 101、资产表
-- ----------------------------
CREATE TABLE `rainy_biz_asset` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '资产编码',
  `asset_name` varchar(255) NOT NULL DEFAULT '' COMMENT '资产名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `customer` varchar(140) NOT NULL DEFAULT '' COMMENT '客户',
  `supplier` varchar(140) NOT NULL DEFAULT '' COMMENT '供应商',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `purchase_receipt` varchar(140) NOT NULL DEFAULT '' COMMENT '采购收货单',
  `purchase_invoice` varchar(140) NOT NULL DEFAULT '' COMMENT '采购发票',
  `item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '物料编码',
  `status` varchar(20) NOT NULL DEFAULT 'Draft' COMMENT '状态',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='资产';

-- ----------------------------
-- 102、资产类别表
-- ----------------------------
CREATE TABLE `rainy_biz_asset_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '名称',
  `asset_category_name` varchar(255) NOT NULL DEFAULT '' COMMENT '资产类别名称',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='资产类别';

-- ----------------------------
-- 103、资产转移表
-- ----------------------------
CREATE TABLE `rainy_biz_asset_movement` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `reference_name` varchar(140) NOT NULL DEFAULT '' COMMENT '关联单据编号',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `amended_from` varchar(140) NOT NULL DEFAULT '' COMMENT '修订自',
  `transaction_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '交易日期',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='资产转移';

-- ----------------------------
-- 104、资产维修表
-- ----------------------------
CREATE TABLE `rainy_biz_asset_repair` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `asset` varchar(140) NOT NULL DEFAULT '' COMMENT '资产',
  `amended_from` varchar(140) NOT NULL DEFAULT '' COMMENT '修订自',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='资产维修';

-- ----------------------------
-- 105、资产价值调整表
-- ----------------------------
CREATE TABLE `rainy_biz_asset_value_adjustment` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '单据编号',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `asset` varchar(140) NOT NULL DEFAULT '' COMMENT '资产',
  `finance_book` varchar(140) NOT NULL DEFAULT '' COMMENT '财务账簿',
  `journal_entry` varchar(140) NOT NULL DEFAULT '' COMMENT '日记账凭证',
  `amended_from` varchar(140) NOT NULL DEFAULT '' COMMENT '修订自',
  `difference_account` varchar(140) NOT NULL DEFAULT '' COMMENT '差异科目',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='资产价值调整';

-- ----------------------------
-- 106、位置表
-- ----------------------------
CREATE TABLE `rainy_biz_location` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '位置编码',
  `location_name` varchar(255) NOT NULL DEFAULT '' COMMENT '位置名称',
  `parent_location` varchar(140) NOT NULL DEFAULT '' COMMENT '父位置',
  `area_uom` varchar(140) NOT NULL DEFAULT '' COMMENT '面积单位',
  `is_group` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否分组',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='位置';

-- ----------------------------
-- 107、资产转移行表
-- ----------------------------
CREATE TABLE `rainy_biz_asset_movement_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `asset_name` varchar(255) NOT NULL DEFAULT '' COMMENT '资产名称',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `asset` varchar(140) NOT NULL DEFAULT '' COMMENT '资产',
  `source_location` varchar(140) NOT NULL DEFAULT '' COMMENT '源位置',
  `target_location` varchar(140) NOT NULL DEFAULT '' COMMENT '目标位置',
  `from_employee` varchar(140) NOT NULL DEFAULT '' COMMENT '转出员工',
  `to_employee` varchar(140) NOT NULL DEFAULT '' COMMENT '转入员工',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='资产转移行';

-- ----------------------------
-- 108、维修消耗物料表
-- ----------------------------
CREATE TABLE `rainy_biz_asset_repair_consumed_item` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '仓库',
  `item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '物料编码',
  `serial_and_batch_bundle` varchar(140) NOT NULL DEFAULT '' COMMENT '序列号批次束',
  `valuation_rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '评估单价',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='维修消耗物料';

-- ----------------------------
-- 109、折旧计划表
-- ----------------------------
CREATE TABLE `rainy_biz_depreciation_schedule` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '行编号',
  `journal_entry` varchar(140) NOT NULL DEFAULT '' COMMENT '日记账凭证',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='折旧计划';

-- ============================================================
-- 十一、台账辅助域 Ledgers (3 表)
-- ============================================================

-- ----------------------------
-- 110、库存余额表
-- ----------------------------
CREATE TABLE `rainy_biz_bin` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '编号',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '仓库',
  `item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '物料编码',
  `stock_uom` varchar(140) NOT NULL DEFAULT '' COMMENT '库存单位',
  `valuation_rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '评估单价',
  `actual_qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '实际数量',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='库存余额';

-- ----------------------------
-- 111、总账分录表
-- ----------------------------
CREATE TABLE `rainy_biz_gl_entry` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '分录编号',
  `party` varchar(140) NOT NULL DEFAULT '' COMMENT '交易方',
  `against_voucher` varchar(140) NOT NULL DEFAULT '' COMMENT '对应凭证',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `account` varchar(140) NOT NULL DEFAULT '' COMMENT '科目',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `cost_center` varchar(140) NOT NULL DEFAULT '' COMMENT '成本中心',
  `fiscal_year` varchar(140) NOT NULL DEFAULT '' COMMENT '会计年度',
  `finance_book` varchar(140) NOT NULL DEFAULT '' COMMENT '财务账簿',
  `transaction_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '交易日期',
  `posting_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过账日期',
  `due_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '到期日期',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='总账分录';

-- ----------------------------
-- 112、库存台账分录表
-- ----------------------------
CREATE TABLE `rainy_biz_stock_ledger_entry` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(140) NOT NULL DEFAULT '' COMMENT '分录编号',
  `voucher_no` varchar(140) NOT NULL DEFAULT '' COMMENT '关联凭证编号',
  `company` varchar(140) NOT NULL DEFAULT '' COMMENT '公司',
  `warehouse` varchar(140) NOT NULL DEFAULT '' COMMENT '仓库',
  `project` varchar(140) NOT NULL DEFAULT '' COMMENT '项目',
  `item_code` varchar(140) NOT NULL DEFAULT '' COMMENT '物料编码',
  `stock_uom` varchar(140) NOT NULL DEFAULT '' COMMENT '库存单位',
  `serial_and_batch_bundle` varchar(140) NOT NULL DEFAULT '' COMMENT '序列号批次束',
  `valuation_rate` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '评估单价',
  `actual_qty` decimal(18,6) NOT NULL DEFAULT '0' COMMENT '实际数量',
  `posting_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过账日期',
  `has_serial_no` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有序列号',
  `version` int NOT NULL DEFAULT '0' COMMENT '版本',
  `create_dept` bigint NOT NULL DEFAULT '0' COMMENT '部门id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` bigint NOT NULL DEFAULT '0' COMMENT '更新人',
  `del_flag` int NOT NULL DEFAULT '0' COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2087538355158339587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='库存台账分录';

SET FOREIGN_KEY_CHECKS = 1;
