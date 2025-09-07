# dm_tools
ALTER TABLE `tbl_product` ADD `is_serial` ENUM('yes','no') NOT NULL DEFAULT 'no' AFTER `Product_branchid`;
ALTER TABLE `tbl_product` ADD `is_old` ENUM('yes','no') NOT NULL DEFAULT 'no' AFTER `Product_branchid`;



CREATE TABLE `bdsoftte_fa`.`tbl_serial` (`serialId` INT NOT NULL AUTO_INCREMENT , `product_id` INT NOT NULL DEFAULT '0' , `serial_no` VARCHAR(200) NULL DEFAULT NULL , `is_purchase` ENUM('yes','no') NOT NULL DEFAULT 'no' , `purchase_details_id` INT NULL DEFAULT NULL , `is_return` ENUM('yes','no') NOT NULL DEFAULT 'no' , `purchase_return_details_id` INT NULL DEFAULT NULL , `is_sale` ENUM('yes','no') NOT NULL DEFAULT 'no' , `sale_details_id` INT NULL DEFAULT NULL , `is_sale_return` ENUM('yes','no') NOT NULL DEFAULT 'no' , `sale_return_details_id` INT NULL DEFAULT NULL , `is_damage` ENUM('yes','no') NOT NULL DEFAULT 'no' , `damage_details_id` INT NULL DEFAULT NULL , PRIMARY KEY (`serialId`)) ENGINE = MyISAM;
