/*
==================================================================================
Controles de calidad
==================================================================================
Propósito del script:

Este script realiza controles de calidad para validar la integridad, la consistencia y

la precisión de la capa de datos base. Estos controles garantizan:

- La unicidad de las claves subrogadas en las tablas de dimensiones.

- La integridad referencial entre las tablas de hechos y de dimensiones.

- La validación de las relaciones en el modelo de datos para fines analíticos.

Notas de uso:

- Investigue y resuelva cualquier discrepancia detectada durante las verificaciones.

================================================================================
*/

-- ====================================================================
-- Checking 'gold.dim_customers'
-- ====================================================================
-- Check for Uniqueness of Customer Key in gold.dim_customers
-- Expectation: No results 
SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Checking 'gold.product_key'
-- ====================================================================
-- Check for Uniqueness of Product Key in gold.dim_products
-- Expectation: No results 
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Checking 'gold.fact_sales'
-- ====================================================================
-- Check the data model connectivity between fact and dimensions
SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
WHERE p.product_key IS NULL OR c.customer_key IS NULL  