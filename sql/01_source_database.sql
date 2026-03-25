-- ============================================================
-- PROJECT    : TerraStone Data Platform
-- FILE       : 01_source_database.sql
-- DESCRIPTION: Source database and table creation script
-- LAYER      : Source (On-premise SQL Server)
-- AUTHOR     : TerraStone Team
-- DATE       : 2026-03-25
-- ============================================================

-- Create source database
CREATE DATABASE TerraStone_Source;
GO

USE TerraStone_Source;
GO

-- ============================================================
-- SYSTEM 1: SHOWROOM SALES
-- ============================================================

CREATE TABLE tbl_Showroom (
    showroom_id         INT             NOT NULL,
    showroom_name       VARCHAR(100)    NOT NULL,
    city                VARCHAR(50)         NULL,
    country             VARCHAR(50)         NULL,
    region              VARCHAR(50)         NULL,
    opening_date        DATE                NULL
);

CREATE TABLE tbl_Staff (
    staff_id            INT             NOT NULL,
    staff_name          VARCHAR(100)    NOT NULL,
    showroom_id         INT             NOT NULL,
    role                VARCHAR(50)         NULL,
    join_date           DATE                NULL
);

CREATE TABLE tbl_Customer (
    customer_id         INT             NOT NULL,
    customer_name       VARCHAR(100)    NOT NULL,
    customer_type       VARCHAR(20)         NULL,
    city                VARCHAR(50)         NULL,
    country             VARCHAR(50)         NULL,
    phone               VARCHAR(20)         NULL,
    email               VARCHAR(100)        NULL
);

CREATE TABLE tbl_Product (
    product_id          INT             NOT NULL,
    product_name        VARCHAR(100)    NOT NULL,
    category            VARCHAR(50)         NULL,
    sub_category        VARCHAR(50)         NULL,
    unit_price          DECIMAL(10,2)       NULL,
    currency            VARCHAR(10)         NULL,
    origin_country      VARCHAR(50)         NULL,
    supplier_id         INT                 NULL
);

CREATE TABLE tbl_Sales (
    order_id            INT             NOT NULL,
    customer_id         INT             NOT NULL,
    product_id          INT             NOT NULL,
    showroom_id         INT             NOT NULL,
    staff_id            INT             NOT NULL,
    quantity            DECIMAL(10,2)       NULL,
    sale_amount         DECIMAL(18,2)       NULL,
    currency            VARCHAR(10)         NULL,
    sale_date           DATE                NULL,
    payment_method      VARCHAR(20)         NULL
);

-- ============================================================
-- SYSTEM 2: INVENTORY & WAREHOUSE
-- ============================================================

CREATE TABLE tbl_Warehouse (
    warehouse_id        INT             NOT NULL,
    warehouse_name      VARCHAR(100)    NOT NULL,
    city                VARCHAR(50)         NULL,
    country             VARCHAR(50)         NULL,
    capacity_sqft       DECIMAL(10,2)       NULL
);

CREATE TABLE tbl_Inventory (
    inventory_id        INT             NOT NULL,
    product_id          INT             NOT NULL,
    warehouse_id        INT             NOT NULL,
    stock_qty           DECIMAL(10,2)       NULL,
    reorder_level       DECIMAL(10,2)       NULL,
    last_updated        DATETIME            NULL
);

-- ============================================================
-- SYSTEM 3: ERP FINANCE
-- ============================================================

CREATE TABLE tbl_Supplier (
    supplier_id         INT             NOT NULL,
    supplier_name       VARCHAR(100)    NOT NULL,
    country             VARCHAR(50)         NULL,
    contact_email       VARCHAR(100)        NULL,
    currency            VARCHAR(10)         NULL
);

CREATE TABLE tbl_Invoice (
    invoice_id          INT             NOT NULL,
    supplier_id         INT             NOT NULL,
    amount              DECIMAL(18,2)       NULL,
    currency            VARCHAR(10)         NULL,
    invoice_date        DATE                NULL,
    due_date            DATE                NULL,
    status              VARCHAR(20)         NULL
);
