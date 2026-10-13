# Requerimientos del proyecto

## 1. Contexto
La empresa registra su información de ventas en dos sistemas independientes, un **CRM** y un **ERP**. Hoy los datos están dispersos, con formatos distintos y problemas de calidad, lo que dificulta construir reportes confiables. El proyecto busca centralizarlos en un data warehouse que sirva como única fuente de verdad para el análisis.

## 2. Objetivos

### 2.1 Ingeniería de datos
Construir un data warehouse moderno en **SQL Server** que consolide los datos de ventas de ambos sistemas y los deje listos para reportes analíticos y toma de decisiones.

### 2.2 Analítica y BI
Desarrollar análisis en SQL que permitan entender:
- **Comportamiento de clientes:** quiénes compran, cuánto y con qué frecuencia.
- **Desempeño de productos:** qué productos y categorías generan más ventas.
- **Tendencias de ventas:** cómo evolucionan las ventas en el tiempo.

## 3. Fuentes de datos
Los datos llegan como archivos CSV ubicados en `datasets/`.

| Sistema | Archivo | Contenido |
|---------|---------|-----------|
| CRM | `source_crm/cust_info.csv` | Información principal de clientes |
| CRM | `source_crm/prd_info.csv` | Información de productos e historial de costos |
| CRM | `source_crm/sales_details.csv` | Detalle transaccional de ventas |
| ERP | `source_erp/CUST_AZ12.csv` | Datos adicionales de clientes (fecha de nacimiento, género) |
| ERP | `source_erp/LOC_A101.csv` | Ubicación (país) de los clientes |
| ERP | `source_erp/PX_CAT_G1V2.csv` | Categorías, subcategorías y mantenimiento de productos |

## 4. Especificaciones

| # | Requerimiento | Detalle |
|---|---------------|---------|
| R1 | Ingesta | Cargar los seis archivos CSV en SQL Server sin modificar su contenido original. |
| R2 | Calidad de datos | Limpiar y corregir los problemas de calidad (duplicados, nulos, espacios, códigos inconsistentes, fechas inválidas) antes del análisis. |
| R3 | Integración | Combinar ambas fuentes en un único modelo de datos, fácil de consultar y orientado al negocio. |
| R4 | Alcance temporal | Trabajar solo con la versión más reciente de los datos; no se requiere historización. |
| R5 | Arquitectura | Organizar el warehouse en capas Medallion: `bronze`, `silver` y `gold`. |
| R6 | Modelado | Exponer la capa `gold` como un esquema estrella con dimensiones de clientes y productos, y una tabla de hechos de ventas. |
| R7 | Documentación | Documentar el modelo de datos (catálogo, diagramas y convenciones) para usuarios de negocio y equipos de análisis. |
| R8 | Versionamiento | Mantener todo el código y la documentación en un repositorio Git. |

## 5. Fuera de alcance
- Cargas incrementales o en tiempo real.
- Historial de cambios (dimensiones lentamente cambiantes).
- Orquestación automática o programada de las cargas.
- Construcción de tableros en herramientas de BI (el análisis se hace en SQL).

## 6. Entregables

| Entregable | Ubicación |
|------------|-----------|
| Script de creación de base de datos y esquemas | `scripts/init_database.sql` |
| DDL y procedimiento de carga de Bronze | `scripts/bronze/` |
| DDL y procedimiento de carga de Silver | `scripts/silver/` |
| Vistas del esquema estrella | `scripts/gold/` |
| Pruebas de calidad de Silver y Gold | `tests/` |
| Diagramas de arquitectura, flujo, integración y modelo | `docs/` |
| Catálogo de datos | `docs/data_catalog.md` |
| Convenciones de nombres | `docs/naming_conventions.md` |

## 7. Criterios de aceptación
- Los procedimientos `bronze.load_bronze` y `silver.load_silver` se ejecutan de punta a punta sin errores.
- El número de filas cargadas en Bronze coincide con el de cada archivo fuente.
- Las pruebas de calidad de `tests/` devuelven cero filas con problemas.
- Cada venta de `gold.fact_sales` encuentra su cliente y su producto en las dimensiones.
- Las vistas de `gold` responden consultas de clientes, productos y tendencias de ventas.
