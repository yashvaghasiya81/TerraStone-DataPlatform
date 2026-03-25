-- ============================================================
-- PROJECT    : TerraStone Data Platform
-- FILE       : 04_gold_tables.sql
-- DESCRIPTION: Gold layer table creation script
-- LAYER      : Gold (Fabric Warehouse)
-- AUTHOR     : TerraStone Team
-- DATE       : 2026-03-25
-- NOTE       : Run this in Fabric Warehouse (TerraStone_Warehouse)
--              Gold = star schema, aggregated, business ready
-- ============================================================

CREATE SCHEMA gold;

-- ============================================================
-- DIMENSION TABLES
-- ============================================================

CREATE TABLE gold.dim_customer (
    customer_key        INT             NOT NULL,
    customer_id         VARCHAR(50)     NOT NULL,
    customer_name       VARCHAR(100)    NOT NULL,
    customer_type       VARCHAR(20)         NULL,
    city                VARCHAR(50)         NULL,
    country             VARCHAR(50)         NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);

CREATE TABLE gold.dim_product (
    product_key         INT             NOT NULL,
    product_id          VARCHAR(50)     NOT NULL,
    product_name        VARCHAR(100)    NOT NULL,
    category            VARCHAR(50)         NULL,
    sub_category        VARCHAR(50)         NULL,
    unit_price          DECIMAL(10,2)       NULL,
    origin_country      VARCHAR(50)         NULL,
    supplier_id         VARCHAR(50)         NULL,
    valid_from          DATE                NULL,
    valid_to            DATE                NULL,
    is_current          BIT                 NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);

CREATE TABLE gold.dim_location (
    location_key        INT             NOT NULL,
    showroom_id         INT                 NULL,
    showroom_name       VARCHAR(100)        NULL,
    city                VARCHAR(50)         NULL,
    country             VARCHAR(50)         NULL,
    region              VARCHAR(50)         NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);

CREATE TABLE gold.dim_staff (
    staff_key           INT             NOT NULL,
    staff_id            INT                 NULL,
    staff_name          VARCHAR(100)        NULL,
    role                VARCHAR(50)         NULL,
    showroom_id         INT                 NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);

CREATE TABLE gold.dim_warehouse (
    warehouse_key       INT             NOT NULL,
    warehouse_id        INT                 NULL,
    warehouse_name      VARCHAR(100)        NULL,
    city                VARCHAR(50)         NULL,
    country             VARCHAR(50)         NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);

CREATE TABLE gold.dim_date (
    date_key            INT             NOT NULL,
    full_date           DATE            NOT NULL,
    day                 INT                 NULL,
    month               INT                 NULL,
    month_name          VARCHAR(20)         NULL,
    quarter             INT                 NULL,
    year                INT                 NULL,
    is_weekend          BIT                 NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);

CREATE TABLE gold.dim_currency (
    currency_key        INT             NOT NULL,
    currency_code       VARCHAR(10)     NOT NULL,
    currency_name       VARCHAR(50)         NULL,
    fx_rate_to_usd      DECIMAL(18,6)       NULL,
    rate_date           DATE                NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);

-- ============================================================
-- FACT TABLES
-- ============================================================

CREATE TABLE gold.fact_sales (
    sale_id             INT             NOT NULL,
    order_id            VARCHAR(50)     NOT NULL,
    customer_key        INT                 NULL,
    product_key         INT                 NULL,
    location_key        INT                 NULL,
    date_key            INT                 NULL,
    staff_key           INT                 NULL,
    currency_key        INT                 NULL,
    quantity            DECIMAL(10,2)       NULL,
    sale_amount         DECIMAL(18,2)       NULL,
    sale_amount_usd     DECIMAL(18,2)       NULL,
    payment_method      VARCHAR(20)         NULL,
    channel             VARCHAR(20)         NULL,
    source_system       VARCHAR(20)         NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);

CREATE TABLE gold.fact_inventory (
    inventory_id        INT             NOT NULL,
    product_key         INT                 NULL,
    warehouse_key       INT                 NULL,
    date_key            INT                 NULL,
    stock_qty           DECIMAL(10,2)       NULL,
    reorder_level       DECIMAL(10,2)       NULL,
    is_below_reorder    BIT                 NULL,
    created_at          DATETIME2(6)        NULL,
    updated_at          DATETIME2(6)        NULL
);
