-- 📦 Supply Chain Analytics - Snowflake SQL

-- 1️⃣ Preview raw data
SELECT *
FROM SUPPLY_CHAIN_DB.PUBLIC.SHIPMENTS
LIMIT 10;


-- 2️⃣ Calculate key metrics
SELECT 
    order_id,
    supplier_name,
    order_date,
    shipment_date,
    delivery_date,
    expected_delivery_date,

    -- Fulfillment Time (order → delivery)
    DATEDIFF(day, order_date, delivery_date) AS fulfillment_days,

    -- Shipping Time (order → shipment)
    DATEDIFF(day, order_date, shipment_date) AS shipping_days,

    -- Delivery Delay
    DATEDIFF(day, expected_delivery_date, delivery_date) AS delay_days,

    quantity,
    inventory_days,
    cost

FROM SUPPLY_CHAIN_DB.PUBLIC.SHIPMENTS;


-- 3️⃣ Create analytics view
CREATE OR REPLACE VIEW SUPPLY_CHAIN_DB.PUBLIC.SUPPLY_CHAIN_METRICS AS
SELECT 
    order_id,
    supplier_name,
    order_date,
    shipment_date,
    delivery_date,
    expected_delivery_date,

    DATEDIFF(day, order_date, delivery_date) AS fulfillment_days,
    DATEDIFF(day, order_date, shipment_date) AS shipping_days,
    DATEDIFF(day, expected_delivery_date, delivery_date) AS delay_days,

    -- Delivery Status Classification
    CASE 
        WHEN DATEDIFF(day, expected_delivery_date, delivery_date) > 0 THEN 'Delayed'
        WHEN DATEDIFF(day, expected_delivery_date, delivery_date) = 0 THEN 'On Time'
        ELSE 'Early'
    END AS delay_status,
    
    quantity,
    inventory_days,
    cost

FROM SUPPLY_CHAIN_DB.PUBLIC.SHIPMENTS;


-- 4️⃣ View transformed data
SELECT * 
FROM SUPPLY_CHAIN_DB.PUBLIC.SUPPLY_CHAIN_METRICS;


-- 5️⃣ Supplier performance analysis
SELECT 
    supplier_name,
    COUNT(*) AS total_orders,
    AVG(delay_days) AS avg_delay,
    AVG(fulfillment_days) AS avg_fulfillment_time
FROM SUPPLY_CHAIN_DB.PUBLIC.SUPPLY_CHAIN_METRICS
GROUP BY supplier_name
ORDER BY avg_delay DESC;