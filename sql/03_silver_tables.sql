-- ============================================================
-- PROJECT    : TerraStone Data Platform
-- FILE       : 03_silver_tables.sql
-- DESCRIPTION: Silver layer table creation script
-- LAYER      : Silver (Fabric Warehouse)
-- AUTHOR     : TerraStone Team
-- DATE       : 2026-03-25
-- NOTE       : Run this in Fabric Warehouse (TerraStone_Warehouse)
--              Silver = cleaned, validated, unified data
-- ============================================================

CREATE SCHEMA silver;

-- ============================================================
-- OFFLINE SILVER TABLES
-- ============================================================

CREATE TABLE silver.customers (
    customer_key        INT             NOT NULL,
    customer_id         INT             NOT NULL,
    customer_name       VARCHAR(100)    NOT NULL,
    customer_type       VARCHAR(20)     NOT NULL,
    city                VARCHAR(50)         NULL,
    country             VARCHAR(50)         NULL,
    phone               VARCHAR(20)         NULL,
    email               VARCHAR(100)        NULL,
    source_system       VARCHAR(20)     NOT NULL,
    ingestion_date      DATE            NOT NULL,
    is_valid            BIT             NOT NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);

CREATE TABLE silver.showrooms (
    showroom_key        INT             NOT NULL,
    showroom_id         INT             NOT NULL,
    showroom_name       VARCHAR(100)    NOT NULL,
    city                VARCHAR(50)         NULL,
    country             VARCHAR(50)         NULL,
    region              VARCHAR(50)         NULL,
    opening_date        DATE                NULL,
    source_system       VARCHAR(20)     NOT NULL,
    ingestion_date      DATE            NOT NULL,
    is_valid            BIT             NOT NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);

CREATE TABLE silver.staff (
    staff_key           INT             NOT NULL,
    staff_id            INT             NOT NULL,
    staff_name          VARCHAR(100)    NOT NULL,
    showroom_id         INT             NOT NULL,
    role                VARCHAR(50)         NULL,
    join_date           DATE                NULL,
    source_system       VARCHAR(20)     NOT NULL,
    ingestion_date      DATE            NOT NULL,
    is_valid            BIT             NOT NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);

CREATE TABLE silver.products (
    product_key         INT             NOT NULL,
    product_id          INT             NOT NULL,
    product_name        VARCHAR(100)    NOT NULL,
    category            VARCHAR(50)         NULL,
    sub_category        VARCHAR(50)         NULL,
    unit_price          DECIMAL(10,2)       NULL,
    currency            VARCHAR(10)         NULL,
    origin_country      VARCHAR(50)         NULL,
    supplier_id         INT                 NULL,
    source_system       VARCHAR(20)     NOT NULL,
    ingestion_date      DATE            NOT NULL,
    valid_from          DATE                NULL,
    valid_to            DATE                NULL,
    is_current          BIT                 NULL,
    is_valid            BIT             NOT NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);

CREATE TABLE silver.sales (
    sale_key            INT             NOT NULL,
    order_id            INT             NOT NULL,
    customer_id         INT             NOT NULL,
    product_id          INT             NOT NULL,
    showroom_id         INT             NOT NULL,
    staff_id            INT             NOT NULL,
    quantity            DECIMAL(10,2)       NULL,
    sale_amount         DECIMAL(18,2)       NULL,
    sale_amount_usd     DECIMAL(18,2)       NULL,
    currency            VARCHAR(10)         NULL,
    sale_date           DATE                NULL,
    payment_method      VARCHAR(20)         NULL,
    source_system       VARCHAR(20)     NOT NULL,
    ingestion_date      DATE            NOT NULL,
    is_valid            BIT             NOT NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);

CREATE TABLE silver.inventory (
    inventory_key       INT             NOT NULL,
    inventory_id        INT             NOT NULL,
    product_id          INT             NOT NULL,
    warehouse_id        INT             NOT NULL,
    stock_qty           DECIMAL(10,2)       NULL,
    reorder_level       DECIMAL(10,2)       NULL,
    last_updated        DATETIME2(6)        NULL,
    source_system       VARCHAR(20)     NOT NULL,
    ingestion_date      DATE            NOT NULL,
    is_valid            BIT             NOT NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);

CREATE TABLE silver.warehouse (
    warehouse_key       INT             NOT NULL,
    warehouse_id        INT             NOT NULL,
    warehouse_name      VARCHAR(100)    NOT NULL,
    city                VARCHAR(50)         NULL,
    country             VARCHAR(50)         NULL,
    capacity_sqft       DECIMAL(10,2)       NULL,
    source_system       VARCHAR(20)     NOT NULL,
    ingestion_date      DATE            NOT NULL,
    is_valid            BIT             NOT NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);

CREATE TABLE silver.suppliers (
    supplier_key        INT             NOT NULL,
    supplier_id         INT             NOT NULL,
    supplier_name       VARCHAR(100)    NOT NULL,
    country             VARCHAR(50)         NULL,
    contact_email       VARCHAR(100)        NULL,
    currency            VARCHAR(10)         NULL,
    source_system       VARCHAR(20)     NOT NULL,
    ingestion_date      DATE            NOT NULL,
    is_valid            BIT             NOT NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);

CREATE TABLE silver.invoices (
    invoice_key         INT             NOT NULL,
    invoice_id          INT             NOT NULL,
    supplier_id         INT             NOT NULL,
    amount              DECIMAL(18,2)       NULL,
    amount_usd          DECIMAL(18,2)       NULL,
    currency            VARCHAR(10)         NULL,
    invoice_date        DATE                NULL,
    due_date            DATE                NULL,
    status              VARCHAR(20)         NULL,
    source_system       VARCHAR(20)     NOT NULL,
    ingestion_date      DATE            NOT NULL,
    is_valid            BIT             NOT NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);

-- ============================================================
-- ONLINE SILVER TABLES
-- ============================================================

CREATE TABLE silver.online_sales (
    sale_key            INT             NOT NULL,
    order_id            VARCHAR(50)     NOT NULL,
    customer_id         VARCHAR(50)         NULL,
    product_id          VARCHAR(50)         NULL,
    quantity            DECIMAL(10,2)       NULL,
    amount              DECIMAL(18,2)       NULL,
    amount_usd          DECIMAL(18,2)       NULL,
    currency            VARCHAR(10)         NULL,
    order_date          DATE                NULL,
    country             VARCHAR(50)         NULL,
    channel             VARCHAR(20)         NULL,
    source_system       VARCHAR(20)     NOT NULL,
    ingestion_date      DATE            NOT NULL,
    is_valid            BIT             NOT NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);

CREATE TABLE silver.fx_rates (
    fx_key              INT             NOT NULL,
    base_currency       VARCHAR(10)     NOT NULL,
    target_currency     VARCHAR(10)     NOT NULL,
    rate                DECIMAL(18,6)       NULL,
    rate_date           DATE            NOT NULL,
    source_system       VARCHAR(20)     NOT NULL,
    ingestion_date      DATE            NOT NULL,
    is_valid            BIT             NOT NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);

CREATE TABLE silver.product_catalogue (
    catalogue_key       INT             NOT NULL,
    sku_id              VARCHAR(50)     NOT NULL,
    product_name        VARCHAR(100)        NULL,
    category            VARCHAR(50)         NULL,
    sub_category        VARCHAR(50)         NULL,
    unit_price          DECIMAL(10,2)       NULL,
    origin_country      VARCHAR(50)         NULL,
    supplier_id         VARCHAR(50)         NULL,
    source_system       VARCHAR(20)     NOT NULL,
    ingestion_date      DATE            NOT NULL,
    is_valid            BIT             NOT NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);
