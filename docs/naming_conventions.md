# **Naming Conventions**

Este documento describe las convenciones de nombres usadas para esquemas, tablas, vistas, columnas y demás objetos del data warehouse.

## **Table of Contents**

1. [General Principles](#general-principles)
2. [Table Naming Conventions](#table-naming-conventions)
   - [Bronze Rules](#bronze-rules)
   - [Silver Rules](#silver-rules)
   - [Gold Rules](#gold-rules)
3. [Column Naming Conventions](#column-naming-conventions)
   - [Surrogate Keys](#surrogate-keys)
   - [Technical Columns](#technical-columns)
4. [Stored Procedure](#stored-procedure-naming-conventions)
---

## **General Principles**

- **Convenciones de nombres**: Usar snake_case, con letras minúsculas y guiones bajos (`_`) para separar las palabras.
- **Idioma**: Usar inglés para todos los nombres.
- **Evitar palabras reservadas**: No usar palabras reservadas de SQL como nombres de objetos.

## **Table Naming Conventions**

### **Bronze Rules**
- Todos los nombres deben comenzar con el nombre del sistema fuente, y los nombres de las tablas deben coincidir con sus nombres originales, sin renombrarlas.
- **`<sourcesystem>_<entity>`**  
  - `<sourcesystem>`: Nombre del sistema fuente (p. ej., `crm`, `erp`).  
  - `<entity>`: Nombre exacto de la tabla en el sistema fuente.  
  - Ejemplo: `crm_customer_info` → Información de clientes del sistema CRM.

### **Silver Rules**
- Todos los nombres deben comenzar con el nombre del sistema fuente, y los nombres de las tablas deben coincidir con sus nombres originales, sin renombrarlas.
- **`<sourcesystem>_<entity>`**  
  - `<sourcesystem>`: Nombre del sistema fuente (p. ej., `crm`, `erp`).  
  - `<entity>`: Nombre exacto de la tabla en el sistema fuente.  
  - Ejemplo: `crm_customer_info` → Información de clientes del sistema CRM.

### **Gold Rules**
- Todas las tablas deben tener nombres significativos y alineados con el negocio, comenzando con el prefijo de su categoría.
- **`<category>_<entity>`**  
  - `<category>`: Describe el rol de la tabla, como `dim` (dimensión) o `fact` (tabla de hechos).  
  - `<entity>`: Nombre descriptivo de la tabla, alineado con el dominio de negocio (p. ej., `customers`, `products`, `sales`).  
  - Ejemplos:
    - `dim_customers` → Tabla de dimensión con los datos de clientes.  
    - `fact_sales` → Tabla de hechos con las transacciones de ventas.  

#### **Glossary of Category Patterns**

| Pattern     | Meaning                           | Example(s)                              |
|-------------|-----------------------------------|-----------------------------------------|
| `dim_`      | Tabla de dimensión               | `dim_customer`, `dim_product`           |
| `fact_`     | Tabla de hechos                  | `fact_sales`                            |
| `report_`   | Tabla de reporte                 | `report_customers`, `report_sales_monthly`   |

## **Column Naming Conventions**

### **Surrogate Keys**  
- Todas las llaves primarias de las tablas de dimensión deben usar el sufijo `_key`.
- **`<table_name>_key`**  
  - `<table_name>`: Nombre de la tabla o entidad a la que pertenece la llave.  
  - `_key`: Sufijo que indica que la columna es una llave sustituta.  
  - Ejemplo: `customer_key` → Llave sustituta de la tabla `dim_customers`.
  
### **Technical Columns**
- Todas las columnas técnicas deben comenzar con el prefijo `dwh_`, seguido de un nombre descriptivo que indique el propósito de la columna.
- **`dwh_<column_name>`**  
  - `dwh`: Prefijo reservado exclusivamente para metadatos generados por el sistema.  
  - `<column_name>`: Nombre descriptivo que indica el propósito de la columna.  
  - Ejemplo: `dwh_load_date` → Columna generada por el sistema que guarda la fecha en que se cargó el registro.
 
## **Stored Procedure**

- Todos los procedimientos almacenados que se usan para cargar datos deben seguir este patrón de nombre:
- **`load_<layer>`**.
  
  - `<layer>`: Representa la capa que se carga, como `bronze`, `silver` o `gold`.
  - Ejemplo: 
    - `load_bronze` → Procedimiento almacenado para cargar datos en la capa Bronze.
    - `load_silver` → Procedimiento almacenado para cargar datos en la capa Silver.
