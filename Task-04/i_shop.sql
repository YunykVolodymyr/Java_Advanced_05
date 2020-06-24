--
-- ������ ������������ Devart dbForge Studio 2019 for MySQL, ������ 8.2.23.0
-- �������� �������� ��������: http://www.devart.com/ru/dbforge/mysql/studio
-- ���� �������: 24.06.2020 12:26:28
-- ������ �������: 8.0.19
-- ������ �������: 4.1
--

-- 
-- ���������� ������� ������
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- ���������� ����� SQL (SQL mode)
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

--
-- ��������� ���� ������ �� ���������
--
USE i_shop;

--
-- ������� ������� `bucket`
--
DROP TABLE IF EXISTS bucket;

--
-- ������� ������� `product`
--
DROP TABLE IF EXISTS product;

--
-- ������� ������� `user`
--
DROP TABLE IF EXISTS user;

--
-- ��������� ���� ������ �� ���������
--
USE i_shop;

--
-- ������� ������� `user`
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
-- ������� ������� `product`
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
-- ������� ������� `bucket`
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
-- ������� ������� ����
--
ALTER TABLE bucket
ADD CONSTRAINT product_id FOREIGN KEY (product_id)
REFERENCES product (id) ON DELETE CASCADE;

--
-- ������� ������� ����
--
ALTER TABLE bucket
ADD CONSTRAINT user_id_FK FOREIGN KEY (user_id)
REFERENCES user (id) ON DELETE CASCADE;

-- 
-- ����� ������ ��� ������� user
--
INSERT INTO user VALUES
(10, 'yunyk.v.v@gmail.com', 'password', 'Volodymyr', 'Yunyk', 'user'),
(11, '', 'password', 'Volodymyr', 'Yunyk', 'user');

-- 
-- ����� ������ ��� ������� product
--
INSERT INTO product VALUES
(1, 'name', 'description', 32.00),
(2, 'name', 'description', 32.00);

-- 
-- ����� ������ ��� ������� bucket
--
-- ������� i_shop.bucket �� �������� ������

-- 
-- ������������ ���������� ����� SQL (SQL mode)
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- ��������� ������� ������
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;