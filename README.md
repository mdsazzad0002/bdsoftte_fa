# dm_tools


````
CREATE TABLE `bdsoftte_fa`.`tbl_combomaster` (`ComboId` INT NOT NULL AUTO_INCREMENT , `comboInvoice` VARCHAR(150) NULL DEFAULT NULL , `total` BIGINT NOT NULL DEFAULT '0' ,  `add_by` VARCHAR(150) NULL DEFAULT NULL , `update_by` VARCHAR(150) NULL DEFAULT NULL , `add_time` TIMESTAMP NULL DEFAULT NULL , `update_time` TIMESTAMP NULL DEFAULT NULL , PRIMARY KEY (`ComboId`)) ENGINE = MyISAM;


CREATE TABLE `bdsoftte_fa`.`tbl_combom_details` (`id` INT NOT NULL AUTO_INCREMENT ,`qty` INT NOT NULL DEFAULT '0' , `combo_master_id` INT NOT NULL , `product_id` INT NOT NULL , `selling_price` FLOAT NOT NULL , `add_time` TIMESTAMP NOT NULL , PRIMARY KEY (`id`)) ENGINE = MyISAM;


ALTER TABLE `tbl_combomaster` ADD `packageName` VARCHAR(250) NULL DEFAULT NULL AFTER `update_time`;

```