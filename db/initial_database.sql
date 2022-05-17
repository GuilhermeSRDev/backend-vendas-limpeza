CREATE SCHEMA `databasevendaslimpeza`;
use databasevendaslimpeza;

CREATE TABLE `sales` (
  `id_sale` VARCHAR(255) NOT NULL AUTO_INCREMENT,
  `sale_datetime` DATETIME NOT NULL DEFAULT current_timestamp(),
  `total_value` DECIMAL(15,2) NOT NULL,
  `status` CHAR(1) NOT NULL,
  PRIMARY KEY (`id_sale`));
  
CREATE TABLE `products` (
  `id_product` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(255) NOT NULL,
  `value` DECIMAL(15,2) NOT NULL,
  PRIMARY KEY (`id_product`));

CREATE TABLE `salesitems` (
  `id_sales_items` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_sale` VARCHAR(255) NOT NULL,
  `id_product` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id_sales_items`),
  INDEX `fk_idSales_idx` (`id_sale` ASC),
  INDEX `fk_idProduct_idx` (`id_product` ASC),
  CONSTRAINT `fk_idSales`
    FOREIGN KEY (`id_sale`)
    REFERENCES `sales` (`id_sale`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idProduct`
    FOREIGN KEY (`id_product`)
    REFERENCES `products` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE `salesitems`
ADD COLUMN `quantity` INT UNSIGNED NOT NULL AFTER `id_product`,
ADD COLUMN `amount` DECIMAL(15,2) UNSIGNED NOT NULL AFTER `quantity`;

UPDATE `databasevendaslimpeza`.`salesitems` SET `quantity` = '2' WHERE (`id_sales_items` = '1');
DELETE FROM `databasevendaslimpeza`.`salesitems` WHERE (`id_sales_items` = '2');
UPDATE `databasevendaslimpeza`.`salesitems` SET `quantity` = '3' WHERE (`id_sales_items` = '3');
DELETE FROM `databasevendaslimpeza`.`salesitems` WHERE (`id_sales_items` = '4');
DELETE FROM `databasevendaslimpeza`.`salesitems` WHERE (`id_sales_items` = '5');
UPDATE `databasevendaslimpeza`.`salesitems` SET `quantity` = '2' WHERE (`id_sales_items` = '7');
UPDATE `databasevendaslimpeza`.`salesitems` SET `quantity` = '1' WHERE (`id_sales_items` = '9');
DELETE FROM `databasevendaslimpeza`.`salesitems` WHERE (`id_sales_items` = '8');
UPDATE `databasevendaslimpeza`.`salesitems` SET `quantity` = '1' WHERE (`id_sales_items` = '10');

UPDATE `databasevendaslimpeza`.`salesitems` SET `amount` = '13' WHERE (`id_sales_items` = '1');
UPDATE `databasevendaslimpeza`.`salesitems` SET `amount` = '45' WHERE (`id_sales_items` = '3');
UPDATE `databasevendaslimpeza`.`salesitems` SET `amount` = '16' WHERE (`id_sales_items` = '7');
UPDATE `databasevendaslimpeza`.`salesitems` SET `amount` = '2' WHERE (`id_sales_items` = '9');
UPDATE `databasevendaslimpeza`.`salesitems` SET `amount` = '2.5' WHERE (`id_sales_items` = '10');

ALTER TABLE `salesitems` 
DROP COLUMN `quantidade`,
DROP COLUMN `valorTotal`,
DROP COLUMN `valorUnit`;

INSERT INTO products (product_name, `value`) 
VALUES 
	("Álcool 70 1L", 8), 
    ("Detergente 500ml", 2), 
    ("Sabão Neutro 100g", 2.50), 
    ("Limpador Multiuso 500ml", 3.50), 
    ("Limpa Vidros 500ml", 6.50), 
    ("Desinfetante 5L", 15), 
    ("Limpa Pisos de Madeira 750ml", 15), 
    ("Tira-Limo 520g", 6), 
    ("Desengordurante 500ml", 10);

select * from sales;
select * from salesitems;
select * from products;