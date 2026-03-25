-- ============================================================
-- PROJECT    : TerraStone Data Platform
-- FILE       : 02_dirty_data.sql
-- DESCRIPTION: Dirty and messy sample data for all source tables
-- LAYER      : Source (On-premise SQL Server)
-- AUTHOR     : TerraStone Team
-- DATE       : 2026-03-25
-- NOTE       : Data intentionally contains real-world data
--              quality issues for Silver layer cleaning practice
-- ISSUES     : Duplicates, Nulls, Wrong formats, Negative values,
--              Inconsistent casing, Junk values, Missing FK refs
-- ============================================================

USE TerraStone_Source;
GO

-- ============================================================
-- tbl_Showroom
-- Issues: duplicate records, null city, inconsistent casing
-- ============================================================
INSERT INTO tbl_Showroom VALUES (1, 'TerraStone Dubai', 'Dubai', 'UAE', 'Middle East', '2018-05-10');
INSERT INTO tbl_Showroom VALUES (2, 'TerraStone Milan', 'Milan', 'Italy', 'Europe', '2019-03-15');
INSERT INTO tbl_Showroom VALUES (3, 'terrastone mumbai', 'mumbai', 'india', 'Asia', '2020-07-01');
INSERT INTO tbl_Showroom VALUES (4, 'TERRASTONE LONDON', 'LONDON', 'UK', 'europe', '2017-11-20');
INSERT INTO tbl_Showroom VALUES (5, 'TerraStone Paris', NULL, 'France', 'Europe', NULL);
INSERT INTO tbl_Showroom VALUES (6, 'TerraStone Paris', NULL, 'France', 'Europe', NULL);         -- duplicate
INSERT INTO tbl_Showroom VALUES (7, 'TerraStone Riyadh', 'Riyadh', 'Saudi Arabia', 'Middle East', '2021-02-10');
INSERT INTO tbl_Showroom VALUES (8, 'terrastone new york', 'new york', 'usa', 'north america', '2022-06-15');
INSERT INTO tbl_Showroom VALUES (9, 'TerraStone Tokyo', 'Tokyo', 'Japan', 'Asia', '2023-01-20');
INSERT INTO tbl_Showroom VALUES (10, 'TERRASTONE SYDNEY', 'SYDNEY', 'AUSTRALIA', 'asia pacific', '2020-09-10');
INSERT INTO tbl_Showroom VALUES (11, 'TerraStone Berlin', NULL, 'Germany', 'Europe', '2019-04-05');
INSERT INTO tbl_Showroom VALUES (12, 'TerraStone Berlin', NULL, 'Germany', 'Europe', '2019-04-05');  -- duplicate
INSERT INTO tbl_Showroom VALUES (13, 'terrastone toronto', 'toronto', 'canada', NULL, '2021-08-30');
INSERT INTO tbl_Showroom VALUES (14, 'TerraStone Singapore', 'Singapore', 'Singapore', 'Asia', NULL);

-- ============================================================
-- tbl_Supplier
-- Issues: duplicates, junk email, null values, inconsistent casing
-- ============================================================
INSERT INTO tbl_Supplier VALUES (1, 'Marble World Italy', 'Italy', 'contact@marbleworld.it', 'EUR');
INSERT INTO tbl_Supplier VALUES (2, 'Stone Masters India', 'India', 'info@stonemasters.in', 'INR');
INSERT INTO tbl_Supplier VALUES (3, 'Gulf Granite LLC', 'UAE', 'sales@gulfgranite.ae', 'AED');
INSERT INTO tbl_Supplier VALUES (4, 'Global Tiles Co', 'China', 'N/A', 'USD');
INSERT INTO tbl_Supplier VALUES (5, 'Global Tiles Co', 'China', 'N/A', 'USD');                   -- duplicate
INSERT INTO tbl_Supplier VALUES (6, 'Premium Stone UK', 'UK', NULL, 'GBP');
INSERT INTO tbl_Supplier VALUES (7, 'Elite Marble Turkey', 'Turkey', 'info@elitemarble.tr', 'USD');
INSERT INTO tbl_Supplier VALUES (8, 'Asia Stone Co', 'China', 'N/A', 'CNY');
INSERT INTO tbl_Supplier VALUES (9, 'Mediterranean Marble', 'Greece', 'contact@medmarble.gr', 'EUR');
INSERT INTO tbl_Supplier VALUES (10, 'ASIA STONE CO', 'china', 'N/A', 'cny');                    -- duplicate inconsistent casing
INSERT INTO tbl_Supplier VALUES (11, 'Saudi Stone Works', 'Saudi Arabia', NULL, 'SAR');
INSERT INTO tbl_Supplier VALUES (12, 'North American Tiles', 'USA', 'sales@natiles.com', 'USD');
INSERT INTO tbl_Supplier VALUES (13, 'Aussie Granite Co', 'Australia', 'info@aussiegranite.au', 'AUD');
INSERT INTO tbl_Supplier VALUES (14, 'not available', NULL, NULL, NULL);                          -- junk record

-- ============================================================
-- tbl_Customer
-- Issues: duplicates, inconsistent casing, junk values,
--         extra spaces, null values, invalid phone numbers
-- ============================================================
INSERT INTO tbl_Customer VALUES (1, 'John Smith', 'B2C', 'Dubai', 'UAE', '+971501234567', 'john@email.com');
INSERT INTO tbl_Customer VALUES (2, 'JOHN SMITH', 'b2c', 'dubai', 'uae', '971501234567', 'john@email.com');   -- duplicate diff casing
INSERT INTO tbl_Customer VALUES (3, 'Raj Constructions', 'B2B', 'Mumbai', 'India', '000000', 'raj@constructions.in');
INSERT INTO tbl_Customer VALUES (4, 'sophia rossi', 'B2C', 'Milan', 'Italy', 'N/A', 'sophia@email.it');
INSERT INTO tbl_Customer VALUES (5, 'Ahmed Al Farsi', 'B2B', NULL, 'UAE', '+971509876543', NULL);
INSERT INTO tbl_Customer VALUES (6, 'not available', NULL, NULL, NULL, NULL, NULL);               -- junk record
INSERT INTO tbl_Customer VALUES (7, 'TerraStone London Ltd', 'B2B', 'London', 'UK', '+447911123456', 'london@terrastone.com');
INSERT INTO tbl_Customer VALUES (8, 'Mohammed Al Rashid', 'B2B', 'Riyadh', 'Saudi Arabia', '+966501234567', 'mohammed@alrashid.sa');
INSERT INTO tbl_Customer VALUES (9, 'MOHAMMED AL RASHID', 'b2b', 'riyadh', 'saudi arabia', '966501234567', 'mohammed@alrashid.sa');  -- duplicate
INSERT INTO tbl_Customer VALUES (10, 'Yuki Tanaka', 'B2C', 'Tokyo', 'Japan', '+81901234567', 'yuki@email.jp');
INSERT INTO tbl_Customer VALUES (11, 'Emily Johnson', 'B2C', 'Sydney', 'Australia', 'N/A', 'emily@email.au');
INSERT INTO tbl_Customer VALUES (12, 'Berlin Interiors GmbH', 'B2B', 'Berlin', 'Germany', '+4917612345678', 'info@berlininteriors.de');
INSERT INTO tbl_Customer VALUES (13, 'carlos mendez', 'b2c', 'toronto', 'canada', '000000', NULL);
INSERT INTO tbl_Customer VALUES (14, 'Singapore Developers Pte', 'B2B', 'Singapore', 'Singapore', '+6591234567', 'dev@sgdevelop.sg');
INSERT INTO tbl_Customer VALUES (15, 'N/A', NULL, NULL, NULL, NULL, NULL);                        -- junk record
INSERT INTO tbl_Customer VALUES (16, 'Anna Mueller', 'B2C', 'Berlin', 'Germany', '+4915112345678', 'anna@email.de');
INSERT INTO tbl_Customer VALUES (17, 'Raj Constructions', 'B2B', 'Mumbai', 'India', '000000', 'raj@constructions.in');  -- duplicate
INSERT INTO tbl_Customer VALUES (18, '  John Smith  ', 'B2C', '  Dubai  ', 'UAE', '+971501234567', 'john@email.com');   -- extra spaces
INSERT INTO tbl_Customer VALUES (19, 'Liu Wei', 'B2B', 'Shanghai', 'China', '+8613812345678', 'liu@weigroup.cn');
INSERT INTO tbl_Customer VALUES (20, 'Isabella Ferrari', 'B2C', 'Milan', 'Italy', 'not available', 'isabella@email.it');

-- ============================================================
-- tbl_Product
-- Issues: duplicates, null price, negative price, inconsistent
--         casing, unknown/junk records
-- ============================================================
INSERT INTO tbl_Product VALUES (1, 'Carrara White Marble', 'Marble', 'Floor', 250.00, 'USD', 'Italy', 1);
INSERT INTO tbl_Product VALUES (2, 'Black Galaxy Granite', 'granite', 'wall', 180.50, 'usd', 'India', 2);
INSERT INTO tbl_Product VALUES (3, 'Travertine Classic', 'Marble', 'Floor', NULL, 'EUR', 'Turkey', 1);       -- null price
INSERT INTO tbl_Product VALUES (4, 'Desert Gold Marble', 'MARBLE', 'FLOOR', -500.00, 'AED', 'UAE', 3);      -- negative price
INSERT INTO tbl_Product VALUES (5, 'Ceramic Floor Tile', 'Tile', 'Floor', 45.00, 'USD', 'China', 4);
INSERT INTO tbl_Product VALUES (6, 'Ceramic Floor Tile', 'Tile', 'Floor', 45.00, 'USD', 'China', 4);        -- duplicate
INSERT INTO tbl_Product VALUES (7, 'Porcelain Wall Tile', 'Tile', 'Wall', 60.00, 'GBP', 'UK', 6);
INSERT INTO tbl_Product VALUES (8, 'Unknown Product', NULL, NULL, NULL, NULL, NULL, NULL);                   -- junk record
INSERT INTO tbl_Product VALUES (9, 'Emperador Dark Marble', 'Marble', 'Floor', 320.00, 'EUR', 'Spain', 9);
INSERT INTO tbl_Product VALUES (10, 'EMPERADOR DARK MARBLE', 'marble', 'floor', 320.00, 'eur', 'spain', 9); -- duplicate diff casing
INSERT INTO tbl_Product VALUES (11, 'Onyx Green Marble', 'Marble', 'Wall', 450.00, 'USD', 'Turkey', 7);
INSERT INTO tbl_Product VALUES (12, 'Sandstone Beige', 'Stone', 'Outdoor', 95.00, 'AUD', 'Australia', 13);
INSERT INTO tbl_Product VALUES (13, 'Mosaic Glass Tile', 'Tile', 'Wall', 120.00, 'USD', 'China', 8);
INSERT INTO tbl_Product VALUES (14, 'Limestone Classic', 'Stone', 'Floor', NULL, 'SAR', 'Saudi Arabia', 11);
INSERT INTO tbl_Product VALUES (15, 'Norwegian Slate', 'Stone', 'Outdoor', -200.00, 'USD', 'Norway', NULL);  -- negative price
INSERT INTO tbl_Product VALUES (16, 'Italian Statuario', 'Marble', 'Floor', 580.00, 'EUR', 'Italy', 1);
INSERT INTO tbl_Product VALUES (17, 'unknown', NULL, NULL, NULL, NULL, NULL, NULL);                          -- junk record
INSERT INTO tbl_Product VALUES (18, 'Calacatta Gold Marble', 'Marble', 'Floor', 750.00, 'USD', 'Italy', 1);
INSERT INTO tbl_Product VALUES (19, 'CALACATTA GOLD MARBLE', 'MARBLE', 'FLOOR', 750.00, 'usd', 'ITALY', 1); -- duplicate
INSERT INTO tbl_Product VALUES (20, 'Basalt Black Stone', 'Stone', 'Outdoor', 110.00, 'CNY', 'China', 8);

-- ============================================================
-- tbl_Staff
-- Issues: duplicates, null values, junk records, inconsistent casing
-- ============================================================
INSERT INTO tbl_Staff VALUES (1, 'Ali Hassan', 1, 'Sales Executive', '2019-06-01');
INSERT INTO tbl_Staff VALUES (2, 'Marco Bianchi', 2, 'Manager', '2020-01-15');
INSERT INTO tbl_Staff VALUES (3, 'Priya Sharma', 3, 'sales executive', '2021-03-10');
INSERT INTO tbl_Staff VALUES (4, 'James Wilson', 4, 'MANAGER', '2018-09-05');
INSERT INTO tbl_Staff VALUES (5, 'NULL', 5, NULL, NULL);                                          -- junk name
INSERT INTO tbl_Staff VALUES (6, 'Ali Hassan', 1, 'Sales Executive', '2019-06-01');              -- duplicate
INSERT INTO tbl_Staff VALUES (7, 'Fatima Al Zahra', 2, 'Sales Executive', '2022-03-15');
INSERT INTO tbl_Staff VALUES (8, 'Kenji Watanabe', 9, 'Manager', '2023-02-01');
INSERT INTO tbl_Staff VALUES (9, 'sarah connor', 10, 'sales executive', '2021-07-20');
INSERT INTO tbl_Staff VALUES (10, 'SARAH CONNOR', 10, 'SALES EXECUTIVE', '2021-07-20');          -- duplicate diff casing
INSERT INTO tbl_Staff VALUES (11, 'Hans Müller', 11, 'Manager', '2019-05-10');
INSERT INTO tbl_Staff VALUES (12, 'Carlos Silva', 13, 'Sales Executive', NULL);
INSERT INTO tbl_Staff VALUES (13, 'Wei Chen', 14, 'manager', '2023-06-01');
INSERT INTO tbl_Staff VALUES (14, 'N/A', NULL, NULL, NULL);                                       -- junk record
INSERT INTO tbl_Staff VALUES (15, 'Emma Thompson', 4, 'Sales Executive', '2020-11-15');
INSERT INTO tbl_Staff VALUES (16, 'Fatima Al Zahra', 2, 'Sales Executive', '2022-03-15');        -- duplicate

-- ============================================================
-- tbl_Sales
-- Issues: duplicates, null values, negative amounts, wrong date
--         formats, invalid FK references, mixed payment casing
-- ============================================================
INSERT INTO tbl_Sales VALUES (1001, 1, 1, 1, 1, 10.00, 2500.00, 'USD', '2026-01-15', 'Card');
INSERT INTO tbl_Sales VALUES (1002, 3, 2, 3, 3, 5.50, 992.75, 'INR', '2026-01-18', 'Bank Transfer');
INSERT INTO tbl_Sales VALUES (1003, 4, 3, 2, 2, 8.00, NULL, 'EUR', '2026-01-20', 'Cash');        -- null amount
INSERT INTO tbl_Sales VALUES (1004, 2, 4, 1, 1, -3.00, -1500.00, 'AED', '2026-01-22', 'Card');   -- negative values
INSERT INTO tbl_Sales VALUES (1005, 5, 5, 4, 4, 20.00, 900.00, 'GBP', '15-01-2026', 'Cash');     -- wrong date format
INSERT INTO tbl_Sales VALUES (1006, 7, 7, 4, 4, 15.00, 675.00, 'GBP', '2026/01/28', 'card');     -- wrong date format
INSERT INTO tbl_Sales VALUES (1001, 1, 1, 1, 1, 10.00, 2500.00, 'USD', '2026-01-15', 'Card');    -- duplicate
INSERT INTO tbl_Sales VALUES (1007, 99, 1, 1, 1, 5.00, 1250.00, 'USD', '2026-02-01', 'Card');    -- invalid customer FK
INSERT INTO tbl_Sales VALUES (1008, 1, 99, 1, 1, 3.00, 750.00, 'USD', '2026-02-05', 'Cash');     -- invalid product FK
INSERT INTO tbl_Sales VALUES (1009, 1, 1, 1, 1, NULL, NULL, 'USD', NULL, NULL);                   -- all nulls
INSERT INTO tbl_Sales VALUES (1010, 8, 9, 7, 1, 12.00, 3840.00, 'EUR', '2026-02-10', 'Bank Transfer');
INSERT INTO tbl_Sales VALUES (1011, 10, 11, 9, 8, 6.00, 2700.00, 'USD', '2026-02-12', 'Card');
INSERT INTO tbl_Sales VALUES (1012, 11, 12, 10, 9, 25.00, 2375.00, 'AUD', '2026-02-14', 'Cash');
INSERT INTO tbl_Sales VALUES (1013, 12, 13, 11, 11, 8.00, 960.00, 'USD', '14-02-2026', 'card');   -- wrong date format
INSERT INTO tbl_Sales VALUES (1014, 14, 16, 14, 13, 10.00, NULL, 'USD', '2026-02-18', 'Bank Transfer');
INSERT INTO tbl_Sales VALUES (1015, 16, 18, 2, 2, 4.00, 2320.00, 'EUR', '2026/02/20', 'Cash');   -- wrong date format
INSERT INTO tbl_Sales VALUES (1016, 19, 20, 14, 13, 7.00, 770.00, 'CNY', '2026-02-22', 'Card');
INSERT INTO tbl_Sales VALUES (1017, 20, 16, 2, 2, 3.00, 1740.00, 'EUR', '2026-02-25', 'card');
INSERT INTO tbl_Sales VALUES (1010, 8, 9, 7, 1, 12.00, 3840.00, 'EUR', '2026-02-10', 'Bank Transfer'); -- duplicate
INSERT INTO tbl_Sales VALUES (1018, 1, 1, 1, 1, NULL, NULL, 'USD', NULL, NULL);                   -- null values
INSERT INTO tbl_Sales VALUES (1019, 17, 2, 3, 3, 5.00, 992.75, 'INR', '2026-03-01', 'Cash');
INSERT INTO tbl_Sales VALUES (1020, 5, 5, 4, 4, -5.00, -225.00, 'GBP', '2026-03-05', 'Card');    -- negative values

-- ============================================================
-- tbl_Warehouse
-- Issues: duplicates, null capacity, inconsistent casing
-- ============================================================
INSERT INTO tbl_Warehouse VALUES (1, 'Dubai Warehouse', 'Dubai', 'UAE', 50000.00);
INSERT INTO tbl_Warehouse VALUES (2, 'Mumbai Warehouse', 'mumbai', 'india', 35000.00);
INSERT INTO tbl_Warehouse VALUES (3, 'Milan Warehouse', 'Milan', 'Italy', 42000.00);
INSERT INTO tbl_Warehouse VALUES (4, 'London Warehouse', 'London', 'UK', NULL);                   -- null capacity
INSERT INTO tbl_Warehouse VALUES (5, 'Dubai Warehouse', 'Dubai', 'UAE', 50000.00);                -- duplicate
INSERT INTO tbl_Warehouse VALUES (6, 'Riyadh Warehouse', 'Riyadh', 'Saudi Arabia', 30000.00);
INSERT INTO tbl_Warehouse VALUES (7, 'Tokyo Warehouse', 'Tokyo', 'Japan', 25000.00);
INSERT INTO tbl_Warehouse VALUES (8, 'Sydney Warehouse', 'sydney', 'australia', 28000.00);
INSERT INTO tbl_Warehouse VALUES (9, 'Berlin Warehouse', 'Berlin', 'Germany', NULL);              -- null capacity
INSERT INTO tbl_Warehouse VALUES (10, 'Toronto Warehouse', 'toronto', 'canada', 32000.00);
INSERT INTO tbl_Warehouse VALUES (11, 'Singapore Warehouse', 'Singapore', 'Singapore', 40000.00);
INSERT INTO tbl_Warehouse VALUES (12, 'New York Warehouse', 'New York', 'USA', 55000.00);
INSERT INTO tbl_Warehouse VALUES (5, 'Dubai Warehouse', 'Dubai', 'UAE', 50000.00);                -- duplicate

-- ============================================================
-- tbl_Inventory
-- Issues: duplicates, negative stock, null stock, invalid FK
-- ============================================================
INSERT INTO tbl_Inventory VALUES (1, 1, 1, 500.00, 100.00, '2026-01-20 10:00:00');
INSERT INTO tbl_Inventory VALUES (2, 2, 2, 0.00, 50.00, '2026-01-20 10:00:00');
INSERT INTO tbl_Inventory VALUES (3, 3, 3, 250.00, 80.00, '2026-01-21 09:30:00');
INSERT INTO tbl_Inventory VALUES (4, 4, 1, -100.00, 60.00, '2026-01-21 09:30:00');               -- negative stock
INSERT INTO tbl_Inventory VALUES (5, 5, 4, 1200.00, 200.00, '2026-01-22 11:00:00');
INSERT INTO tbl_Inventory VALUES (6, 99, 1, 300.00, 50.00, '2026-01-22 11:00:00');               -- invalid product FK
INSERT INTO tbl_Inventory VALUES (1, 1, 1, 500.00, 100.00, '2026-01-20 10:00:00');               -- duplicate
INSERT INTO tbl_Inventory VALUES (8, 6, 5, 800.00, 150.00, '2026-01-25 08:00:00');
INSERT INTO tbl_Inventory VALUES (9, 7, 6, 0.00, 100.00, '2026-01-25 08:00:00');
INSERT INTO tbl_Inventory VALUES (10, 8, 7, 150.00, 50.00, '2026-01-26 09:00:00');
INSERT INTO tbl_Inventory VALUES (11, 9, 3, 400.00, 80.00, '2026-01-26 09:00:00');
INSERT INTO tbl_Inventory VALUES (12, 10, 1, -50.00, 60.00, '2026-01-27 10:00:00');              -- negative stock
INSERT INTO tbl_Inventory VALUES (13, 11, 8, 600.00, 120.00, '2026-01-27 10:00:00');
INSERT INTO tbl_Inventory VALUES (14, 12, 9, 350.00, 70.00, '2026-01-28 11:00:00');
INSERT INTO tbl_Inventory VALUES (15, 13, 10, 900.00, 200.00, '2026-01-28 11:00:00');
INSERT INTO tbl_Inventory VALUES (16, 14, 11, NULL, 90.00, '2026-01-29 12:00:00');               -- null stock
INSERT INTO tbl_Inventory VALUES (17, 15, 12, 750.00, 150.00, '2026-01-29 12:00:00');
INSERT INTO tbl_Inventory VALUES (18, 16, 4, 200.00, 40.00, '2026-01-30 08:00:00');
INSERT INTO tbl_Inventory VALUES (19, 17, 6, 0.00, 80.00, '2026-01-30 08:00:00');
INSERT INTO tbl_Inventory VALUES (20, 18, 2, -200.00, 100.00, '2026-01-31 09:00:00');            -- negative stock

-- ============================================================
-- tbl_Invoice
-- Issues: duplicates, negative amounts, null values,
--         invalid FK, inconsistent status casing
-- ============================================================
INSERT INTO tbl_Invoice VALUES (2001, 1, 15000.00, 'EUR', '2026-01-05', '2026-02-05', 'Paid');
INSERT INTO tbl_Invoice VALUES (2002, 2, 8500.00, 'INR', '2026-01-10', '2026-02-10', 'Pending');
INSERT INTO tbl_Invoice VALUES (2003, 3, 22000.00, 'AED', '2026-01-12', '2026-02-12', 'PAID');   -- inconsistent casing
INSERT INTO tbl_Invoice VALUES (2004, 4, -5000.00, 'USD', '2026-01-15', '2026-02-15', 'paid');   -- negative amount
INSERT INTO tbl_Invoice VALUES (2005, 99, 10000.00, 'GBP', '2026-01-18', '2026-02-18', 'Pending'); -- invalid supplier FK
INSERT INTO tbl_Invoice VALUES (2001, 1, 15000.00, 'EUR', '2026-01-05', '2026-02-05', 'Paid');   -- duplicate
INSERT INTO tbl_Invoice VALUES (2006, 1, NULL, 'EUR', NULL, NULL, NULL);                          -- all nulls
INSERT INTO tbl_Invoice VALUES (2007, 7, 18000.00, 'USD', '2026-01-20', '2026-02-20', 'Paid');
INSERT INTO tbl_Invoice VALUES (2008, 8, 12000.00, 'CNY', '2026-01-22', '2026-02-22', 'pending');
INSERT INTO tbl_Invoice VALUES (2009, 9, 25000.00, 'EUR', '2026-01-25', '2026-02-25', 'PENDING');
INSERT INTO tbl_Invoice VALUES (2010, 10, -8000.00, 'CNY', '2026-01-28', '2026-02-28', 'Overdue'); -- negative amount
INSERT INTO tbl_Invoice VALUES (2011, 11, 30000.00, 'SAR', '2026-02-01', '2026-03-01', 'Paid');
INSERT INTO tbl_Invoice VALUES (2012, 12, 9500.00, 'USD', '2026-02-05', '2026-03-05', 'PAID');
INSERT INTO tbl_Invoice VALUES (2013, 13, 14000.00, 'AUD', '2026-02-08', '2026-03-08', 'Pending');
INSERT INTO tbl_Invoice VALUES (2014, 1, NULL, 'EUR', '2026-02-10', NULL, NULL);                  -- null amount
INSERT INTO tbl_Invoice VALUES (2015, 2, 6000.00, 'INR', '2026-02-12', '2026-03-12', 'overdue');
INSERT INTO tbl_Invoice VALUES (2007, 7, 18000.00, 'USD', '2026-01-20', '2026-02-20', 'Paid');   -- duplicate
INSERT INTO tbl_Invoice VALUES (2016, 3, 19000.00, 'AED', '2026-02-15', '2026-03-15', 'Paid');
INSERT INTO tbl_Invoice VALUES (2017, 99, 5000.00, 'USD', '2026-02-18', '2026-03-18', 'Pending'); -- invalid supplier FK
