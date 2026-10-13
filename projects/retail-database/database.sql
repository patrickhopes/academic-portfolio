CREATE TABLE supplier (
supplier_id INT AUTO_INCREMENT PRIMARY KEY,
supplier_name VARCHAR(100) NOT NULL,
supplier_location VARCHAR(150)
) ENGINE=InnoDB;

CREATE TABLE category (
category_id INT AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(100) NOT NULL,
category_description VARCHAR(255)
) ENGINE=InnoDB;

CREATE TABLE warranty (
warranty_id INT AUTO_INCREMENT PRIMARY KEY,
warranty_name VARCHAR(100) NOT NULL,
duration_months INT NOT NULL,
CONSTRAINT chk_warranty_duration
CHECK (duration_months > 0)
) ENGINE=InnoDB;

CREATE TABLE store (
store_id INT AUTO_INCREMENT PRIMARY KEY,
store_name VARCHAR(100) NOT NULL,
store_location VARCHAR(150)
) ENGINE=InnoDB;

CREATE TABLE customer (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
phone_number VARCHAR(20),
email VARCHAR(255),
UNIQUE KEY uq_customer_email (email)
) ENGINE=InnoDB;

CREATE TABLE employee (
employee_id INT AUTO_INCREMENT PRIMARY KEY,
store_id INT NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
role VARCHAR(50),
CONSTRAINT fk_employee_store
FOREIGN KEY (store_id)
REFERENCES store (store_id)
ON UPDATE CASCADE
ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE product (
product_id INT AUTO_INCREMENT PRIMARY KEY,
supplier_id INT NOT NULL,
category_id INT NOT NULL,
warranty_id INT NOT NULL,
product_name VARCHAR(120) NOT NULL,
product_price DECIMAL(10,2) NOT NULL,
product_description VARCHAR(500),
CONSTRAINT chk_product_price
CHECK (product_price > 0),
CONSTRAINT fk_product_supplier
FOREIGN KEY (supplier_id)
REFERENCES supplier (supplier_id)
ON UPDATE CASCADE
ON DELETE RESTRICT,
CONSTRAINT fk_product_category
FOREIGN KEY (category_id)
REFERENCES category (category_id)
ON UPDATE CASCADE
ON DELETE RESTRICT,
CONSTRAINT fk_product_warranty
FOREIGN KEY (warranty_id)
REFERENCES warranty (warranty_id)
ON UPDATE CASCADE
ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
store_id INT NOT NULL,
customer_id INT NOT NULL,
order_date DATE NOT NULL,
total_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
CONSTRAINT fk_orders_store
FOREIGN KEY (store_id)
REFERENCES store (store_id)
ON UPDATE CASCADE
ON DELETE RESTRICT,
CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id)
REFERENCES customer (customer_id)
ON UPDATE CASCADE
ON DELETE RESTRICT,
CONSTRAINT chk_orders_total_amount
CHECK (total_amount >= 0)
) ENGINE=InnoDB;

CREATE TABLE order_data (
order_id INT NOT NULL,
product_id INT NOT NULL,
quantity_ordered INT NOT NULL,
unit_price_at_sale DECIMAL(10,2) NOT NULL,
PRIMARY KEY (order_id, product_id),
CONSTRAINT chk_order_data_quantity
CHECK (quantity_ordered > 0),
CONSTRAINT chk_order_data_price
CHECK (unit_price_at_sale > 0),
CONSTRAINT fk_order_data_order
FOREIGN KEY (order_id)
REFERENCES orders (order_id)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT fk_order_data_product
FOREIGN KEY (product_id)
REFERENCES product (product_id)
ON UPDATE CASCADE
ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE product_return (
return_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT NOT NULL,
product_id INT NOT NULL,
quantity_returned INT NOT NULL,
return_date DATE NOT NULL,
refund_amount DECIMAL(10,2) NOT NULL,
CONSTRAINT chk_return_quantity
CHECK (quantity_returned > 0),
CONSTRAINT chk_return_refund
CHECK (refund_amount >= 0),
CONSTRAINT fk_return_order_data
FOREIGN KEY (order_id, product_id)
REFERENCES order_data (order_id, product_id)
ON UPDATE CASCADE
ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE service (
service_id INT AUTO_INCREMENT PRIMARY KEY,
service_category VARCHAR(100) NOT NULL,
service_date DATE NOT NULL,
customer_id INT NOT NULL,
store_id INT NOT NULL,
employee_id INT NOT NULL,
CONSTRAINT fk_service_customer
FOREIGN KEY (customer_id)
REFERENCES customer (customer_id)
ON UPDATE CASCADE
ON DELETE RESTRICT,
CONSTRAINT fk_service_store
FOREIGN KEY (store_id)
REFERENCES store (store_id)
ON UPDATE CASCADE
ON DELETE RESTRICT,
CONSTRAINT fk_service_employee
FOREIGN KEY (employee_id)
REFERENCES employee (employee_id)
ON UPDATE CASCADE
ON DELETE RESTRICT
) ENGINE=InnoDB;

INSERT INTO `supplier` (`supplier_id`, `supplier_name`, `supplier_location`) VALUES
(1, 'Apex Components Ltd', 'Seattle, WA'),
(2, 'Northline Distributors', 'Portland, OR'),
(3, 'BluePeak Electronics', 'San Jose, CA'),
(4, 'Summit Tech Wholesale', 'Denver, CO'),
(5, 'Evergreen Consumer Supply', 'Austin, TX'),
(6, 'MetroParts Trading', 'Chicago, IL'),
(7, 'Horizon Appliance Supply', 'Atlanta, GA'),
(8, 'Quantum Logistics Supply', 'Dallas, TX'),
(9, 'Meridian Tech Imports', 'Newark, NJ'),
(10, 'Beacon Product Group', 'Phoenix, AZ'),
(11, 'Prime Source Solutions', 'Nashville, TN'),
(12, 'SilverLeaf Hardware', 'Charlotte, NC'),
(13, 'Nova Retail Partners', 'Miami, FL'),
(14, 'Vertex Global Supply', 'San Diego, CA'),
(15, 'Urban Circuit Supply', 'Los Angeles, CA');

SELECT * FROM supplier;

INSERT INTO `category` (`category_id`, `category_name`, `category_description`) VALUES
(1, 'Laptops', 'Portable computers for work, study, and everyday productivity.'),
(2, 'Tablets', 'Touchscreen devices for mobile browsing, media, and note-taking.'),
(3, 'Audio', 'Headphones, speakers, and sound accessories for personal and home use.'),
(4, 'Networking', 'Routers, mesh systems, and connectivity hardware for home offices.'),
(5, 'Displays', 'Monitors and screens for productivity, gaming, and retail setups.'),
(6, 'Peripherals', 'Input devices and desk accessories for computers and workstations.'),
(7, 'Storage', 'Solid-state drives, memory cards, and backup devices.'),
(8, 'Wearables', 'Smartwatches and fitness devices for health and productivity.'),
(9, 'Home Appliances', 'Small appliances and household convenience products.'),
(10, 'Smart Home', 'Connected devices for home automation and monitoring.'),
(11, 'Office Equipment', 'Printers, scanners, and related office hardware.'),
(12, 'Gaming', 'Gaming accessories and performance-focused hardware.'),
(13, 'Mobile Accessories', 'Cases, chargers, docks, and phone accessories.'),
(14, 'Power Accessories', 'Power banks, adapters, and charging solutions.'),
(15, 'Cables and Adapters', 'Data and power cables for modern device connectivity.');

SELECT * FROM category;

INSERT INTO `warranty` (`warranty_id`, `warranty_name`, `duration_months`) VALUES
(1, 'Standard Coverage', 12),
(2, 'Extended Coverage', 24),
(3, 'Premium Protection', 36),
(4, 'Accidental Damage Plan', 12),
(5, 'Business Protection', 24),
(6, 'Device Care Plus', 18),
(7, 'Replacement Plan', 6),
(8, 'Appliance Care', 24),
(9, 'Audio Care', 12),
(10, 'Smart Home Care', 18),
(11, 'Storage Shield', 36),
(12, 'Office Care', 24),
(13, 'Gaming Care', 24),
(14, 'Mobile Care', 12),
(15, 'Power Care', 12);

SELECT * FROM warranty;

INSERT INTO `store` (`store_id`, `store_name`, `store_location`) VALUES
(1, 'Northgate Tech Center', 'Seattle, WA'),
(2, 'Lakeside Retail Hub', 'Portland, OR'),
(3, 'Downtown Device Store', 'San Francisco, CA'),
(4, 'Riverfront Electronics', 'Denver, CO'),
(5, 'Midtown Market Tech', 'Dallas, TX'),
(6, 'Westfield Commons', 'Phoenix, AZ'),
(7, 'Harbor Point Retail', 'San Diego, CA'),
(8, 'Oakwood Square', 'Atlanta, GA'),
(9, 'Summit Crossing', 'Chicago, IL'),
(10, 'Prairie View Tech', 'Minneapolis, MN'),
(11, 'Belmont Station', 'Austin, TX'),
(12, 'Pinecrest Outlet', 'Miami, FL'),
(13, 'Hillcrest Plaza', 'Charlotte, NC'),
(14, 'Union Square Tech', 'New York, NY'),
(15, 'Cedar Park Electronics', 'Nashville, TN');

SELECT * FROM store;

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `phone_number`, `email`) VALUES
(1, 'Olivia', 'Reed', '206-555-0111', 'olivia.reed@example.com'),
(2, 'Ethan', 'Brooks', '503-555-0112', 'ethan.brooks@example.com'),
(3, 'Maya', 'Patel', '415-555-0113', 'maya.patel@example.com'),
(4, 'Noah', 'Carter', '303-555-0114', 'noah.carter@example.com'),
(5, 'Sophia', 'Nguyen', '214-555-0115', 'sophia.nguyen@example.com'),
(6, 'Liam', 'Mitchell', '602-555-0116', 'liam.mitchell@example.com'),
(7, 'Ava', 'Jackson', '619-555-0117', 'ava.jackson@example.com'),
(8, 'Lucas', 'Turner', '404-555-0118', 'lucas.turner@example.com'),
(9, 'Emma', 'Walker', '312-555-0119', 'emma.walker@example.com'),
(10, 'Jackson', 'Hughes', '612-555-0120', 'jackson.hughes@example.com'),
(11, 'Isabella', 'Foster', '512-555-0121', 'isabella.foster@example.com'),
(12, 'Mason', 'Price', '305-555-0122', 'mason.price@example.com'),
(13, 'Amelia', 'Ross', '704-555-0123', 'amelia.ross@example.com'),
(14, 'Logan', 'Bell', '212-555-0124', 'logan.bell@example.com'),
(15, 'Harper', 'Ward', '615-555-0125', 'harper.ward@example.com');

SELECT * FROM customer;

INSERT INTO `employee` (`employee_id`, `store_id`, `first_name`, `last_name`, `role`) VALUES
(1, 1, 'Grace', 'Holt', 'Store Manager'),
(2, 2, 'Daniel', 'Kim', 'Sales Associate'),
(3, 3, 'Priya', 'Shah', 'Service Advisor'),
(4, 4, 'Aiden', 'Cooper', 'Technician'),
(5, 5, 'Zoe', 'Bennett', 'Cashier'),
(6, 6, 'Caleb', 'Reyes', 'Inventory Specialist'),
(7, 7, 'Nora', 'Phillips', 'Product Specialist'),
(8, 8, 'Owen', 'Diaz', 'Support Specialist'),
(9, 9, 'Layla', 'Morgan', 'Assistant Manager'),
(10, 10, 'Henry', 'Cole', 'Repair Technician'),
(11, 11, 'Mila', 'Simmons', 'Front Desk'),
(12, 12, 'Jack', 'Murphy', 'Operations Lead'),
(13, 13, 'Chloe', 'Howard', 'Sales Associate'),
(14, 14, 'Ryan', 'Ward', 'Delivery Coordinator'),
(15, 15, 'Ella', 'Brooks', 'Store Manager');

SELECT * FROM employee;

INSERT INTO `product` (`product_id`, `supplier_id`, `category_id`, `warranty_id`, `product_name`, `product_price`, `product_description`) VALUES
(1, 3, 1, 2, 'AuroraBook 14 Laptop', 1299.00, '14-inch lightweight laptop with fast SSD storage and all-day battery life.'),
(2, 3, 1, 3, 'AuroraBook 16 Laptop', 1599.00, '16-inch performance laptop for business users and power multitaskers.'),
(3, 5, 2, 1, 'NovaTab 11 Tablet', 499.00, 'Compact tablet for streaming, browsing, and note-taking on the go.'),
(4, 15, 3, 9, 'PulseBeat Wireless Headphones', 149.00, 'Bluetooth over-ear headphones with active noise cancellation.'),
(5, 4, 4, 10, 'HaloLink Mesh Router', 179.00, 'Dual-band mesh router kit for strong whole-home Wi-Fi coverage.'),
(6, 14, 5, 12, 'PrismView 27 Monitor', 249.00, '27-inch IPS monitor with crisp color and adjustable stand.'),
(7, 6, 6, 14, 'ForgeKey Mechanical Keyboard', 89.99, 'Mechanical keyboard with tactile switches and programmable shortcuts.'),
(8, 6, 6, 14, 'GlidePro Wireless Mouse', 39.99, 'Ergonomic wireless mouse with silent clicks and long battery life.'),
(9, 2, 7, 11, 'TitanVault 1TB SSD', 119.99, 'High-speed solid-state drive for laptops, desktops, and backups.'),
(10, 7, 8, 6, 'OrbitFit Smartwatch', 199.99, 'Fitness smartwatch with heart-rate tracking and sleep analytics.'),
(11, 7, 10, 6, 'LumaAir Smart Plug', 24.99, 'Connected plug for scheduling lamps, fans, and appliances.'),
(12, 8, 9, 8, 'BreezeLine Coffee Maker', 99.99, 'Programmable coffee maker with auto shutoff and thermal carafe.'),
(13, 10, 9, 8, 'FreshWave Air Purifier', 229.99, 'Quiet air purifier designed for bedrooms and medium-size rooms.'),
(14, 1, 11, 5, 'ClearPrint Laser Printer', 279.00, 'Compact monochrome printer for offices and home workspaces.'),
(15, 11, 14, 15, 'PowerCell 20K Power Bank', 49.99, 'Portable 20000mAh power bank with USB-C fast charging.');

SELECT * FROM product;

INSERT INTO `orders` (`order_id`, `store_id`, `customer_id`, `order_date`, `total_amount`) VALUES
(1, 1, 3, '2025-01-05', 2468.10),
(2, 2, 6, '2025-01-07', 4317.30),
(3, 3, 9, '2025-01-09', 499.00),
(4, 4, 12, '2025-01-11', 292.04),
(5, 5, 15, '2025-01-13', 537.00),
(6, 6, 3, '2025-01-15', 236.55),
(7, 7, 6, '2025-01-17', 161.98),
(8, 8, 9, '2025-01-19', 119.97),
(9, 9, 12, '2025-01-21', 117.59),
(10, 10, 15, '2025-01-23', 399.98),
(11, 11, 3, '2025-01-25', 71.22),
(12, 12, 6, '2025-01-27', 89.99),
(13, 13, 9, '2025-01-29', 459.98),
(14, 14, 12, '2025-01-31', 820.26),
(15, 15, 15, '2025-02-02', 49.99),
(16, 1, 3, '2025-02-04', 2468.10),
(17, 2, 6, '2025-02-06', 4317.30),
(18, 3, 9, '2025-02-08', 499.00),
(19, 4, 12, '2025-02-10', 292.04),
(20, 5, 15, '2025-02-12', 537.00),
(21, 6, 3, '2025-02-14', 236.55),
(22, 7, 6, '2025-02-16', 161.98),
(23, 8, 9, '2025-02-18', 119.97),
(24, 9, 12, '2025-02-20', 117.59),
(25, 10, 15, '2025-02-22', 399.98),
(26, 11, 3, '2025-02-24', 71.22),
(27, 12, 6, '2025-02-26', 89.99),
(28, 13, 9, '2025-02-28', 459.98),
(29, 14, 12, '2025-03-02', 820.26),
(30, 15, 15, '2025-03-04', 49.99),
(31, 1, 3, '2025-03-06', 2468.10),
(32, 2, 6, '2025-03-08', 4317.30),
(33, 3, 9, '2025-03-10', 499.00),
(34, 4, 12, '2025-03-12', 292.04),
(35, 5, 15, '2025-03-14', 537.00),
(36, 6, 3, '2025-03-16', 236.55),
(37, 7, 6, '2025-03-18', 161.98),
(38, 8, 9, '2025-03-20', 119.97),
(39, 9, 12, '2025-03-22', 117.59),
(40, 10, 15, '2025-03-24', 399.98);

SELECT * FROM orders;

INSERT INTO `order_data` (`order_id`, `product_id`, `quantity_ordered`, `unit_price_at_sale`) VALUES
(1, 1, 2, 1234.05),
(2, 2, 3, 1439.10),
(3, 3, 1, 499.00),
(4, 4, 2, 146.02),
(5, 5, 3, 179.00),
(6, 6, 1, 236.55),
(7, 7, 2, 80.99),
(8, 8, 3, 39.99),
(9, 9, 1, 117.59),
(10, 10, 2, 199.99),
(11, 11, 3, 23.74),
(12, 12, 1, 89.99),
(13, 13, 2, 229.99),
(14, 14, 3, 273.42),
(15, 15, 1, 49.99),
(16, 1, 2, 1234.05),
(17, 2, 3, 1439.10),
(18, 3, 1, 499.00),
(19, 4, 2, 146.02),
(20, 5, 3, 179.00),
(21, 6, 1, 236.55),
(22, 7, 2, 80.99),
(23, 8, 3, 39.99),
(24, 9, 1, 117.59),
(25, 10, 2, 199.99),
(26, 11, 3, 23.74),
(27, 12, 1, 89.99),
(28, 13, 2, 229.99),
(29, 14, 3, 273.42),
(30, 15, 1, 49.99),
(31, 1, 2, 1234.05),
(32, 2, 3, 1439.10),
(33, 3, 1, 499.00),
(34, 4, 2, 146.02),
(35, 5, 3, 179.00),
(36, 6, 1, 236.55),
(37, 7, 2, 80.99),
(38, 8, 3, 39.99),
(39, 9, 1, 117.59),
(40, 10, 2, 199.99);

SELECT * FROM order_data;

INSERT INTO `product_return` (`return_id`, `order_id`, `product_id`, `quantity_returned`, `return_date`, `refund_amount`) VALUES
(1, 1, 1, 1, '2025-01-09', 1234.05),
(2, 2, 2, 1, '2025-01-12', 1439.10),
(3, 3, 3, 1, '2025-01-15', 499.00),
(4, 4, 4, 2, '2025-01-18', 292.04),
(5, 5, 5, 1, '2025-01-21', 179.00),
(6, 6, 6, 1, '2025-01-24', 236.55),
(7, 7, 7, 1, '2025-01-27', 80.99),
(8, 8, 8, 3, '2025-01-30', 119.97),
(9, 9, 9, 1, '2025-02-02', 117.59),
(10, 10, 10, 1, '2025-02-05', 199.99),
(11, 11, 11, 1, '2025-02-08', 23.74),
(12, 12, 12, 1, '2025-01-30', 89.99),
(13, 13, 13, 1, '2025-02-02', 229.99),
(14, 14, 14, 1, '2025-02-05', 273.42),
(15, 15, 15, 1, '2025-02-08', 49.99),
(16, 16, 1, 2, '2025-02-11', 2468.10),
(17, 17, 2, 1, '2025-02-14', 1439.10),
(18, 18, 3, 1, '2025-02-17', 499.00),
(19, 19, 4, 1, '2025-02-20', 146.02),
(20, 20, 5, 3, '2025-02-23', 537.00),
(21, 21, 6, 1, '2025-02-26', 236.55),
(22, 22, 7, 1, '2025-03-01', 80.99),
(23, 23, 8, 1, '2025-03-04', 39.99),
(24, 24, 9, 1, '2025-02-23', 117.59),
(25, 25, 10, 1, '2025-02-26', 199.99),
(26, 26, 11, 1, '2025-03-01', 23.74),
(27, 27, 12, 1, '2025-03-04', 89.99),
(28, 28, 13, 2, '2025-03-07', 459.98),
(29, 29, 14, 1, '2025-03-10', 273.42),
(30, 30, 15, 1, '2025-03-13', 49.99),
(31, 31, 1, 1, '2025-03-16', 1234.05),
(32, 32, 2, 3, '2025-03-19', 4317.30),
(33, 33, 3, 1, '2025-03-22', 499.00),
(34, 34, 4, 1, '2025-03-25', 146.02),
(35, 35, 5, 1, '2025-03-28', 179.00),
(36, 36, 6, 1, '2025-03-19', 236.55),
(37, 37, 7, 1, '2025-03-22', 80.99),
(38, 38, 8, 1, '2025-03-25', 39.99),
(39, 39, 9, 1, '2025-03-28', 117.59),
(40, 40, 10, 2, '2025-03-31', 399.98);

SELECT * FROM product_return;

INSERT INTO `service` (`service_id`, `service_category`, `service_date`, `customer_id`, `store_id`, `employee_id`) VALUES
(1, 'Setup', '2025-01-08', 3, 1, 1),
(2, 'Diagnostics', '2025-01-11', 6, 2, 2),
(3, 'Repair', '2025-01-14', 9, 3, 3),
(4, 'Installation', '2025-01-17', 12, 4, 4),
(5, 'Warranty Claim', '2025-01-15', 15, 5, 5),
(6, 'Data Transfer', '2025-01-18', 3, 6, 6),
(7, 'Software Support', '2025-01-21', 6, 7, 7),
(8, 'Cleaning', '2025-01-24', 9, 8, 8),
(9, 'Calibration', '2025-01-27', 12, 9, 9),
(10, 'Upgrade Consultation', '2025-01-25', 15, 10, 10),
(11, 'Setup', '2025-01-28', 3, 11, 11),
(12, 'Diagnostics', '2025-01-31', 6, 12, 12),
(13, 'Repair', '2025-02-03', 9, 13, 13),
(14, 'Installation', '2025-02-06', 12, 14, 14),
(15, 'Warranty Claim', '2025-02-04', 15, 15, 15),
(16, 'Data Transfer', '2025-02-07', 3, 1, 1),
(17, 'Software Support', '2025-02-10', 6, 2, 2),
(18, 'Cleaning', '2025-02-13', 9, 3, 3),
(19, 'Calibration', '2025-02-16', 12, 4, 4),
(20, 'Upgrade Consultation', '2025-02-14', 15, 5, 5),
(21, 'Setup', '2025-02-17', 3, 6, 6),
(22, 'Diagnostics', '2025-02-20', 6, 7, 7),
(23, 'Repair', '2025-02-23', 9, 8, 8),
(24, 'Installation', '2025-02-26', 12, 9, 9),
(25, 'Warranty Claim', '2025-02-24', 15, 10, 10),
(26, 'Data Transfer', '2025-02-27', 3, 11, 11),
(27, 'Software Support', '2025-03-02', 6, 12, 12),
(28, 'Cleaning', '2025-03-05', 9, 13, 13),
(29, 'Calibration', '2025-03-08', 12, 14, 14),
(30, 'Upgrade Consultation', '2025-03-06', 15, 15, 15),
(31, 'Setup', '2025-03-09', 3, 1, 1),
(32, 'Diagnostics', '2025-03-12', 6, 2, 2),
(33, 'Repair', '2025-03-15', 9, 3, 3),
(34, 'Installation', '2025-03-18', 12, 4, 4),
(35, 'Warranty Claim', '2025-03-16', 15, 5, 5),
(36, 'Data Transfer', '2025-03-19', 3, 6, 6),
(37, 'Software Support', '2025-03-22', 6, 7, 7),
(38, 'Cleaning', '2025-03-25', 9, 8, 8),
(39, 'Calibration', '2025-03-28', 12, 9, 9),
(40, 'Upgrade Consultation', '2025-03-26', 15, 10, 10);

SELECT * FROM service;

#Store sales report showing units sold, total orders, and gross sales per store
SELECT
    s.store_id,
    s.store_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(od.quantity_ordered) AS total_units_sold,
    SUM(od.quantity_ordered * od.unit_price_at_sale) AS gross_sales
FROM store s
JOIN orders o ON o.store_id = s.store_id
JOIN order_data od ON od.order_id = o.order_id
GROUP BY s.store_id, s.store_name
ORDER BY gross_sales DESC;