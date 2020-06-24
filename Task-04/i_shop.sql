--
-- Скрипт сгенерирован Devart dbForge Studio 2019 for MySQL, Версия 8.2.23.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 24.06.2020 12:26:28
-- Версия сервера: 8.0.19
-- Версия клиента: 4.1
--

-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установить режим SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

--
-- Установка базы данных по умолчанию
--
USE i_shop;

--
-- Удалить таблицу `bucket`
--
DROP TABLE IF EXISTS bucket;

--
-- Удалить таблицу `product`
--
DROP TABLE IF EXISTS product;

--
-- Удалить таблицу `user`
--
DROP TABLE IF EXISTS user;

--
-- Установка базы данных по умолчанию
--
USE i_shop;

--
-- Создать таблицу `user`
--
CREATE TABLE user (
  id int NOT NULL AUTO_INCREMENT,
  email varchar(50) NOT NULL,
  password varchar(50) NOT NULL,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  role varchar(10) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 11,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать таблицу `product`
--
CREATE TABLE product (
  id int NOT NULL AUTO_INCREMENT,
  name varchar(50) NOT NULL,
  description varchar(255) DEFAULT NULL,
  price decimal(19, 2) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 4,
AVG_ROW_LENGTH = 8192,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать таблицу `bucket`
--
CREATE TABLE bucket (
  id int NOT NULL AUTO_INCREMENT,
  user_id int NOT NULL,
  product_id int NOT NULL,
  purchase_date timestamp NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AUTO_INCREMENT = 7,
AVG_ROW_LENGTH = 4096,
CHARACTER SET utf8,
COLLATE utf8_general_ci;

--
-- Создать внешний ключ
--
ALTER TABLE bucket
ADD CONSTRAINT product_id FOREIGN KEY (product_id)
REFERENCES product (id) ON DELETE CASCADE;

--
-- Создать внешний ключ
--
ALTER TABLE bucket
ADD CONSTRAINT user_id_FK FOREIGN KEY (user_id)
REFERENCES user (id) ON DELETE CASCADE;

-- 
-- Вывод данных для таблицы user
--
INSERT INTO user VALUES
(10, 'yunyk.v.v@gmail.com', 'password', 'Volodymyr', 'Yunyk', 'user'),
(11, '', 'password', 'Volodymyr', 'Yunyk', 'user');

-- 
-- Вывод данных для таблицы product
--
INSERT INTO product VALUES
(1, 'name', 'description', 32.00),
(2, 'name', 'description', 32.00);

-- 
-- Вывод данных для таблицы bucket
--
-- Таблица i_shop.bucket не содержит данных

-- 
-- Восстановить предыдущий режим SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;