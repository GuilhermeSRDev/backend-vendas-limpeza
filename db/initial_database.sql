CREATE SCHEMA `databasevendaslimpeza`;
use databasevendaslimpeza;

CREATE TABLE `sales` (
  `id_sale` INT UNSIGNED NOT NULL AUTO_INCREMENT,
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
  `id_sale` INT UNSIGNED NOT NULL,
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
