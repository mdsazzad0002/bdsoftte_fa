# dm_tools


````
CREATE TABLE `tbl_combomaster` (`ComboId` INT NOT NULL AUTO_INCREMENT , `comboInvoice` VARCHAR(150) NULL DEFAULT NULL , `total` BIGINT NOT NULL DEFAULT '0' ,  `add_by` VARCHAR(150) NULL DEFAULT NULL , `update_by` VARCHAR(150) NULL DEFAULT NULL , `add_time` TIMESTAMP NULL DEFAULT NULL , `update_time` TIMESTAMP NULL DEFAULT NULL , PRIMARY KEY (`ComboId`)) ENGINE = MyISAM;


CREATE TABLE `tbl_combom_details` (`id` INT NOT NULL AUTO_INCREMENT ,`qty` INT NOT NULL DEFAULT '0' , `combo_master_id` INT NOT NULL , `product_id` INT NOT NULL , `selling_price` FLOAT NOT NULL , `add_time` TIMESTAMP NOT NULL , PRIMARY KEY (`id`)) ENGINE = MyISAM;


ALTER TABLE `tbl_combomaster` ADD `packageName` VARCHAR(250) NULL DEFAULT NULL AFTER `update_time`;

ALTER TABLE `tbl_combomaster` ADD `purchase_price` INT NOT NULL DEFAULT '0' AFTER `packageName`;

ALTER TABLE `tbl_combomaster` ADD `vat` INT NOT NULL DEFAULT '0' AFTER `purchase_price`;

ALTER TABLE `tbl_combomaster` ADD `stockQty` INT NOT NULL DEFAULT '0' AFTER `vat`;
ALTER TABLE `tbl_combomaster` ADD `branch_id` INT NOT NULL DEFAULT '0' AFTER `stockQty`;

ALTER TABLE `tbl_saledetails` ADD `is_package` INT NOT NULL DEFAULT '0' AFTER `SaleDetails_BranchId`;

```