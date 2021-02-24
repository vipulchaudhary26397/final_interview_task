--
-- Create Database for many_to_many_task`
--
create database if not exists `many_to_many_task`;

USE `many_to_many_task`;


CREATE TABLE `order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- insert into query for table `order_product`
--

INSERT INTO `order_product` (`order_product_id`, `order_id`, `product_id`) VALUES
(1, 1, 5),
(2, 1, 1),
(3, 2, 4),
(4, 3, 1),
(5, 3, 4),
(6, 4, 5),
(7, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `order_tbl`
--

CREATE TABLE `order_tbl` (
  `order_id` int(11) NOT NULL,
  `order_by` varchar(255) NOT NULL,
  `order_total` double NOT NULL,
  `order_address` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- insert into query for table `order_tbl`
--

INSERT INTO `order_tbl` (`order_id`, `order_by`, `order_total`, `order_address`, `created_at`) VALUES
(1, 'Vipul Chaudhary', 140000, 'Unjha,Gujarat', '2021-02-24 00:00:00'),
(2, 'Nagjibhai Chaudhary', 1299, 'Unjha,Gujarat', '2021-02-24 00:00:00'),
(3, 'Sahil', 21299, 'Ahmedabad,Gujarat', '2021-02-24 00:00:00'),
(4, 'Yash', 176000, 'Vadodara', '2021-02-24 00:00:00');


--
-- Table structure for table `product_tbl`
--

CREATE TABLE `product_tbl` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` double NOT NULL,
  `product_category` varchar(255) NOT NULL,
  `product_seller` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- insert into query for table `product_tbl`
--

INSERT INTO `product_tbl` (`product_id`, `product_name`, `product_price`, `product_category`, `product_seller`, `created_at`) VALUES
(1, 'Samsung A51', 20000, 'Mobile', 'Amazon', '2021-02-23 00:00:00'),
(2, 'Iphone X', 49000, 'Mobile', 'Amazon', '2021-02-23 00:00:00'),
(3, 'HP Laptop 8gb ram/500 gb hdd/core-i5 processor ', 56000, 'Laptop', 'Flipkart', '2021-02-23 00:00:00'),
(4, 'Boat Roackerz in ear neckband', 1299, 'Mobile Acessories', 'Amazon', '2021-02-23 00:00:00'),
(5, 'Samsung Galaxy S21 Ultra 5G', 120000, 'Mobile', 'Flipkart', '2021-02-23 00:00:00');



--
-- Primary key and Foreign Key table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`order_product_id`),
  ADD KEY `fk_order` (`order_id`),
  ADD KEY `fk_product` (`product_id`);

--
-- Primary key for table `order_tbl`
--
ALTER TABLE `order_tbl`
  ADD PRIMARY KEY (`order_id`);

--
-- Primary key for table `product_tbl`
--
ALTER TABLE `product_tbl`
  ADD PRIMARY KEY (`product_id`);



--
-- add foreign key in order and product
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `fk_order` FOREIGN KEY (`order_id`) REFERENCES `order_tbl` (`order_id`),
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `product_tbl` (`product_id`);
COMMIT;

